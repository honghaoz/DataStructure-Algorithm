import unittest
import math

# Given two squares on a two-dimensional plane, find a line that would cut
# these two squares in half. Assume that the top and the bottom sides of
# the square run parallel to the x-axis.

class Point(object):
	def __init__(self, x, y):
		self.x = x
		self.y = y

	def __eq__(self, p):
		if not isinstance(p, Point):
			if p == None and self is None:
				return True
			else:
				return False
		return self.x == p.x and self.y == p.y

	def __ne__(self, p):
		return not self.__eq__(p)

	def __str__(self):
		return "(" + str(self.x) + ", " + str(self.y) + ")"

	def moveWithDelta(self, deltaX, deltaY):
		self.x = self.x + deltaX
		self.y = self.y + deltaY

	def lineSegmentWithPoint(self, p):
		if isinstance(p, Point):
			return LineSegment(self, p)
		else:
			return None

	def lineWithPoint(self, p):
		seg = self.lineSegmentWithPoint(p)
		if not seg is None:
			return Line(seg.f, seg.b, seg.x)
		return None

class Line(object):
	def __init__(self, f, b, x = None):
		# f is None, if line is vertical to x-axis
		self.f = f
		self.b = b
		if f == None or b == None:
			assert(not x == None)
		self.x = x

	def __eq__(self, line):
		if not isinstance(line, Line):
			if line == None and self is None:
				return True
			else:
				return False
		return self.f == line.f and self.b == line.b

	def __ne__(self, line):
		return not self.__eq__(line)

	def intersection(self, line):
		if self.f == line.f and self.b == line.b:
			return self
		elif self.f == line.f and not self.b == line.b:
			return None
		else:
			if self.f == None or line.f == None:
				if self.f == None:
					x = self.x
					y = line.f * x + line.b
					return Point(x, y)
				else:
					x = line.x
					y = self.f * x + self.b
					return Point(x, y)
			x = float(self.b - line.b) / float(line.f - self.f)
			y = self.f * x + self.b
			return Point(x, y)

class LineSegment(Line):
	def __init__(self, p1, p2):
		self.beginPoint = p1
		self.endPoint = p2
		deltaX = float(p2.x - p1.x)
		deltaY = float(p2.y - p1.y)
		if deltaX == 0:
			super(LineSegment, self).__init__(None, None, p1.x)
		else:
			f = deltaY / deltaX
			b = (p2.x * p1.y - p1.x * p2.y) / deltaX
			super(LineSegment, self).__init__(f, b)

	def __eq__(self, seg):
		if not isinstance(seg, LineSegment):
			if seg == None and self is None:
				return True
			else:
				return False
		return self.beginPoint == seg.beginPoint and self.endPoint == seg.endPoint and super(LineSegment, self).__eq__(seg)

	def __ne__(self, seg):
		return not self.__eq__(seg)

	def length(self):
		deltaX = self.beginPoint.x - self.endPoint.x
		deltaY = self.beginPoint.y - self.endPoint.y
		return math.sqrt(deltaX ** 2 + deltaY ** 2)

	def intersection(self, segOrLine):
		if isinstance(segOrLine, Line):
			intersection = super(LineSegment, self).intersection(segOrLine)
			if intersection == None:
				return None
			elif isinstance(intersection, Line):
				return self
			elif intersection.x >= self.beginPoint.x and intersection.x <= self.endPoint.x and intersection.y >= self.beginPoint.y and intersection.y <= self.endPoint.y:
				return intersection
			else:
				return None
		elif isinstance(segOrLine, LineSegment):
			intersection = super(LineSegment, self).intersection(segOrLine)
			if intersection == None:
				return None
			elif isinstance(intersection, Line):
				return self if self.length() <= segOrLine.length() else segOrLine
			elif intersection.x >= self.beginPoint.x and intersection.x <= self.endPoint.x and intersection.y >= self.beginPoint.y and intersection.y <= self.endPoint.y and intersection.x >= segOrLine.beginPoint.x and intersection.x <= segOrLine.endPoint.x and intersection.y >= segOrLine.beginPoint.y and intersection.y <= segOrLine.endPoint.y:
				return intersection
			else:
				return None

