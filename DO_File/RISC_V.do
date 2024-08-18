vlib work
vlog Adder_PC.v Adder4.v ALU.v Control_Unit.v Data_Mem.v Extention_Unit.v Inst_Memory.v Mux2_1.v Mux3_1.v PC_clk.v Reg_file.v RISC_V_Wrapper.v RISC_V_tb.v
vsim -voptargs=+acc work.RISC_V_tb

add wave -position insertpoint  \
sim:/RISC_V_tb/dut/S1_1/clk \
sim:/RISC_V_tb/dut/S1_1/rst \
sim:/RISC_V_tb/dut/S1_1/PCNext \
sim:/RISC_V_tb/dut/S1_1/PC
add wave -position insertpoint  \
sim:/RISC_V_tb/dut/S1_2/RD
add wave -position insertpoint  \
sim:/RISC_V_tb/dut/S1_3/PCPlus4
add wave -position insertpoint  \
sim:/RISC_V_tb/dut/S2_1/OP \
sim:/RISC_V_tb/dut/S2_1/funct3 \
sim:/RISC_V_tb/dut/S2_1/funct7 \
sim:/RISC_V_tb/dut/S2_1/Zero \
sim:/RISC_V_tb/dut/S2_1/PCSrc \
sim:/RISC_V_tb/dut/S2_1/MemWrite \
sim:/RISC_V_tb/dut/S2_1/ALUSrc \
sim:/RISC_V_tb/dut/S2_1/RegWrite \
sim:/RISC_V_tb/dut/S2_1/Jump \
sim:/RISC_V_tb/dut/S2_1/Branch \
sim:/RISC_V_tb/dut/S2_1/ImmSrc \
sim:/RISC_V_tb/dut/S2_1/ResultSrc \
sim:/RISC_V_tb/dut/S2_1/ALUControl \
sim:/RISC_V_tb/dut/S2_1/ALUOp
add wave -position insertpoint  \
sim:/RISC_V_tb/dut/S2_2/A1 \
sim:/RISC_V_tb/dut/S2_2/A2 \
sim:/RISC_V_tb/dut/S2_2/A3
add wave -position insertpoint  \
sim:/RISC_V_tb/dut/S2_2/x1 \
sim:/RISC_V_tb/dut/S2_2/x4 \
sim:/RISC_V_tb/dut/S2_2/x5 \
sim:/RISC_V_tb/dut/S2_2/x6 \
sim:/RISC_V_tb/dut/S2_2/x9 \
sim:/RISC_V_tb/dut/S2_2/x10
add wave -position insertpoint  \
sim:/RISC_V_tb/dut/S2_3/ImmExt
add wave -position insertpoint  \
sim:/RISC_V_tb/dut/S3_2/SrcA \
sim:/RISC_V_tb/dut/S3_2/SrcB \
sim:/RISC_V_tb/dut/S3_2/ALUResult
add wave -position insertpoint  \
sim:/RISC_V_tb/dut/S3_3/PCTarget
add wave -position insertpoint  \
sim:/RISC_V_tb/dut/S4_1/RAM
add wave -position insertpoint  \
sim:/RISC_V_tb/dut/S4_2/ReadData \
sim:/RISC_V_tb/dut/S4_2/PCPlus4 \
sim:/RISC_V_tb/dut/S4_2/Result
add wave -position insertpoint  \
sim:/RISC_V_tb/dut/S2_2/RD2
run -all