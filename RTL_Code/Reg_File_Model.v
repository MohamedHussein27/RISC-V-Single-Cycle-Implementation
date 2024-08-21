module Reg_File_Model(
    input clk , WE3 ,
    input [4:0] A1 , A2 , A3 , //A1 , A2 are addresses for read registers and A3 is the distination reg
    input [31:0] WD3 , // WD3 is the WRITE distination which will be written in A3 reg 
    output [31:0] RD1 , RD2 //the content of A1 and A2 (rs1 , rs2)
);
//declaring the registers 
reg [31:0] registers [31:0];
initial begin 
    $readmemh("Registers.dat",registers);
end
//reg [31:0] write_reg ; //the reg which will have the value written from Result at clk edge

//reading is combinational while writing is sequential
//choosing the RD1 (rs1)
assign RD1 = registers[A1];
// choosing the RD2 (rs2)
assign RD2 = registers[A2];
//choosing the write_reg (rd)
//writing is sequential
always @ (posedge clk ) begin
    if (WE3)
        registers[A3] <= WD3 ;
end
endmodule