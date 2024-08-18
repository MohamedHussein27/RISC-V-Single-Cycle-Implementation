module Extention_Unit(
    input [1:0] ImmSrc ,
    input [31:7] Instr ,
    output reg [31:0] ImmExt
);
always @(*) begin
    case (ImmSrc)  
        2'b00 : ImmExt = {{20{Instr[31]}}, Instr[31:20]} ; // sign extend (I-type)
        2'b01 : ImmExt = {{20{Instr[31]}}, Instr[31:25], Instr[11:7]} ; //(S-type)
        2'b10 : ImmExt = {{20{Instr[31]}}, Instr[7], Instr[30:25], Instr[11:8], 1'b0} ; //add a zero so that the new PC is word-aligned it's like shift left by 1 bit (beq)
        2'b11 : ImmExt = {{12{Instr[31]}}, Instr[19:12], Instr[20], Instr[30:21], 1'b0} ; //add a zero so that the new PC is word-aligned it's like shift left by 1 bit(J-type)
        default : ImmExt = {{20{Instr[31]}}, Instr[31:20]} ; //default is (I-type)
    endcase
end
endmodule