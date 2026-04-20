package submit;

import submit.ast.VarType;

import javax.xml.crypto.dsig.keyinfo.KeyValue;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/*
 * Code formatter project
 * CS 4481
 */
/**
 *
 */
public class SymbolTable {

  private final HashMap<String, SymbolInfo> table;
  private final HashMap<String, Integer> offsets;
  private SymbolTable parent;
  private final List<SymbolTable> children;
  private Integer label = 0;

  // size of all contained objects in bytes
  private Integer size = 0;

  public SymbolTable() {
    table = new HashMap<>();
    offsets = new HashMap<>();
    parent = null;
    children = new ArrayList<>();

    // Builtin functions
    table.put("println", new SymbolInfo("println", null, true, false));
  }

  public void addSymbol(String id, SymbolInfo symbol) {
    offsets.put(id, size);
    size += 4;
    table.put(id, symbol);
  }

  public Integer getOffset(String id) {
    if (table.containsKey(id)) {
      return offsets.get(id);
    }

    if (parent != null) {
      return size + parent.getOffset(id);
    }

    return null;
  }

  /**
   * Returns null if no symbol with that id is in this symbol table or an
   * ancestor table.
   *
   * @param id
   * @return
   */
  public SymbolInfo find(String id) {
    if (table.containsKey(id)) {
      SymbolInfo entry =  table.get(id);
      return entry;
    }
    if (parent != null) {
      return parent.find(id);
    }
    return null;
  }

  /**
   * Returns the new child.
   *
   * @return
   */
  public SymbolTable createChild() {
    SymbolTable child = new SymbolTable();
    children.add(child);
    child.parent = this;
    return child;
  }

  public SymbolTable getParent() {
    return parent;
  }

  public String toString() {

    StringBuilder sb = new StringBuilder();
    for (String name: table.keySet()) {
      sb.append("# " + name + ": " + offsets.get(name) + "\n");
    }

    return sb.toString();
  }

  public Integer getSize() { return size; }

}
