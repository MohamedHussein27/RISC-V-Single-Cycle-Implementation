module Mux3_1(
    input [31:0] ALUResult , ReadData , PCPlus4 ,
    input [1:0] ResultSrc ,
    output reg [31:0] Result
);
always @(*) begin
    case(ResultSrc)
        2'b00 : Result = ALUResult ;
        2'b01 : Result = ReadData ;
        2'b10 : Result = PCPlus4 ;
        default : Result = ALUResult ;
    endcase
end
endmodule