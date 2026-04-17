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
public class UnaryOperator extends Expression {

  private final UnaryOperatorType type;
  private final Expression expression;

  public UnaryOperator(String type, Expression expression) {
    this.type = UnaryOperatorType.fromString(type);
    this.expression = expression;
  }

  @Override
  public void toCminus(StringBuilder builder, String prefix) {
    builder.append(type);
    expression.toCminus(builder, prefix);
  }


    @Override
    public MIPSResult toMIPS(StringBuilder code, StringBuilder data, SymbolTable symbolTable, RegisterAllocator regAllocator) {
        MIPSResult expMIPS = expression.toMIPS(code, data, symbolTable, regAllocator);
        String expReg = expMIPS.getRegister();
        switch (type) {
            case NEG:
                code.append(MIPS.neg(expReg, expReg));
                return MIPSResult.createRegisterResult(expReg, VarType.INT);
            case NOT:
                return MIPSResult.createVoidResult();
            case DEREF:
                return MIPSResult.createVoidResult();
            case QUESTION:
                return MIPSResult.createVoidResult();
            default:
                return super.toMIPS(code, data, symbolTable, regAllocator);
        }
    }
}
