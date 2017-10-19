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

(RESTART)
@SCREEN
D=A
@0
M=D	//TRACK PIXEL LOCATION

(KBDCHECK)
@KBD
D=M
@BLACK
D;JGT	//JUMP IF ANY KEYS ARE PRESSED
@WHITE
D;JEQ	//ELSE JUMP TO WHITEN
@KBDCHECK
0;JMP

(BLACK)
@1
M=-1	//TRACK COLOR SETTING
@CHANGE
0;JMP

(WHITE)
@1
M=0	//TRACK COLOR SETTING
@CHANGE
0;JMP

(CHANGE)
@1	//CHECK COLOR SETTING
D=M
@0
A=M	//GET ADRESS OF SCREEN PIXEL TO FILL
M=D	//FILL IT
@0
D=M+1	//SET NEXT PIXEL LOCATION
@KBD
D=A-D	//KBD-SCREEN=PIXEL LOCATION
@0
M=M+1	//INC TO NEXT PIXEL
A=M
@CHANGE
D;JGT	//IF PIXEL LOCATION != SCREEN THAN KEEP CHANGING PIXEL COLORS
@RESTART
0;JMP
