/*
 * Code formatter project
 * CS 4481
 */
package submit.ast;

import submit.MIPSResult;
import submit.RegisterAllocator;
import submit.SymbolTable;

import java.util.List;

/**
 *
 * @author edwajohn
 */
public class CompoundStatement extends Statement {

  private final List<Statement> statements;

  public CompoundStatement(List<Statement> statements) {
    this.statements = statements;
  }

  @Override
  public void toCminus(StringBuilder builder, String prefix) {
    builder.append(prefix).append("{\n");
    for (Statement s : statements) {
      s.toCminus(builder, prefix + "  ");
    }
    builder.append(prefix).append("}\n");
  }

  @Override
  public MIPSResult toMIPS(StringBuilder code, StringBuilder data, SymbolTable symbolTable, RegisterAllocator regAllocator) {
    code.append("# -- entering a new scope --\n");
    code.append("# -- symbols in table --\n");
    code.append(symbolTable.toString());
    for (Statement s: statements) {
      s.toMIPS(code, data, symbolTable, regAllocator);
    }
    code.append("\n# -- exiting scope --");
    return super.toMIPS(code, data, symbolTable, regAllocator);
  }
}
