// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

//Initialize RAM[2] to 0
@2
M=0

(LOOP)

//Decrements RAM[0], and ends the program if RAM[0] was 0 before it was decremented
@0
D=M-1
M=D
@END
D;JLT

//Adds RAM[1] to RAM[2]
@1
D=M
@2
M=M+D

@LOOP
0;JMP


//By the end of the loop, RAM[1] will be added to RAM[2] exactly RAM[0] times, so RAM[2]=RAM[0]*RAM[1]
(END)

@END
0;JMP
