//assembly code to test functionality

//1: I-type
//2: S-type
//3: R-type
//4: B-type
//5: J-type
//6: I-type

lw x6, -4(x9)   //Address 0x0000  (will assign the value 9 from data memory in x6)
sw x6, 8(x9)   //Address 0x0004   (will print the value 9 at address 3 in the Data Memory)
or x4, x5, x6   //Address 0x0008
beq x4, x4, 32  //Address 0x000C  (this will incerement the pc by 16 which increments the address of instruction memory by 4)
jal x10 , 128  //Address 0x001C   (this will incerement the PC by 64 which will incremnt the instruction memory address by 16)
addi x1, x0, 8  //Address 0x005C
  