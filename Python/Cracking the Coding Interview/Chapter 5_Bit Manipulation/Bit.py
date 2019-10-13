# Bit manipulation

def intToBit(number):
	return bin(int(number)).replace("0b", "")
	# return "{0:b}".format(int(number))

def intToHex(number):
	return hex(int(number)).replace("0x", "")

def bitToInt(bitString):
	return int(bitString, 2)

def hexToInt(hexString):
	return int(hexString, 16)

def getBit(number, index):
	# return int(intToBit(number >> index)[-1])
	return int(number & (1 << index) != 0)

def setBit(number, index):
	return number | (1 << index)

def clearBit(number, index):
	return number & ~(1 << index)

def updateBit(number, index, newValue):
	if not (newValue == 0 or newValue == 1):
		return number
	mask = ~(1 << index)
	return (number & mask) | (newValue << index)

def clearBitToI(number, i):
	mask = ~((1 << (i + 1)) - 1)
	return number & mask

def test():
	print intToBit(5), bitToInt(intToBit(5))
	print intToHex(10), hexToInt(intToHex(10))

	# Test getBit
	print "Passed" if getBit(5, 0) == 1 else "Failed"
	print "Passed" if getBit(5, 1) == 0 else "Failed"
	print "Passed" if getBit(5, 2) == 1 else "Failed"
	print "Passed" if getBit(5, 5) == 0 else "Failed"

	a = 5
	a = setBit(a, 1)
	print "Passed" if intToBit(a) == "111" else "Failed"

	a = 5
	a = clearBit(a, 0)
	print "Passed" if intToBit(a) == "100" else "Failed"

	a = 5
	a = updateBit(a, 3, 1)
	print "Passed" if intToBit(a) == "1101" else "Failed"

	a = 5
	a = clearBitToI(a, 1)
	print "Passed" if intToBit(a) == "100" else "Failed"
	
# test()
