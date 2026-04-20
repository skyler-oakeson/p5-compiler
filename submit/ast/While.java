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
public class While extends Statement {

  private final Expression expression;
  private final Statement statement;

  public While(Expression expression, Statement statement) {
    this.expression = expression;
    this.statement = statement;
  }

  @Override
  public void toCminus(StringBuilder builder, String prefix) {
    builder.append(prefix).append("while (");
    expression.toCminus(builder, prefix);
    builder.append(")\n");
    if (statement instanceof CompoundStatement) {
      statement.toCminus(builder, prefix);
    } else {
      statement.toCminus(builder, prefix + " ");
    }

  }

  @Override
  public MIPSResult toMIPS(StringBuilder code, StringBuilder data, SymbolTable symbolTable, RegisterAllocator regAllocator) {
    String loopLable = regAllocator.getUniqueLabel();
    String exitLable = regAllocator.getUniqueLabel();

    code.append(MIPS.label(loopLable));

    code.append("# -- while\n");
    MIPSResult exprMIPS = expression.toMIPS(code, data, symbolTable, regAllocator);
    String exprReg = exprMIPS.getRegister();

    code.append(MIPS.bne(exprReg, "1", exitLable));

    MIPSResult stmtMIPS = statement.toMIPS(code, data, symbolTable, regAllocator);

    code.append(MIPS.j(loopLable));

    code.append(MIPS.label(exitLable));


    return super.toMIPS(code, data, symbolTable, regAllocator);
  }
}
