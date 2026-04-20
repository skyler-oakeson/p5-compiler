/*
 * Code formatter project
 * CS 4481
 */
package submit;

import submit.ast.VarType;

/**
 *
 * @author edwajohn
 */
public class SymbolInfo {

  private final String id;
  // In the case of a function, type is the return type
  private final VarType type;
  private final boolean function;
  private final boolean parameter;

  public SymbolInfo(String id, VarType type, boolean function, boolean parameter) {
    this.id = id;
    this.type = type;
    this.function = function;
    this.parameter = parameter;
  }

  public boolean isParameter() {
    return this.parameter;
  }

  public VarType getType() {
    return this.type;
  }

  @Override
  public String toString() {
    return "<" + id + ", " + type + '>';
  }

}
