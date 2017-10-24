// File name: Move.asm

// Runs an infinite loop that listens to the keyboard input.
// Draws a 16-by-16 square to the top left corner of the screen.
// When a key is pressed and released (any key), the rectangle is
// moved 16 pixels to the right.

// Challenge versions (please specify if you are doing one of these):
// (Only try these if they sound interesting to you.)
//   - Instead of moving in 16-pixel increments, move in 5-pixel increments.
//   - Instead of moving whenever a key is pressed and released,
//       move gradually while a key is pressed down. <-- doing this one

@SCREEN
D=A
@0
M=D	//TRACK PIXEL LOCATION

(RECTANGLE)
@0 //Black out first row of rectangle
A=M
D=A
M=-1
@32 //Black out second row of rectangle
D=D+A
A=D
M=-1
@32 //Black out third row of rectangle
D=D+A
A=D
M=-1
@32 //Black out fourth row of rectangle
D=D+A
A=D
M=-1
@32 //Black out fifth row of rectangle
D=D+A
A=D
M=-1
@32 //Black out sixth row of rectangle
D=D+A
A=D
M=-1
@32 //Black out seventh row of rectangle
D=D+A
A=D
M=-1
@32 //Black out eighth row of rectangle
D=D+A
A=D
M=-1
@32 //Black out ninth row of rectangle
D=D+A
A=D
M=-1
@32 //Black out tenth row of rectangle
D=D+A
A=D
M=-1
@32 //Black out eleventh row of rectangle
D=D+A
A=D
M=-1
@32 //Black out twelfth row of rectangle
D=D+A
A=D
M=-1
@32 //Black out thirteenth row of rectangle
D=D+A
A=D
M=-1
@32 //Black out fourteenth row of rectangle
D=D+A
A=D
M=-1
@32 //Black out fifteenth row of rectangle
D=D+A
A=D
M=-1
@32 //Black out sixteenth row of rectangle
D=D+A
A=D
M=-1

(KBDCHECK)
@KBD
D=M
@WAIT
D;JGT
@KBDCHECK
0;JMP

(WAIT)
@KBD
D=M
@WHITEOUT
D;JEQ
@WAIT
0;JMP

(WHITEOUT)
@0 //White out first row of rectangle
A=M
D=A
M=0
@32 //White out second row of rectangle
D=D+A
A=D
M=0
@32 //White out third row of rectangle
D=D+A
A=D
M=0
@32 //White out fourth row of rectangle
D=D+A
A=D
M=0
@32 //White out fifth row of rectangle
D=D+A
A=D
M=0
@32 //White out sixth row of rectangle
D=D+A
A=D
M=0
@32 //White out seventh row of rectangle
D=D+A
A=D
M=0
@32 //White out eighth row of rectangle
D=D+A
A=D
M=0
@32 //White out ninth row of rectangle
D=D+A
A=D
M=0
@32 //White out tenth row of rectangle
D=D+A
A=D
M=0
@32 //White out eleventh row of rectangle
D=D+A
A=D
M=0
@32 //White out twelfth row of rectangle
D=D+A
A=D
M=0
@32 //White out thirteenth row of rectangle
D=D+A
A=D
M=0
@32 //White out fourteenth row of rectangle
D=D+A
A=D
M=0
@32 //White out fifteenth row of rectangle
D=D+A
A=D
M=0
@32 //White out sixteenth row of rectangle
D=D+A
A=D
M=0
@0
M=M+1
@RECTANGLE
0;JMP
