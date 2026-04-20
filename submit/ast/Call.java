/*
 * Code formatter project
 * CS 4481
 */
package submit.ast;

import submit.MIPSResult;
import submit.MIPS;
import submit.RegisterAllocator;
import submit.SymbolTable;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author edwajohn
 */
public class Call extends Expression {

  private final String id;
  private final List<Expression> args;

  public Call(String id, List<Expression> args) {
    this.id = id;
    this.args = new ArrayList<>(args);
  }

  @Override
  public void toCminus(StringBuilder builder, String prefix) {
    builder.append(id).append("(");
    for (Expression arg : args) {
      arg.toCminus(builder, prefix);
      builder.append(", ");
    }
    if (!args.isEmpty()) {
      builder.setLength(builder.length() - 2);
    }
    builder.append(")");
  }

  @Override
  public MIPSResult toMIPS(StringBuilder code, StringBuilder data, SymbolTable symbolTable, RegisterAllocator regAllocator) {
    // special case for println rn
    if (id.equals("println")) {
      println(code, data, symbolTable, regAllocator);
      return MIPSResult.createVoidResult();
    }

    List<String> usedRegisters = regAllocator.getUsed();
    if (!usedRegisters.contains("$ra")) {
      usedRegisters.add("$ra");
    }
    Integer activationRecord = (usedRegisters.size() + args.size()) * 4;

    // save $t0-9 registers
    Integer offset = 0;
    for (String reg: usedRegisters) {
      offset -= 4;
      code.append(MIPS.sw(reg, offset, MIPS.STACKPOINTER));
    }

    code.append("# -- params\n");
    for (Expression arg: args) {
      offset -= 4;
      MIPSResult argMIPS = arg.toMIPS(code, data, symbolTable, regAllocator);
      String reg = argMIPS.getRegister();
      code.append(MIPS.sw(reg, offset, MIPS.STACKPOINTER));
    }

    // make space for activation record
    code.append(MIPS.addi(MIPS.STACKPOINTER, MIPS.STACKPOINTER, -activationRecord));

    code.append(MIPS.jal(id));


    // restore stackpointer
    code.append(MIPS.addi(MIPS.STACKPOINTER, MIPS.STACKPOINTER, activationRecord));

    // restore $t0-9 registers and $ra
    offset = 0;
    for (String reg: usedRegisters) {
      offset -= 4;
      code.append(MIPS.lw(reg, offset, MIPS.STACKPOINTER));
    }

    VarType returnType = symbolTable.find(id).getType();

    if (returnType != null) {
      String returnReg = regAllocator.getT();
      code.append(MIPS.move(returnReg, "$v0"));
      return MIPSResult.createRegisterResult(returnReg, returnType);
    };

    return MIPSResult.createVoidResult();
  }

  public void println(StringBuilder code, StringBuilder data, SymbolTable symbolTable, RegisterAllocator regAllocator) {
    code.append("# -- println\n");

    // TODO: There is for sure a better place for this
    if (data.indexOf("newline") == -1) {
      data.append(MIPS.dataLabel("newline", ".asciiz \"\\n\""));
    }

    Expression arg = args.get(0);

    MIPSResult res = arg.toMIPS(code, data, symbolTable, regAllocator);
    if (res.getAddress() != null) {
      code.append(MIPS.la("$a0", res.getAddress()));
    } else if (res.getRegister() != null) {
      code.append(MIPS.move("$a0", res.getRegister()));
    }

    // |-------------------------------------------|
    // | $v0 | function       | argument           |
    // |-------------------------------------------|
    // | 1   | print int       | $a0 = int         |
    // | 4   | print string    | $a0 = int         |
    // | 5   | read integer    | return val in $v0 |
    // | 10  | exit program    | none              |
    // | 11  | print character | none              |
    // |-------------------------------------------|

    if (res.getType() == VarType.INT) {
      code.append(MIPS.li("$v0", 1));
    } else if (res.getType() == VarType.CHAR) {
      code.append(MIPS.li("$v0", 4));
    } else if (res.getType() == VarType.BOOL) {
      code.append(MIPS.li("$v0", 1));
    }

    // need to check the type if string 4 if int 1 in $v0
    code.append(MIPS.syscall());

    // print newline
    code.append(MIPS.la("$a0", "newline"));
    code.append(MIPS.li("$v0", 4)).append(MIPS.syscall());
  }
}
