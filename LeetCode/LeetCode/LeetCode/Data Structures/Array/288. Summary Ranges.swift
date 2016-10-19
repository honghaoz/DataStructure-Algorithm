// https://leetcode.com/problems/summary-ranges/

//
// Given a sorted integer array without duplicates, return the summary of its ranges.
//
// For example, given [0,1,2,4,5,7], return ["0->2","4->5","7"].
//

class Num288_SummaryRanges {
    // Common way: scan from left to right, build results in progress
    func summaryRanges(_ nums: [Int]) -> [String] {
        guard nums.count > 1 else { return nums.map { return "\($0)" } }
        var results: [String] = []
        
        var startNumber: Int = nums[0]
        
        var previousNumber: Int = nums[0]
        for index in 1..<nums.count {
            let number = nums[index]
            if number - previousNumber == 1 {
                previousNumber = number
                continue
            } else {
                let segment: String
                if startNumber == previousNumber {
                    segment = "\(startNumber)"
                } else {
                    segment = "\(startNumber)->\(previousNumber)"
                }
                results.append(segment)
                startNumber = number
                previousNumber = number
                continue
            }
        }
        
        let segment: String
        if startNumber == previousNumber {
            segment = "\(startNumber)"
        } else {
            segment = "\(startNumber)->\(previousNumber)"
        }
        results.append(segment)
        
        return results
    }
    
    func summaryRanges2(_ nums: [Int]) -> [String] {
        
        // [1, 2, 4, 5]
        // [1, 1, 2, 1]
        
        // [1, 2, 4, 6, 7, 9]
        // [1, 1, 2, 2, 1, 2]
        
        // zip([1,2,3], ["a","b","c"])
        
        guard nums.count > 1 else { return nums.map { return "\($0)" } }
        
        let separator = nums[0] - 1
        var processedNums: [Int] = []
        for num in nums {
            if let lastNum = processedNums.last {
                if num - lastNum > 1 {
                    processedNums.append(separator)
                }
                processedNums.append(num)
            } else {
                processedNums.append(num)
            }
        }
        
        let segments = processedNums.split(separator: separator)
        return segments.map { segment -> String in
            guard let first = segment.first, let last = segment.last else {
                return ""
            }
            
            if first == last {
                return "\(first)"
            } else {
                return "\(first)->\(last)"
            }
        }
    }
    
    // Test Cases
    // [] -> []
    // [1] -> ["1"]
    // [1, 2] -> ["1->2"]
    // [1, 3] -> ["1", "3"]
    // [1, 2, 3] -> ["1->3"]
    // [1, 2, 4] -> ["1->2", "4"]
    // [1, 3, 4] -> ["1", "3->4"]
    // [1, 3, 5] -> ["1", "3", "5"]
    // [1, 2, 3, 4] -> ["1->4"]
    // [1, 2, 3, 5] -> ["1->3", "5"]
    // [1, 2, 4, 5] -> ["1->2", "4->5"]
    func test() {
        print(summaryRanges([]) == [String]())
        print(summaryRanges([1]) == ["1"])
        print(summaryRanges([1, 2]) == ["1->2"])
        print(summaryRanges([1, 3]) == ["1", "3"])
        print(summaryRanges([1, 2, 3]) == ["1->3"])
        print(summaryRanges([1, 2, 4]) == ["1->2", "4"])
        print(summaryRanges([1, 3, 4]) == ["1", "3->4"])
        print(summaryRanges([1, 3, 5]) == ["1", "3", "5"])
        print(summaryRanges([1, 2, 3, 4]) == ["1->4"])
        print(summaryRanges([1, 2, 3, 5]) == ["1->3", "5"])
        print(summaryRanges([1, 2, 4, 5]) == ["1->2", "4->5"])
        
        print(summaryRanges2([]) == [String]())
        print(summaryRanges2([1]) == ["1"])
        print(summaryRanges2([1, 2]) == ["1->2"])
        print(summaryRanges2([1, 3]) == ["1", "3"])
        print(summaryRanges2([1, 2, 3]) == ["1->3"])
        print(summaryRanges2([1, 2, 4]) == ["1->2", "4"])
        print(summaryRanges2([1, 3, 4]) == ["1", "3->4"])
        print(summaryRanges2([1, 3, 5]) == ["1", "3", "5"])
        print(summaryRanges2([1, 2, 3, 4]) == ["1->4"])
        print(summaryRanges2([1, 2, 3, 5]) == ["1->3", "5"])
        print(summaryRanges2([1, 2, 4, 5]) == ["1->2", "4->5"])
    }
}
