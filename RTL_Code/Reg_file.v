module Reg_file(
    input clk , rst , WE3 ,
    input [4:0] A1 , A2 , A3 , //A1 , A2 are addresses for read registers and A3 is the distination reg
    input [31:0] WD3 , // WD3 is the WRITE distination which will be written in A3 reg 
    output reg [31:0] RD1 , RD2 //the content of A1 and A2 (rs1 , rs2)
);
//declaring the registers to give them values in TB
reg [31:0] x0 , x1 , x2 , x3 , x4 , x5 , x6 , x7 , x8 , x9 , x10 , x11 , x12 , x13 , x14 , x15 , x16 , x17 , x18 , x19 , x20, x21 , x22 , x23 , x24 , x25 , x26 , x27 , x28 , x29 , x30 , x31 ;
reg [31:0] write_reg ; //the reg which will have the value written from Result at clk edge

//reading is combinational while writing is sequential
//choosing the RD1 (rs1)
always @(*) begin
    if (~rst)
        RD1 = 0;
    else begin
        case(A1)
            0 : RD1 = x0 ;
            1 : RD1 = x1 ;
            2 : RD1 = x2 ;
            3 : RD1 = x3 ;
            4 : RD1 = x4 ;
            5 : RD1 = x5 ;
            6 : RD1 = x6 ;
            7 : RD1 = x7 ;
            8 : RD1 = x8 ;
            9 : RD1 = x9 ;
            10 : RD1 = x10 ;
            11 : RD1 = x11 ;
            12 : RD1 = x12 ;
            13 : RD1 = x13 ;
            14 : RD1 = x14 ;
            15 : RD1 = x15 ;
            16 : RD1 = x16 ;
            17 : RD1 = x17 ;
            18 : RD1 = x18 ;
            19 : RD1 = x19 ;
            20 : RD1 = x20 ;
            21 : RD1 = x21 ;
            22 : RD1 = x22 ;
            23 : RD1 = x23 ;
            24 : RD1 = x24 ;
            25 : RD1 = x25 ;
            26 : RD1 = x26 ;
            27 : RD1 = x27 ;
            28 : RD1 = x28 ;
            29 : RD1 = x29 ;
            30 : RD1 = x30 ;
            31 : RD1 = x31 ;
            default : RD1 = 0;
        endcase
    end
end
// choosing the RD2 (rs2)
always @(*) begin
    if (~rst)
        RD2 = 0;
    else begin
        case(A2)
            0 : RD2 = x0;
            1 : RD2 = x1;
            2 : RD2 = x2;
            3 : RD2 = x3;
            4 : RD2 = x4;
            5 : RD2 = x5;
            6 : RD2 = x6;
            7 : RD2 = x7;
            8 : RD2 = x8;
            9 : RD2 = x9;
            10 : RD2 = x10;
            11 : RD2 = x11;
            12 : RD2 = x12;
            13 : RD2 = x13;
            14 : RD2 = x14;
            15 : RD2 = x15;
            16 : RD2 = x16;
            17 : RD2 = x17;
            18 : RD2 = x18;
            19 : RD2 = x19;
            20 : RD2 = x20;
            21 : RD2 = x21;
            22 : RD2 = x22;
            23 : RD2 = x23;
            24 : RD2 = x24;
            25 : RD2 = x25;
            26 : RD2 = x26;
            27 : RD2 = x27;
            28 : RD2 = x28;
            29 : RD2 = x29;
            30 : RD2 = x30;
            31 : RD2 = x31;
            default : RD2 = 0;
        endcase
    end
end
//choosing the write_reg (rd)
always @(*) begin
    case (A3)
        1 : x1 = write_reg ;
        2 : x2 = write_reg ;
        3 : x3 = write_reg ;
        4 : x4 = write_reg ;
        5 : x5 = write_reg ;
        6 : x6 = write_reg ;
        7 : x7 = write_reg ;
        8 : x8 = write_reg ;
        9 : x9 = write_reg ;
        10 : x10 = write_reg ;
        11 : x11 = write_reg ;
        12 : x12 = write_reg ;
        13 : x13 = write_reg ;
        14 : x14 = write_reg ;
        15 : x15 = write_reg ;
        16 : x16 = write_reg ;
        17 : x17 = write_reg ;
        18 : x18 = write_reg ;
        19 : x19 = write_reg ;
        20 : x20 = write_reg ;
        21 : x21 = write_reg ;
        22 : x22 = write_reg ;
        23 : x23 = write_reg ;
        24 : x24 = write_reg ;
        25 : x25 = write_reg ;
        26 : x26 = write_reg ;
        27 : x27 = write_reg ;
        28 : x28 = write_reg ;
        29 : x29 = write_reg ;
        30 : x30 = write_reg ;
        31 : x31 = write_reg ;
        default : x0 = 0;
    endcase
end
//writing is sequential
always @ (posedge clk ) begin
    if(~rst || WE3 == 0)
        write_reg <= 0;
    else if (WE3)
        write_reg <= WD3 ;
end
endmodule