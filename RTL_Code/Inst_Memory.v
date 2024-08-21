module Inst_Memory #(parameter MEM_DEPTH = 1024, parameter MEM_WIDTH = 32 )(
    input rst ,
    input [31:0] A ,  //A is the PC 
    output reg [31:0] RD  //RD is the instruction
);
// Creating the memory array
reg [MEM_WIDTH-1:0] ROM [MEM_DEPTH-1:0]; //address size is the same as memory width
    //writing instructions into our memory
    //note : I reduced the address to 10 bits for simplicity 
initial begin
    $readmemh("Inst_Mem.dat",ROM);
end
always @(*) begin
    if(~rst)
        RD = 0;
    else
        RD = ROM[A[31:0]>>2] ; //why from 2 to 11 from the PC ? 
                            //as we know that the PC address in different from the memory address 
                            //if incerement the PC by four we increment the memory address by 1
                            //so we have to divide the PC by 4 (Shift right by 2) to get the memory address
                            //and 11 to not make the memory very large
end
endmodule