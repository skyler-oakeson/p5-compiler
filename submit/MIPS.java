package submit;

public  class MIPS {
    public static final String STACKPOINTER = "$sp";
    public static final String RETURNADDRESS = "$ra";
    public static final String PROGRAMCOUNTER = "$pc";

    public static String li(String targetReg, Integer val) {
        return String.format("li %s, %d\n", targetReg, val);
    }

    public static String lw(String targetReg, Integer offset, String sourceReg) {
        return String.format("lw %s, %d(%s)\n", targetReg,  offset, sourceReg);
    }

    public static String sw(String sourceReg, Integer offset, String targetReg) {
        return String.format("sw %s, %d(%s)\n", sourceReg,  offset, targetReg);
    }

    public static String la(String targetReg, String addr) {
        return String.format("la %s %s\n", targetReg, addr);
    }

    public static String move(String targetReg, String sourceReg) {
        return String.format("move %s, %s\n", targetReg, sourceReg);
    }

    public static String label(String label) {
        return String.format("%s:\n", label);
    }

    public static String dataLabel(String label, String value) {
        return String.format("%s: %s\n", label, value);
    }

    public static String syscall() {
        return "syscall\n";
    }

    public static String add(String targetReg, String operandReg1, String operandReg2) {
        return String.format("add %s, %s %s\n", targetReg, operandReg1, operandReg2);
    }

    public static String addi(String targetReg, String operandReg1, Integer operand2) {
        return String.format("addi %s, %s %d\n", targetReg, operandReg1, operand2);
    }

    public static String sub(String targetReg, String operandReg1, String operandReg2) {
        return String.format("sub %s, %s %s\n", targetReg, operandReg1, operandReg2);
    }

    public static String mult(String operandReg1, String operandReg2) {
        return String.format("mult %s %s\n", operandReg1, operandReg2);
    }

    public static String div(String operandReg1, String operandReg2) {
        return String.format("div %s %s\n", operandReg1, operandReg2);
    }

    public static String mflo(String targetReg) {
        return String.format("mflo %s\n", targetReg);
    }

    public static String neg(String targetReg, String sourceReg) {
        return String.format("neg %s %s\n", targetReg, sourceReg);
    }

    public static String jal(String label) {
        return String.format("jal %s\n", label);
    }

    public static String jr(String targetReg) {
        return String.format("jr %s\n", targetReg);
    }

}
