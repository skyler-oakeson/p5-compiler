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
  private final SymbolTable symbolTable;

  public CompoundStatement(List<Statement> statements, SymbolTable symbolTable) {
    this.statements = statements;
    this.symbolTable = symbolTable;
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

    Integer sp = 0;
    while (symbolTable.getParent() != null) {
      SymbolTable parent = symbolTable.getParent();
      sp += parent.getSize();
    }

    // update stack pointer
    code.append("addi $sp $sp -" + sp + "\n");

    for (Statement s: statements) {
      s.toMIPS(code, data, this.symbolTable, regAllocator);
      regAllocator.clearAll();
    }

    code.append("# -- symbols in table --\n");

    // reset stack pointer
    code.append("# -- exiting scope --\n");
    code.append("addi $sp $sp " + sp + "\n");
    return super.toMIPS(code, data, symbolTable, regAllocator);
  }
}
