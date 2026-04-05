package submit.ast;

import submit.MIPSResult;
import submit.RegisterAllocator;
import submit.SymbolTable;

public abstract class Node {
    void toCminus(StringBuilder builder, final String prefix) {
    }

    public MIPSResult toMIPS(StringBuilder code, StringBuilder data, SymbolTable symbolTable, RegisterAllocator regAllocator) {
        return MIPSResult.createVoidResult();
    }
}
