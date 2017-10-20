// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

// Add RAM[0] to RAM[0], RAM[1] times. Then store it in RAM[2]

	// set count to 0, set sum to 0
	@count
	M=0
	@sum
	M=0

(LOOP)
	// go to count, add 1 to M and store in D
	@count
	M=M+1
	D=M

	// go to RAM[1], subtract the current counter from the value at RAM1
	@1
	D=M-D

	// if the current counter - RAM1 >= 0, jump to the end. This means that counter >= RAM1, so it's counted enough times.
	@END
	D;JLT

	// otherwise, save the value at RAM0
	@0
	D=M

	// add the value of RAM0 to sum
	@sum
	M=M+D

	// jump to the loop; it's not done yet.
	@LOOP
	0;JMP

(END)
	// store the value at sum
	@sum
	D=M

	// place value of sum in RAM[2]
	@2
	M=D