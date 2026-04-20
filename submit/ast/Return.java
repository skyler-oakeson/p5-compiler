/*
 * Code formatter project
 * CS 4481
 */
package submit.ast;

import submit.MIPS;
import submit.MIPSResult;
import submit.RegisterAllocator;
import submit.SymbolTable;

/**
 *
 * @author edwajohn
 */
public class Return extends Statement {

  private final Expression expr;

  public Return(Expression expr) {
    this.expr = expr;
  }

  @Override
  public void toCminus(StringBuilder builder, String prefix) {
    builder.append(prefix);
    if (expr == null) {
      builder.append("return;\n");
    } else {
      builder.append("return ");
      expr.toCminus(builder, prefix);
      builder.append(";\n");
    }
  }

  @Override
  public MIPSResult toMIPS(StringBuilder code, StringBuilder data, SymbolTable symbolTable, RegisterAllocator regAllocator) {
    code.append("# -- save return\n");
    MIPSResult result = expr.toMIPS(code, data, symbolTable, regAllocator);
    String resultReg = result.getRegister();
    Integer offset = symbolTable.getOffset("return");
    code.append(MIPS.sw(resultReg, offset, MIPS.STACKPOINTER));

    return super.toMIPS(code, data, symbolTable, regAllocator);
  }
}
