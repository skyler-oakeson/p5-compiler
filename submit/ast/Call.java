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

    Integer totalOffset = regAllocator.getUsed().size() * 4 + 4;
    Integer offset = totalOffset;

    // make space for activation record
    code.append(MIPS.addi(MIPS.STACKPOINTER, MIPS.STACKPOINTER, -totalOffset));

    // save $t0-9 registers
    for (String reg: regAllocator.getUsed()) {
      offset -= 4;
      code.append(MIPS.sw(reg, offset, MIPS.STACKPOINTER));
    }

    // save $ra
    code.append(MIPS.sw(MIPS.RETURNADDRESS, 0, MIPS.STACKPOINTER));

    code.append(MIPS.jal(id));


    // restore $t0-9 registers
    offset = totalOffset;
    for (String reg: regAllocator.getUsed()) {
      offset -= 4;
      code.append(MIPS.lw(reg, offset, MIPS.STACKPOINTER));
    }

    // restore $ra
    code.append(MIPS.lw(MIPS.RETURNADDRESS, 0, MIPS.STACKPOINTER));

    // restore stackpointer
    code.append(MIPS.addi(MIPS.STACKPOINTER, MIPS.STACKPOINTER, totalOffset));


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
