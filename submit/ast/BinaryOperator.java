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
public class BinaryOperator extends Expression {

  private final Expression lhs, rhs;
  private final BinaryOperatorType type;

  public BinaryOperator(Expression lhs, BinaryOperatorType type, Expression rhs) {
    this.lhs = lhs;
    this.type = type;
    this.rhs = rhs;
  }

  public BinaryOperator(Expression lhs, String type, Expression rhs) {
    this.lhs = lhs;
    this.type = BinaryOperatorType.fromString(type);
    this.rhs = rhs;
  }

  @Override
  public void toCminus(StringBuilder builder, String prefix) {
    lhs.toCminus(builder, prefix);
    builder.append(" ").append(type).append(" ");
    rhs.toCminus(builder, prefix);
  }

  @Override
  public MIPSResult toMIPS(StringBuilder code, StringBuilder data, SymbolTable symbolTable, RegisterAllocator regAllocator) {
    MIPSResult lhsMIPS = lhs.toMIPS(code, data, symbolTable, regAllocator);
    MIPSResult rhsMIPS = rhs.toMIPS(code, data, symbolTable, regAllocator);
    String lhsReg = lhsMIPS.getRegister();
    String rhsReg = rhsMIPS.getRegister();
    switch (type) {
      case EQ:
        code.append(MIPS.seq(lhsReg, lhsReg, rhsReg));
        return MIPSResult.createRegisterResult(lhsReg, VarType.BOOL);
      case LE:
        code.append(MIPS.sle(lhsReg, lhsReg, rhsReg));
        return MIPSResult.createRegisterResult(lhsReg, VarType.BOOL);
      case LT:
        code.append(MIPS.slt(lhsReg, lhsReg, rhsReg));
        return MIPSResult.createRegisterResult(lhsReg, VarType.BOOL);
      case GE:
        code.append(MIPS.sgt(lhsReg, lhsReg, rhsReg));
        return MIPSResult.createRegisterResult(lhsReg, VarType.BOOL);
      case GT:
        code.append(MIPS.sge(lhsReg, lhsReg, rhsReg));
        return MIPSResult.createRegisterResult(lhsReg, VarType.BOOL);
      case NE:
        code.append(MIPS.xor(lhsReg, lhsReg, rhsReg));
        code.append(MIPS.slt(lhsReg, "$zero", lhsReg));
        return MIPSResult.createRegisterResult(lhsReg, VarType.BOOL);
      case OR:
        code.append(MIPS.or(lhsReg, lhsReg, rhsReg));
        return MIPSResult.createRegisterResult(lhsReg, VarType.BOOL);
      case AND:
        code.append(MIPS.and(lhsReg, lhsReg, rhsReg));
        return MIPSResult.createRegisterResult(lhsReg, VarType.BOOL);
      case MOD:
        return super.toMIPS(code, data, symbolTable, regAllocator);
      case PLUS:
        code.append(MIPS.add(lhsReg, lhsReg, rhsReg));
        return MIPSResult.createRegisterResult(lhsReg, VarType.INT);
      case MINUS:
        code.append(MIPS.sub(lhsReg, lhsReg, rhsReg));
        return MIPSResult.createRegisterResult(lhsReg, VarType.INT);
      case TIMES:
        // only supports the 32 least significant bits
        code.append(MIPS.mult(lhsReg, rhsReg));
        code.append(MIPS.mflo(lhsReg));
        return MIPSResult.createRegisterResult(lhsReg, VarType.INT);
      case DIVIDE:
        // only supports the quotient
        code.append(MIPS.div(lhsReg, rhsReg));
        code.append(MIPS.mflo(lhsReg));
        return MIPSResult.createRegisterResult(lhsMIPS.getRegister(), VarType.INT);
      default:
    }
    return super.toMIPS(code, data, symbolTable, regAllocator);
  }
}
