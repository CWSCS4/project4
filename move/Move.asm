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

// the screen is 512 x 256

// set loc to 0, create square

@loc
M=0
@SQUARE
0;JMP

(POLL)
	// check keyboard input
	@24576
	D=M
	// if no input, poll again
	@POLL
	D;JEQ
	// otherwise, increment loc by 1, then draw square
	@loc
	M=M+1
	D=M
	@32
	// loc = loc - 32. If loc = 0, set loc = 0
	D=D-A
	@RESETLOC
	D;JEQ

// if it doesn't need to reset the location, jump to the square
(MAKESQUARE)
	@SQUARE
	0;JMP

(RESETLOC)
	// clear the very last line because going backwards at 0 does not clear correctly
	@511
	D=A
	@SCREEN
	A=A+D
	M=0
	// reset the location to 0 to start a new square
	@loc
	M=0
	@MAKESQUARE
	0;JMP

(SQUARE) // set count to 0
	@count
	M=0

	// put 32 in RAM[1] for future use
	@32
	D=A
	@1
	M=D

(DRAW)
	// store value of count in RAM[0]
	@count
	D=M
	@0
	M=D

	// multiply the count by 32
	@MULT
	0;JMP

(CONTINUE)
	// take multiplied value, at RAM[2]
	@2
	D=M

	// increment the location needed
	@loc
	D=D+M

	// increment screen to the address
	@SCREEN
	A=A+D
	// set previous block to white
	A=A-1
	M=0
	// set next block to black
	A=A+1
	M=-1

	// increment count
	@count
	M=M+1
	D=M

	// only do this for 16 lines.
	@16
	D=A-D

	@DRAW
	D;JGT
	@END
	D;JLT


// code for multiplication, taken from mult.asm
(MULT)
	// set mcount to 0, set sum to 0
	@mcount
	M=0
	@sum
	M=0

(LOOP)
	// go to mcount, add 1 to M and store in D
	@mcount
	M=M+1
	D=M

	// go to RAM[1], subtract the current counter from the value at RAM1
	@1
	D=M-D

	// if the current counter - RAM1 >= 0, jump to the return. This means that counter >= RAM1, so it's counted enough times.
	@RETURN
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

(RETURN)
	// store the value at sum
	@sum
	D=M

	// place value of sum in RAM[2]
	@2
	M=D

	// go back to continue
	@CONTINUE
	0;JMP

(END)
	@POLL
	0;JMP