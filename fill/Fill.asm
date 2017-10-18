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

(START)
@SCREEN
D=A
@0      //SET PIXEL NUMBER
M=D

(KBDCHECK)
@KBD
D=M
@WHITE
D;JEQ
@BLACK
D;JGT
@KBDCHECK
0;JMP

(WHITE)
@1      //TRACK FILLER COLOR
M=0
@SHIFT
0;JMP

(BLACK)
@1      //TRACK FILLER COLOR
M=-1
@COLOR
0;JMP

(COLOR)
@1      //CHECK FILLER COLOR
D=M
@0      //FILL PIXEL WITH COLOR
A=M
M=D
@0      //INC PIXEL NUMBER
M=M+1
D=M
@SCREEN
D=A-D
@0      //INC PIXEL NUMBER
A=M+1
@COLOR  //LOOP THROUGH COLOR IF 
D;JGT
@START  //GO BACK TO START IF DONE
0;JMP
