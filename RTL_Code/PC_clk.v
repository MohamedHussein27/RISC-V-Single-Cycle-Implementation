module PC_clk(            
    input clk , rst ,
    input [31:0] PCNext ,
    output reg [31:0] PC
);
//this module is the first module of the design to make the pc updates every clock edgr
always @(posedge clk) begin
    if (~rst) //synchronous active low
        PC <= 0 ;
    else 
        PC <= PCNext;
end
endmodule