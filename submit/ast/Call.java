/*
 * Code formatter project
 * CS 4481
 */
package submit.ast;

import submit.MIPSResult;
import submit.RegisterAllocator;
import submit.SymbolTable;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

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
      return println(code, data, symbolTable, regAllocator);
    }

    code.append("# -- update the stack pointer --\n");
    code.append("addi $sp $sp -0\n");

    return MIPSResult.createVoidResult();
  }

  public MIPSResult println(StringBuilder code, StringBuilder data, SymbolTable symbolTable, RegisterAllocator regAllocator) {
    // ERROR HERE TOO MANY ARGS TO PRINTLN
    if (args.size() > 1) {
      return MIPSResult.createVoidResult();
    }

    // TODO: There is for sure a better way to do this
    if (data.indexOf("newline") == -1) {
      data.append("newline: .asciiz \"\\n\"\n");
    }

    Expression arg = args.get(0);

    MIPSResult res = arg.toMIPS(code, data, symbolTable, regAllocator);
    if (res.getAddress() != null) {
      code.append("la $a0 " + res.getAddress() + "\n");
      code.append("li $v0 4\n");
    } else if (res.getRegister() != null) {
      code.append("move $a0 " + res.getRegister() + "\n");
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
      code.append("li $v0 1\n");
    } else if (res.getType() == VarType.CHAR) {
      code.append("li $v0 11\n");
    } else if (res.getType() == VarType.BOOL) {
      code.append("li $v0 1\n");
    }

    // need to check the type if string 4 if int 1 in $v0
    code.append("syscall\n");

    // print newline
    code.append("la $a0 newline\n");
    code.append("li $v0 4\n");
    code.append("syscall\n");

    regAllocator.clearAll();

    return MIPSResult.createVoidResult();
  }
}
