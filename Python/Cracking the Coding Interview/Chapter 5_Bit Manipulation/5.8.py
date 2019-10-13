from Bit import *
from operator import xor

# A monochrome screen is stored as a single array of bytes, allowing eight consecutive pixels
# to be stored in one byte. The screen has width w, where w is divisible by 8 (that is, no byte
# will be split across rows). The height of screen, of course, can be derived from the length
# of the array and the width.
# Implement a function drawHorizontalLine(screen, width, x1, x2, y) which draws a horizontal line
# from (x1, y) to (x1, y)

# Suppose x, y starts from 0
def drawHorizontalLine(screen, width, x1, x2, y):
	startIndex = y * width / 8
	x1Offset = x1 % 8
	x2Offset = x2 % 8
	x1Index = x1 / 8
	x2Index = x2 / 8
	if x2Index == x1Index:
		lengthOfOnes = x2Offset - x1Offset + 1
		value = (1 << lengthOfOnes) - 1
		offset = 8 - x2Offset - 1
		value = value << offset
		screen[startIndex + x1Index] |= value
	else:
		# Set bits in x1
		value = ((1 << (8 - x1Offset)) - 1)
		screen[startIndex + x1Index] |= value

		# Set bits from x1 to x2
		for i in xrange(x2Index - x1Index - 1):
			index = startIndex + x1Index + 1 + i
			screen[index] = bitToInt("11111111")

		# Set bits in x2
		lengthOfOnes = x2Offset + 1
		value = (1 << lengthOfOnes) - 1
		offset = 8 - x2Offset - 1
		value = value << offset
		screen[startIndex + x2Index] |= value

def test():
	screen = [0,0,0,0,0,0,0,0,0,0,0,0]
	drawHorizontalLine(screen, 8, 1, 2, 0)
	print "Passed" if screen == [bitToInt("01100000"),0,0,0,0,0,0,0,0,0,0,0] else "Failed"

	screen = [0,0,0,0,0,0,0,0,0,0,0,0]
	drawHorizontalLine(screen, 8, 2, 6, 0)
	print "Passed" if screen == [bitToInt("00111110"),0,0,0,0,0,0,0,0,0,0,0] else "Failed"

	screen = [0,0,0,0,0,0,0,0,0,0,0,0]
	drawHorizontalLine(screen, 8, 3, 6, 1)
	print "Passed" if screen == [0,bitToInt("00011110"),0,0,0,0,0,0,0,0,0,0] else "Failed"

	screen = [0,0,
			  0,0,
			  0,0,
			  0,0]
	drawHorizontalLine(screen, 16, 3, 6, 1)
	print "Passed" if screen == [0,0,
								 bitToInt("00011110"),0,
								 0,0,
								 0,0] else "Failed"

	screen = [0,0,
			  0,0,
			  0,0,
			  0,0]
	drawHorizontalLine(screen, 16, 3, 10, 1)
	print "Passed" if screen == [0,0,
								 bitToInt("00011111"),bitToInt("11100000"),
								 0,0,
								 0,0] else "Failed"

	screen = [0,0,
			  0,0,
			  0,0,
			  0,0]
	drawHorizontalLine(screen, 16, 0, 15, 1)
	print "Passed" if screen == [0,0,
								 bitToInt("11111111"),bitToInt("11111111"),
								 0,0,
								 0,0] else "Failed"

	screen = [0,0,0,
			  0,0,0,
			  0,0,0,
			  0,0,0]
	drawHorizontalLine(screen, 24, 2, 17, 1)
	print "Passed" if screen == [0,0,0,
								 bitToInt("00111111"),bitToInt("11111111"),bitToInt("11000000"),
								 0,0,0,
								 0,0,0] else "Failed"

test()
