// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
(LOOP) // wait for keyboard input

	// set count to 0
	@count
	M=0

	// check for keyboard input
	@24576
	D=M

	// if keyboard input > 0, jump to DRAW
	@DRAW
	D;JGT

	// if keyboard input = 0, jump to CLEAR
	@CLEAR
	D;JEQ

(CLEAR) // clear the screen

	// load and increment screen location to next pixel
	@count
	D=M
	@SCREEN
	A=A+D
	M=0

	// add 1 to count
	@count
	M=M+1

	// set the number of pixels to 8192
	@8192
	D=A

	// get the value of count, subtract the number of pixels already set
	@count
	// D is set, M is count: D = count - set
	D=M-D

	// jump back to CLEAR if the number of pixels already cleared < count
	// if cleared < count (count - cleared > 0), loop
	@CLEAR
	D;JLT
	@LOOP
	0;JMP

(DRAW) // fill the screen
	// load and increment screen location to next pixel
	@count
	D=M
	@SCREEN
	A=A+D
	M=-1

	// add 1 to count
	@count
	M=M+1

	// set the number of pixels to 8192
	@8192
	D=A

	// get the value of count, subtract the number of pixels already set
	@count
	// D is set, M is count: D = count - set
	D=M-D

	// jump back to DRAW if the number of pixels already set < count
	// if set < count (count - set > 0), loop
	@DRAW
	D;JLT
	@LOOP
	0;JMP