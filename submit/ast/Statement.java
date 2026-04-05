/*
 * Code formatter project
 * CS 4481
 */
package submit.ast;

import submit.MIPSResult;
import submit.RegisterAllocator;
import submit.SymbolTable;

import java.util.ArrayList;

/**
 *
 * @author edwajohn
 */
public abstract class Statement extends Node {
    public static CompoundStatement empty() { return new CompoundStatement(new ArrayList<>()); }
}
