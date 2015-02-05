# # Largest Number
# # Given a list of non negative integers, arrange them such that they form the largest number.

# # For example, given [3, 30, 34, 5, 9], the largest formed number is 9534330.

# # Note: The result may be very large, so you need to return a string instead of an integer.

class Solution:
    # @param num, a list of integers
    # @return a string
    def largestNumber(self, num):
        comp=lambda a,b:1 if a+b>b+a else -1 if a+b<b+a else 0
        num=map(str,num)
        num.sort(cmp=comp,reverse=True)
        return str(int("".join(num)))

def main():
    s = Solution()
    print "Passed" if "21" == s.largestNumber([1,2]) else "Failed"
    print "Passed" if "4321" == s.largestNumber([1,2,43]) else "Failed"
    print "Passed" if "434021" == s.largestNumber([1,2,43,40]) else "Failed"
    print "Passed" if "12121" == s.largestNumber([121,12]) else "Failed"

main()