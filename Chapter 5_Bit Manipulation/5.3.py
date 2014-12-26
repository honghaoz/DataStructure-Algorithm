from Bit import *

# Given a positive integer, print the next smallest and the next largest number that have
# the same number of 1 bits in their binary representation

def findNext(num):
	bitString = intToBit(num)
	rightMostNonTrailingZeroIndex = findNoneTrailingZeroIndex(bitString)
	onesCount = 0
	i =  rightMostNonTrailingZeroIndex + 1
	while not i == 0:
		if bitString[i] == "1":
			onesCount += 1
		i += 1
	onesCount -= 1
	# Flip current one
	mask = 1 << (-rightMostNonTrailingZeroIndex - 1)
	num = num | mask

	# Clear all ones on the right
	mask = ~((1 << (-rightMostNonTrailingZeroIndex - 1)) - 1)
	num = num & mask

	# Set ones one the rightmost
	mask = (1 << onesCount) - 1
	num = num | mask
	return num

def findNoneTrailingZeroIndex(bitString):
	hasOnesOnTheRight = False
	currentIndex = -1
	lastNumber = "-"
	currentNumber = bitString[currentIndex]
	while (not hasOnesOnTheRight) or (currentNumber == "1"):
		if currentNumber == "1":
			hasOnesOnTheRight = True
		currentIndex -= 1
		lastNumber == currentNumber
		try:
			currentNumber = bitString[currentIndex]
		except:
			return currentIndex
	return currentIndex

def findPrev(num):
	bitString = intToBit(num)
	flipIndex = findRightMostOneIndexThatHasZeroOnTheRight(bitString)
	if flipIndex == None:
		return None
	onesCount = 0
	i = flipIndex
	while not i == 0:
		if bitString[i] == "1":
			onesCount += 1
		i += 1
	# Flip this index to 0
	mask = ~(1 << (-flipIndex - 1))
	num = num & mask

	# Clear rest
	mask = ~((1 << (-flipIndex - 1)) - 1)
	num = num & mask

	# Added ones
	mask = (1 << onesCount) - 1
	mask = (mask << ((-flipIndex - 1) - onesCount))
	num = num | mask
	return num

def findRightMostOneIndexThatHasZeroOnTheRight(bitString):
	bitString = bitString.lstrip("0")
	hasSeenZero = False
	currentIndex = -1
	currentNumber = bitString[currentIndex]
	while (not hasSeenZero) or currentNumber == "0":
		if currentNumber == "0":
			hasSeenZero = True
		currentIndex -= 1
		if -currentIndex > len(bitString):
			return None
		currentNumber = bitString[currentIndex]
	return currentIndex

def test():
	print "Passed" if findNext(3) == 5 else "Failed"
	print "Passed" if findNext(6) == 9 else "Failed"
	print "Passed" if findNext(11) == 13 else "Failed"
	print "Passed" if findNext(23) == 27 else "Failed"
	print "Passed" if findNext(24) == 33 else "Failed"
	print "Passed" if findNext(44) == 49 else "Failed"
	print "Passed" if findNext(46) == 51 else "Failed"

	print "Passed" if findPrev(49) == 44 else "Failed"
	print "Passed" if findPrev(33) == 24 else "Failed"
	print "Passed" if findPrev(27) == 23 else "Failed"
	print "Passed" if findPrev(12) == 10 else "Failed"
	print "Passed" if findPrev(13) == 11 else "Failed"
	print "Passed" if findPrev(9) == 6 else "Failed"
	print "Passed" if findPrev(5) == 3 else "Failed"
	print "Passed" if findPrev(7) == None else "Failed"

test()
