/*
 * Code formatter project
 * CS 4481
 */
package submit.ast;

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
    switch (type) {
      case EQ:
        return super.toMIPS(code, data, symbolTable, regAllocator);
      case LE:
        return super.toMIPS(code, data, symbolTable, regAllocator);
      case LT:
        return super.toMIPS(code, data, symbolTable, regAllocator);
      case GE:
        return super.toMIPS(code, data, symbolTable, regAllocator);
      case GT:
        return super.toMIPS(code, data, symbolTable, regAllocator);
      case NE:
        return super.toMIPS(code, data, symbolTable, regAllocator);
      case OR:
        return super.toMIPS(code, data, symbolTable, regAllocator);
      case AND:
        return super.toMIPS(code, data, symbolTable, regAllocator);
      case MOD:
        return super.toMIPS(code, data, symbolTable, regAllocator);
      case PLUS:
        code.append("add " + lhsMIPS.getRegister() + " " + lhsMIPS.getRegister() + " " + rhsMIPS.getRegister() + "\n");
        return MIPSResult.createRegisterResult(lhsMIPS.getRegister(), VarType.INT);
      case MINUS:
        code.append("sub " + lhsMIPS.getRegister() + " " + lhsMIPS.getRegister() + " " + rhsMIPS.getRegister() + "\n");
        return MIPSResult.createRegisterResult(lhsMIPS.getRegister(), VarType.INT);
      case TIMES:
        // only supports the 32 least significant bits
        code.append("mult " + lhsMIPS.getRegister() + " " + rhsMIPS.getRegister() + "\n");
        code.append("mflo " + lhsMIPS.getRegister() + "\n");
        return MIPSResult.createRegisterResult(lhsMIPS.getRegister(), VarType.INT);
      case DIVIDE:
        // only supports the quotient
        code.append("div " + lhsMIPS.getRegister() + " " + rhsMIPS.getRegister() + "\n");
        code.append("mflo " + lhsMIPS.getRegister() + "\n");
        return MIPSResult.createRegisterResult(lhsMIPS.getRegister(), VarType.INT);
      default:
    }
    return super.toMIPS(code, data, symbolTable, regAllocator);
  }
}
