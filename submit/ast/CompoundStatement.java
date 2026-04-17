/*
 * Code formatter project
 * CS 4481
 */
package submit.ast;

import submit.MIPS;
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
    Integer scopeOffset = this.symbolTable.getSize();

    // update stack pointer
    code.append("# -- enter scope\n");
    code.append(MIPS.addi(MIPS.STACKPOINTER, MIPS.STACKPOINTER, -scopeOffset));

    code.append("# -- symbols in scope\n");
    code.append(this.symbolTable.toString());

    for (Statement s: statements) {
      s.toMIPS(code, data, this.symbolTable, regAllocator);
      regAllocator.clearAll();
    }

    code.append(MIPS.addi(MIPS.STACKPOINTER, MIPS.STACKPOINTER, scopeOffset));
    code.append("# -- exit scope\n");

    regAllocator.clearAll();

    return super.toMIPS(code, data, symbolTable, regAllocator);
  }
}
