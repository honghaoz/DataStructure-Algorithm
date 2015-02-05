# ZigZag Conversion
# The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)
# P   A   H   N
# A P L S I I G
# Y   I   R

# And then read line by line: "PAHNAPLSIIGYIR"
# Write the code that will take a string and make this conversion given a number of rows:
# string convert(string text, int nRows);
# convert("PAYPALISHIRING", 3) should return "PAHNAPLSIIGYIR".

class Solution:
    # @return a string
    def convert(self, s, nRows):
        if nRows == 1:
            return s
        res = ""
        length = len(s)
        for row in xrange(nRows):
            section = 0
            while section < length / (2 * nRows - 2) + 1:
                if row == 0:
                    index = (2 * nRows - 2) * section
                    if index < length:
                        res += s[index] 
                elif row == nRows - 1:
                    index = (2 * nRows - 2) * section + nRows - 1
                    if index < length:
                        res += s[index]
                else:
                    firstIndex = (2 * nRows - 2) * section + row
                    if firstIndex < length:
                        res += s[firstIndex]
                    secondIndex = (2 * nRows - 2) * (section + 1) - row
                    if secondIndex < length:
                        res += s[secondIndex]
                section += 1
        return res

def main():
    s = Solution()
    print "Passed" if "PAHNAPLSIIGYIR" == s.convert("PAYPALISHIRING", 3) else "Failed"

main()