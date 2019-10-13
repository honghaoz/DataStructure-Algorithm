from LinkedList_Basic import Node
from LinkedList_Basic import LinkedList

# Check if a linked list is a palindrome

def isPalindromeIterative(aList):
	if aList.head == None:
		return True
	fastRunner = aList.head
	slowRunner = aList.head
	stack = []
	while True:
		try:
			fastRunner = fastRunner.next.next
		except:
			if not fastRunner == None and fastRunner.next == None: 
				# odd, extra push
				stack.append(slowRunner.data)
			break
		stack.append(slowRunner.data)
		slowRunner = slowRunner.next

	while not len(stack) == 0:
		popOne = stack.pop()
		if not popOne == slowRunner.data:
			return False
		slowRunner = slowRunner.next
	return True

def isPalindromeRecursion(aList):
	dummyNode, result = isPalindromeRecursionHelper(aList.head, aList.length())
	return result

def isPalindromeRecursionHelper(node, length):
	if length == 0:
		return node, True
	elif length == 1:
		return node.next, True

	returnedNode, isFailed = isPalindromeRecursionHelper(node.next, length - 2)
	if isFailed == False:
		return None, False
	elif not node.data == returnedNode.data:
		return None, False
	else:
		return returnedNode.next, True

def test():
	aList = LinkedList()
	aList.append(1)
	aList.append(2)
	aList.append(3)
	aList.append(2)
	aList.append(1)
	print "Passed" if isPalindromeIterative(aList) else "Failed"

	aList = LinkedList()
	aList.append(1)
	aList.append(2)
	aList.append(2)
	aList.append(1)

	print "Passed" if isPalindromeIterative(aList) else "Failed"

	print "Passed" if isPalindromeRecursion(aList) else "Failed"
	print "Passed" if isPalindromeRecursion(aList) else "Failed"

test()