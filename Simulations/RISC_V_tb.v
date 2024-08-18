module RISC_V_tb();
reg rst , clk ;

RISC_V_Wrapper dut(rst , clk);
initial begin
    clk = 0;
    forever #10 clk = ~clk; // 20ns period clock
end
initial begin
    dut.S2_2.x0 = 0 ; //x0 will always have the value of zero
    dut.S2_2.x9 = 4 ; //x9 will initially have the value of 4 to add it to -4 (immediate) so the address will be zero
                                     //and the address zero has the value 9 which will be assigned to x6
                                     //look at assembly_scenario.asm to follow
    dut.S2_2.x5 = 6 ; //x5 will always have the value of 6 initially
    rst = 0;
    #20 ;
    rst = 1;
    //now the PC will incerement by itself and the program will execute we will just wait
    //note : the instructions with their machine code are defined in Inst_Mem.dat
    #160;
    $stop;
end
endmodule