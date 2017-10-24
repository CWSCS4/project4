// File name: Move.asm

// Runs an infinite loop that listens to the keyboard input.
// Draws a 16-by-16 square to the top left corner of the screen.
// When a key is pressed and released (any key), the rectangle is
// moved 16 pixels to the right.

// Challenge versions (please specify if you are doing one of these):
// (Only try these if they sound interesting to you.)
//   - Instead of moving in 16-pixel increments, move in 5-pixel increments.
//   - Instead of moving whenever a key is pressed and released,
//       move gradually while a key is pressed down. <-- I'm doing this one

//RAM[0] contains an index of the screen that the top row of the square is at
@SCREEN
D=A
@0
M=D

(LOOP)

//Draws a 16x16 square at the current square index
@16
D=A
@1
M=D
@0
D=M
@2
M=D

(DRAWSQUARE)

@32
D=A

@2
A=M

M=-1
D=A
@32
D=D+A
@2
M=D

@1
M=M-1
D=M

@DRAWSQUARE
D;JGT

//D is set to greater than 0 if a key is pressed, and to 0 if no key is pressed
@KBD
D=M

//Runs the code to move the square left if no key is held, otherwise runs the code to move the square right
@MOVELEFT
D;JEQ

//Code to move the square to the right:

//If the square is at the right edge of the screen, don't do anything
@16416
D=A
@0
D=D-M
@LOOP
D;JLE

//The program erases the previous square location
@16
D=A
@1
M=D
@0
D=M
@2
M=D

(ERASELEFTSQUARE)

@32
D=A

@2
A=M

M=0
D=A
@32
D=D+A
@2
M=D

@1
M=M-1
D=M

@ERASELEFTSQUARE
D;JGT

//Increments square index by 1
@0
M=M+1

//Starts new iteration of the loop
@LOOP
0;JMP

(MOVELEFT)

//Code to move the square to the left:

//If the square is at the left edge of the screen, don't do anything
@SCREEN
D=A
@0
D=M-D
@LOOP
D;JLE

//The program erases the previous square location
@16
D=A
@1
M=D
@0
D=M
@2
M=D

(ERASERIGHTSQUARE)

@32
D=A

@2
A=M

M=0
D=A
@32
D=D+A
@2
M=D

@1
M=M-1
D=M

@ERASERIGHTSQUARE
D;JGT

//Decrements square index by 1
@0
M=M-1

//Starts new iteration of the loop
@LOOP
0;JMP
