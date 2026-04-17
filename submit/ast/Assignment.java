/*
 * Code formatter project
 * CS 4481
 */
package submit.ast;

import submit.*;

/**
 *
 * @author edwajohn
 */
public class Assignment extends Expression {

  private final Mutable mutable;
  private final AssignmentType type;
  private final Expression rhs;

  public Assignment(Mutable mutable, String assign, Expression rhs) {
    this.mutable = mutable;
    this.type = AssignmentType.fromString(assign);
    this.rhs = rhs;
  }

  public void toCminus(StringBuilder builder, final String prefix) {
    mutable.toCminus(builder, prefix);
    if (rhs != null) {
      builder.append(" ").append(type.toString()).append(" ");
      rhs.toCminus(builder, prefix);
    } else {
      builder.append(type.toString());

    }
  }

  @Override
  public MIPSResult toMIPS(StringBuilder code, StringBuilder data, SymbolTable symbolTable, RegisterAllocator regAllocator) {
    String id = mutable.getId();

    // compute the offset
    Integer offset = symbolTable.getOffset(id);

    code.append("# -- assigns " + id + "\n");

    // compute rhs for assignment
    String rhsReg = rhs.toMIPS(code, data, symbolTable, regAllocator).getRegister();

    // complete assignment with store
    code.append(MIPS.sw(rhsReg, offset, MIPS.STACKPOINTER));

    return MIPSResult.createVoidResult();
  }
}
