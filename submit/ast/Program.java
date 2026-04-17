/*
 * Code formatter project
 * CS 4481
 */
package submit.ast;

import submit.MIPS;
import submit.MIPSResult;
import submit.RegisterAllocator;
import submit.SymbolTable;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author edwajohn
 */
public class Program extends Node {

  private ArrayList<Declaration> declarations;

  public Program(List<Declaration> declarations) {
    this.declarations = new ArrayList<>(declarations);
  }

  @Override
  public String toString() {
    StringBuilder builder = new StringBuilder();
    toCminus(builder, "");
    return builder.toString();
  }

  @Override
  public void toCminus(StringBuilder builder, String prefix) {
    for (Declaration declaration : declarations) {
      declaration.toCminus(builder, "");
    }
  }

  @Override
  public MIPSResult toMIPS(StringBuilder code, StringBuilder data, SymbolTable symbolTable, RegisterAllocator regAllocator) {
    for (Declaration decl: declarations) {
      decl.toMIPS(code, data, symbolTable, regAllocator);
    }

    // exit the program
    code.append("# -- exiting program -- \n");
    code.append(MIPS.li("$v0", 10)).append(MIPS.syscall());
    return MIPSResult.createVoidResult();
  }
}
