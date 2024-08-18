module Data_Mem #(parameter MEM_DEPTH = 1024, parameter MEM_WIDTH = 32 )(
    input clk , rst , WE , 
    input [31:0] A , WD ,
    output reg [31:0] RD
);
reg [MEM_WIDTH-1:0] RAM [MEM_DEPTH-1:0]; //address size is the same as memory width
//to define pre-initialized elements in RAM
initial begin 
    $readmemh("D_Mem.dat",RAM);
end
//reading
always @(*) begin
    if(~rst)
        RD <= 0;
    else
        RD <= RAM[A[11:2]] ; //why from 2 to 11 from the PC ? 
                            //as we know that the PC address in different from the memory address 
                            //if incerement the PC by four we increment the memory address by 1
                            //so we have to divide the PC by 4 (Shift right by 2) to get the memory address
                            //and 11 to not make the memory very large
end
//writing
always @ (posedge clk) begin
    if (WE) 
        RAM[A[11:2]] <= WD ;
end 
endmodule