class Rectangle(object):
	def __init__(self, topLeft, topRight, bottomLeft, bottomRight):
		assert(isinstance(topLeft, Point) and isinstance(topRight, Point) and isinstance(bottomLeft, Point) and isinstance(bottomRight, Point))
		assert(topLeft.y == topRight.y and bottomLeft.y == bottomRight.y)
		assert(topLeft.x == bottomLeft.x and topRight.x == bottomRight.x)

		self.topLeft = topLeft
		self.topRight = topRight
		self.bottomLeft = bottomLeft
		self.bottomRight = bottomRight
		self.width = topRight.x - topLeft.x 
		self.height = topLeft.y - bottomLeft.y
		self.center = Point(bottomLeft.x + self.width / 2.0, bottomLeft.y + self.height / 2.0)

	# def __init__(self, center, width, height):
	# 	assert(isinstance(center, Point))
	# 	assert(width >= 0 and height >= 0)
	# 	self.center = center
	# 	self.width = width
	# 	self.height = height

	# 	self.topLeft = Point(center.x - width / 2.0, center.y + height / 2.0)
	# 	self.topRight = Point(center.x + width / 2.0, center.y + height / 2.0)
	# 	self.bottomLeft = Point(center.x - width / 2.0, center.y - height / 2.0)
	# 	self.bottomRight = Point(center.x + width / 2.0, center.y - height / 2.0)

class Square(Rectangle):
	def __init__(self, topLeft, topRight, bottomLeft, bottomRight):
		super(Square, self).__init__(topLeft, topRight, bottomLeft, bottomRight)
		assert(self.width == self.height)
		self.sideLength = self.width

	# def __init__(self, center, width, height):
	# 	super(Square, self).__init__(center, width, height)
	# 	assert(width == height)
	# 	self.sideLength = width

	# def __init__(self, center, sideLength):
	# 	self.__init__(center, sideLength, sideLength)

class TestPoint(unittest.TestCase):
	def setUp(self):
		# print "In method", self._testMethodName
		pass

	def testInit(self):
		p = Point(2, 3)
		self.assertEqual(p.x, 2)
		self.assertEqual(p.y, 3)

	def testEqual(self):
		p = Point(3, 4)
		self.assertTrue(p == Point(3, 4))

	def testNotEqual(self):
		p = Point(3, 4)
		self.assertTrue(not p == Point(3, 3))

	def testMoveWithDelta(self):
		p = Point(3, 5)
		p.moveWithDelta(4, 9)
		self.assertEqual(p, Point(7, 14))

class TestLine(unittest.TestCase):
	def testInit(self):
		line = Line(1, 3)
		self.assertEqual(line.f, 1)
		self.assertEqual(line.b, 3)

	def testIntersection(self):
		line1 = Line(1, 3)
		line2 = Line(1, 3)
		self.assertEqual(line1.intersection(line2), line1)
		line3 = Line(1, 4)
		self.assertIsNone(line1.intersection(line3))
		line4 = Line(0, 3)
		self.assertEqual(line1.intersection(line4), Point(0, 3))
		line5 = Line(None, None, 1)
		self.assertEqual(line1.intersection(line5), Point(1, 4))

		line6 = Line(1, 0)
		line7 = Line(-1, 5)
		self.assertEqual(line6.intersection(line7), Point(2.5, 2.5))

class TestLineSegment(unittest.TestCase):
	def testInit(self):
		seg = LineSegment(Point(0, 0), Point(5, 5))
		self.assertEqual(seg.f, 1)
		self.assertEqual(seg.b, 0)
		self.assertEqual(seg.beginPoint, Point(0, 0))
		self.assertEqual(seg.endPoint, Point(5, 5))

	def testLength(self):
		seg = LineSegment(Point(1, 1), Point(5, 5))
		self.assertEqual(seg.length(), 4 * math.sqrt(2))

	def testIntersection(self):
		seg1 = LineSegment(Point(1, 1), Point(5, 5))
		seg2 = LineSegment(Point(0, 5), Point(5, 0))
		self.assertEqual(seg1.intersection(seg2), Point(2.5, 2.5))
		seg3 = Line(1, 0)
		self.assertEqual(seg1.intersection(seg3), seg1)
		seg4 = Line(2, 0)
		self.assertIsNone(seg1.intersection(seg4))
		seg5 = Line(None, None, 1)
		self.assertEqual(seg1.intersection(seg5), Point(1, 1))

def unitTest():
	unittest.main()

# unitTest()

# Solution
def cutInHalfLine(s1, s2):
	line = s1.center.lineWithPoint(s2.center)
	return line

def test():
	s1 = Square(Point(1, 5), Point(5, 5), Point(1, 1), Point(5, 1))
	s2 = Square(Point(2, 9), Point(4, 9), Point(2, 7), Point(4, 7))
	print "Passed" if cutInHalfLine(s1, s2) == Line(None, None, 3) else "Failed"
	s3 = Square(Point(-1, 1), Point(1, 1), Point(-1, -1), Point(1, -1))
	print "Passed" if cutInHalfLine(s1, s3) == Line(1, 0) else "Failed"


test()
