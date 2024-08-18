module ALU(
    input [31:0] SrcA , SrcB ,
    input [2:0] ALUControl ,
    output Zero ,
    output reg [31:0] ALUResult 
);
always @(*) begin
    case(ALUControl)
        3'b000 : ALUResult = SrcA + SrcB ; //add
        3'b001 : ALUResult = SrcA - SrcB ; //sub
        3'b101 : begin  //slt
            if (SrcA < SrcB)
                ALUResult = SrcA ;
            else
                ALUResult = 0 ;
        end
        3'b011 : ALUResult = SrcA | SrcB ; //or
        3'b010 : ALUResult = SrcA & SrcB ; //and
        default : ALUResult = 0 ;
    endcase
end
assign Zero = (ALUResult == 0) ? 1 : 0 ;     //zero flag
endmodule