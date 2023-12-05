module alu(
    input logic [31:0] ALUop1,
    input logic [31:0] ALUop2,
    input logic [2:0] ALUctrl,
    output logic [31:0] ALUout,
    output logic Zero
);

always_comb
begin
    case(ALUctrl)
        3'b000: // add  
            ALUout = ALUop1 + ALUop2;
        3'b001: // subtract
            ALUout = ALUop1 - ALUop2;
        3'b101: // less than
            ALUout = {31'b0 ,ALUop1 < ALUop2};
        3'b011: // bitwise OR
            ALUout = ALUop1 | ALUop2;
        3'b010: // bitwise AND
            ALUout = ALUop2 & ALUop2;
        default: // should be unreachable
            ALUout = 32'hDEAD; // error magic number
    endcase
    Zero = ALUout == 0;
end

endmodule
