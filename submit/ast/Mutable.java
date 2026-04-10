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
public class Mutable extends Expression {

  private final String id;
  private final Expression index;

  public Mutable(String id, Expression index) {
    this.id = id;
    this.index = index;
  }

  @Override
  public void toCminus(StringBuilder builder, String prefix) {
    builder.append(id);
    if (index != null) {
      builder.append("[");
      index.toCminus(builder, prefix);
      builder.append("]");
    }
  }

  public String getId() {
    return id;
  }

  @Override
  public MIPSResult toMIPS(StringBuilder code, StringBuilder data, SymbolTable symbolTable, RegisterAllocator regAllocator) {
    // load mutable into register
    Integer offset = symbolTable.getOffset(id);
    String varRegister = regAllocator.getT();
    String offsetRegister = regAllocator.getT();
    VarType type = symbolTable.find(id).getType();

    code.append("# -- load the value of " + id + "\n");

    // Get id's offset from $sp from the symbol table and initialize a's address with it
    code.append("li " + offsetRegister + " -" + offset + "\n");
    // Add the stack pointer address to the offset
    code.append("add " + offsetRegister + " " + offsetRegister + " $sp\n");

    code.append("lw " + varRegister + " 0(" + offsetRegister + ")\n");

    return MIPSResult.createRegisterResult(varRegister, type);
  }
}
