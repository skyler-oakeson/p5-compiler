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
public class StringConstant extends Expression {

  private final String value;

  public StringConstant(String value) {
    this.value = value;
  }

  @Override
  public MIPSResult toMIPS(StringBuilder code, StringBuilder data, SymbolTable symbolTable, RegisterAllocator regAllocator) {
    String label = regAllocator.getUniqueLabel();
    data.append(MIPS.dataLabel(label, String.format(".asciiz %s", value)));
    return MIPSResult.createAddressResult(label, VarType.CHAR);
  }

  public void toCminus(StringBuilder builder, final String prefix) {
    builder.append("\"").append(value).append("\"");
  }

}
