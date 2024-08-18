module Mux2_1 (  // 31 indicates the bus with of the inputs of the mux
    input [31:0] in1 ,
    input [31:0] in2 ,
    input select ,
    output [31:0] out
);
assign out = (select) ? in2 : in1;
endmodule