module se(
    input logic [31:0] Instr,
    input logic [1:0] ImmSrc,
    output logic [31:0] ImmExt
);

always_comb begin
    case(ImmSrc)
    2'b00:
        ImmExt = {{20{Instr[31]}}, Instr[31:20]};
    2'b01:
        ImmExt = {{20{Instr[31]}}, Instr[31:25], Instr[11:7]};
    2'b10:
        ImmExt = {{20{Instr[31]}}, Instr[7], Instr[30:25], Instr[11:8], 1'b0};
	default:
		ImmExt = 32'hDEAD; // error magic number
    endcase
end
endmodule
