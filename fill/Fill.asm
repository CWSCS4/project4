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

@SCREEN
D=A
@0
M=D	//TRACK PIXEL DISPLACEMENT

(KBDCHECK)
@KBD
D=M
@BLACKEN
D;JGT	//BLACKEN IF ANY KEYS ARE PRESSED
@KBDCHECK
0;JMP

(BLACKEN)
@0 //Blacken pixel
A=M
M=-1
@0 //Next pixel
M=M+1
D=M
@KBD //Make sure it's not at the end
D=A-D
@WAIT
D;JEQ
@KBD //Make sure the button is still pressed
D=M
@WHITEN
D;JEQ
@BLACKEN
0;JMP

(WAIT)
@KBD
D=M
@WHITEN
D;JEQ
@WAIT
0;JMP

(WHITEN)
@0 //Whiten pixel
M=M-1
D=M
A=M
M=0
@SCREEN
D=D-A
@KBDCHECK
D;JEQ
@KBD
D=M
@BLACKEN
D;JGT
@WHITEN
0;JMP
