module Control_Unit(
    input [6:0] OP ,
    input [2:0] funct3 ,
    input funct7 , Zero ,
    output PCSrc ,
    output reg MemWrite , ALUSrc , RegWrite , Jump , Branch ,
    output reg [1:0] ImmSrc , ResultSrc , 
    output reg [2:0] ALUControl
);
reg [1:0] ALUOp ; //to be used in ALU decoder
//implementing main decoder
always @(*) begin
    case(OP)
        7'b0000011 : begin  //lw instruction
            RegWrite = 1;
            ImmSrc = 2'b00 ;
            ALUSrc = 1 ;
            MemWrite = 0 ;
            ResultSrc = 2'b01 ;
            Branch = 0 ;
            ALUOp = 2'b00 ;
            Jump = 0 ;
        end
        7'b0100011 : begin  //sw instruction
            RegWrite = 0;
            ImmSrc = 2'b01 ;
            ALUSrc = 1 ;
            MemWrite = 1 ;
            ResultSrc = 2'bxx ;
            Branch = 0 ;
            ALUOp = 2'b00 ;
            Jump = 0 ;
        end
        7'b0110011 : begin  //R-type instructions
            RegWrite = 1;
            ImmSrc = 2'bxx ;
            ALUSrc = 0 ;
            MemWrite = 0 ;
            ResultSrc = 2'b00 ;
            Branch = 0 ;
            ALUOp = 2'b10 ;
            Jump = 0 ;
        end
        7'b1100011 : begin  //beq instruction
            RegWrite = 0;
            ImmSrc = 2'b10 ;
            ALUSrc = 0 ;
            MemWrite = 0 ;
            ResultSrc = 2'bxx ;
            Branch = 1 ;
            ALUOp = 2'b01 ;
            Jump = 0 ;
        end
        7'b0010011 : begin  //I-type instructions (without load instructions)
            RegWrite = 1;
            ImmSrc = 2'b00 ;
            ALUSrc = 1 ;
            MemWrite = 0 ;
            ResultSrc = 2'b00 ;
            Branch = 0 ;
            ALUOp = 2'b10 ;
            Jump = 0 ;
        end
        7'b1101111 : begin  //jal instruction
            RegWrite = 1;
            ImmSrc = 2'b11 ;
            ALUSrc = 1'bx ;
            MemWrite = 0 ;
            ResultSrc = 2'b10 ;
            Branch = 0 ;
            ALUOp = 2'bxx ;
            Jump = 1 ;
        end 
        default : begin  //default is no instruction
            RegWrite = 0;
            ImmSrc = 2'b00 ;
            ALUSrc = 0 ;
            MemWrite = 0 ;
            ResultSrc = 2'b00 ;
            Branch = 0 ;
            ALUOp = 2'b00 ;
            Jump = 0 ;
        end
    endcase
end
//implementing ALU decoder
always @(*) begin
    case(ALUOp)
        2'b00 : ALUControl = 3'b000 ;  //add  (lw,sw)
        2'b01 : ALUControl = 3'b001 ;  //sub  (beq)
        2'b10 : begin  //for R-type and I-type instructions
            case(funct3)
                3'b000 : begin 
                    if ({OP[5],funct7} == 2'b11)
                        ALUControl = 3'b001 ;  //sub 
                    else
                        ALUControl = 3'b000 ; //add
                end
                3'b010 : ALUControl = 3'b101 ; //slt
                3'b110 : ALUControl = 3'b011 ; //or
                3'b111 : ALUControl = 3'b010 ; //and
                default : ALUControl = 3'b000 ; //default is add
            endcase
        end
        default : ALUControl = 3'b000 ; //default is add
    endcase
end
assign PCSrc = (Jump | (Branch & Zero)) ; //PCSrc flag 
endmodule