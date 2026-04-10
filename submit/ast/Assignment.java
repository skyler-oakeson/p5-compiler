/*
 * Code formatter project
 * CS 4481
 */
package submit.ast;

import submit.MIPSResult;
import submit.RegisterAllocator;
import submit.SymbolInfo;
import submit.SymbolTable;

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

    code.append("# -- assign the value of " + id + "\n");

    Integer offset = symbolTable.getOffset(id);
    String offsetRegister = regAllocator.getT();

    // Get id's offset from $sp from the symbol table and initialize a's address with it
    code.append("li " + offsetRegister + " -" + offset + "\n");
    // Add the stack pointer address to the offset
    code.append("add " + offsetRegister + " " + offsetRegister + " $sp\n");

    // compute rhs for assignment
    MIPSResult MIPSrhs = rhs.toMIPS(code, data, symbolTable, regAllocator);

    // complete assignment with store
    code.append("sw " + MIPSrhs.getRegister() + " 0(" + offsetRegister + ")\n");

    return MIPSResult.createVoidResult();
  }
}
