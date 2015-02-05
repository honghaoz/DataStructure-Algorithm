# amicable pair
# 
# 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110 = d(220) = 284. 
# 1, 2, 4, 71, 142; so d(284) = 220.
# 
# amicable pair
# (220, 284)
#
# takes some number n > 0 and finds all the amicable pairs below that number n
# 
# 0 < n
# n = 4
# 
# (220, 284), 
# (1184, 1210), 
# (2620, 2924), 
# (5020, 5564), 
# (6232, 6368)
# 

dividerTable = {} # {6: [1, 2, 3]}

def getDividers(n):
    if n in dividerTable:
        return dividerTable[n]
    else:
        newDividers = []
        for i in xrange(1, n / 2 + 1):
            if n % i == 0:
                newDividers.append(i)
        dividerTable[n] = newDividers
        return newDividers

sumTable = {} # {220: 284, 284: 220}

def sumOfDividers(num):
	if num in sumTable:
		 return sumTable[num]
	summ = 0
	if num in dividerTable:
		summ = sum(dividerTable[num])
	else:
		summ = sum(getDividers(num))
	sumTable[num] = summ
	return summ

def getPairs(num):
	result = []
	for i in xrange(2, num):
		summ = sumOfDividers(i)
		if i == sumOfDividers(summ) and (not i == summ):
			if not (((i, summ) in result) or ((summ, i) in result)):
				result.append((i, summ))
	return result

print getPairs(8000)