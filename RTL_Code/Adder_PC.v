module Adder_PC(
    input [31:0] PC , ImmExt ,
    output [31:0] PCTarget 
);
assign PCTarget = PC + ImmExt ;
endmodule