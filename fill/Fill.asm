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

//RAM[0] contains an index of the screen that the program is filling/erasing at
@SCREEN
D=A
@0
M=D

(LOOP)

//D is greater than 0 if a key is pressed, and 0 if no key is pressed
@KBD
D=M

//Runs the code to erase the screen if no key is held, otherwise runs the code to fill the screen
@ERASE
D;JEQ

//Code to change the pixels at the screen index to black:

//If the screen index is at the end of the screen, don't do anything
@24576
D=A
@0
D=D-M
@LOOP
D;JLE

//The program sets the set of 16 pixels at the index to all be black
@0
A=M
M=-1

//Increments screen index by 1
D=A+1
@0
M=D

//Starts new iteration of the loop
@LOOP
0;JMP

(ERASE)

//Code to clear the pixels before the screen index:

//If the screen index is at the start of the screen, don't do anything
@SCREEN
D=A
@0
D=M-D
@LOOP
D;JLE

//Sets A to the block of pixels before the screen index, and sets that set of pixels to white
@0
A=M
A=A-1
M=0

//Sets RAM[0] to the new decremented screen index
D=A
@0
M=D

//Starts new iteration of the loop
@LOOP
0;JMP
