module RISC_V_Wrapper(
    input rst , clk ,
    output [31:0] PCNext, Result, PCPlus4, Reg1_out, Reg2_out, ImmExt, SrcB, ALUResult, PCTarget, ReadData,
    output [2:0] ALUControl,
    output [1:0] ImmSrc , ResultSrc,
    output PCSrc , MemWrite , ALUSrc , RegWrite , Jump , Branch, Zero
);
//this is the module which connects all the components together
//we will go section by section of the schematic image 
//wire Zero ;
//wire [31:0] PCNext ; //the output of the second 2 to 1 mux
//wire [31:0] Result ; //the output from the 3 to 1 mux
//these three wires are inputs in some modules and outputs of others so i must put them in the top to avoid combinational error


//section 1 (clk fot PC),(Instruction Memory) and (Adder4) 
wire [31:0] PC ;
PC_clk S1_1 (clk , rst , PCNext , PC) ;

wire [31:0] Instr ; //instruction from the Inst_Memory
Inst_Memory S1_2 (rst , PC , Instr);

//wire [31:0] PCPlus4 ; //adder4 result
Adder4 S1_3 (PC , PCPlus4);


//section 2 (Control Unit),(Register file) and (Extension Unit)
//wire PCSrc , MemWrite , ALUSrc , RegWrite , Jump , Branch ;
//wire [1:0] ImmSrc , ResultSrc ;
//wire [2:0] ALUControl ;
Control_Unit S2_1 (
    .OP(Instr[6:0]) , .funct3(Instr[14:12]) , .funct7(Instr[30]) , .Zero(Zero) ,
    .PCSrc(PCSrc) , .MemWrite(MemWrite) , .ALUSrc(ALUSrc) , .RegWrite(RegWrite) ,
    .Jump(Jump) , .Branch(Branch) , .ImmSrc(ImmSrc) , .ResultSrc(ResultSrc) ,
    .ALUControl(ALUControl)) ;

//wire [31:0] Reg1_out , Reg2_out ; //the output wires from RD1 and RD2
/*Reg_file S2_2 (
    .A1(Instr[19:15]) , .A2(Instr[24:20]) , .A3(Instr[11:7]) , .WD3(Result) ,
    .WE3(RegWrite) , .clk(clk) , .rst(rst) , .RD1(Reg1_out) , .RD2(Reg2_out)
);*/
Reg_File_Model S2_2 (
    .A1(Instr[19:15]) , .A2(Instr[24:20]) , .A3(Instr[11:7]) , .WD3(Result) ,
    .WE3(RegWrite) , .clk(clk) , .RD1(Reg1_out) , .RD2(Reg2_out)
);

//wire [31:0] ImmExt ;
Extention_Unit S2_3 (
    .Instr(Instr[31:7]) , .ImmSrc(ImmSrc) , .ImmExt(ImmExt) 
);


//section 3 (Mux2_1),(ALU) and (Adder_PC)
//wire [31:0] SrcB ; //output from the first 2 to 1 mux
Mux2_1 S3_1 (Reg2_out , ImmExt , ALUSrc , SrcB);

//wire [31:0] ALUResult ;
ALU S3_2 (Reg1_out , SrcB , ALUControl , Zero , ALUResult);

//wire [31:0] PCTarget ; //adder_PC output
Adder_PC S3_3 (PC , ImmExt , PCTarget );


//section 4 (Data Memory),(Mux3_1) and (mux2_1)
//wire [31:0] ReadData ;
Data_Mem S4_1 (
    clk , rst , MemWrite , ALUResult , Reg2_out , ReadData
);

Mux3_1 S4_2 (ALUResult , ReadData , PCPlus4 , ResultSrc , Result);

Mux2_1 S4_3 (PCPlus4 , PCTarget , PCSrc , PCNext );

endmodule