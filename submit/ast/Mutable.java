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

    Integer offset = symbolTable.getOffset(id);
    String varRegister = regAllocator.getT();
    SymbolInfo symbol = symbolTable.find(id);
    VarType type = symbol.getType();

    code.append("# -- loads " + id + "\n");

    code.append(MIPS.lw(varRegister, offset, MIPS.STACKPOINTER));

    return MIPSResult.createRegisterResult(varRegister, type);
  }
}
