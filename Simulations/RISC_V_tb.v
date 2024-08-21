module RISC_V_tb();
reg rst , clk ;
wire [31:0] PCNext, Result, Instr, PCPlus4, Reg1_out, Reg2_out, ImmExt, SrcB, ALUResult, PCTarget, ReadData;
wire [2:0] ALUControl;
wire [1:0] ImmSrc , ResultSrc;
wire PCSrc , MemWrite , ALUSrc , RegWrite , Jump , Branch, Zero ;

RISC_V_Wrapper dut(rst , clk,  PCNext, Result, PCPlus4, Reg1_out, Reg2_out, ImmExt, SrcB, ALUResult, PCTarget, ReadData,
ALUControl,ImmSrc , ResultSrc,PCSrc , MemWrite , ALUSrc , RegWrite , Jump , Branch, Zero);
initial begin
    clk = 0;
    forever #10 clk = ~clk; // 20ns period clock
end
initial begin
    //explaining scenario
    //x0 will always have the value of zero
    //x9 will initially have the value of 4 to add it to -4 (immediate) so the address will be zero
    //and the address zero has the value 9 which will be assigned to x6
    //look at assembly_scenario.asm to follow
    //x5 will always have the value of 6 initially
    rst = 0;
    #20 ;
    rst = 1;
    //now the PC will incerement by itself and the program will execute we will just wait
    //note : the instructions with their machine code are defined in Inst_Mem.dat
    #160;
    $stop;
end
endmodule