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
    // update stack pointer for function call
    code.append("addi $sp $sp -0");

    // special case for println rn
    if (id.equals("println")) {
      for (Expression arg: args) {
        MIPSResult addr = arg.toMIPS(code, data, symbolTable, regAllocator);
        code.append("la $a0 " + addr);
      }

      return MIPSResult.createVoidResult();
    }

    return MIPSResult.createVoidResult();
  }
}
