// 228. Summary Ranges
// https://leetcode.com/problems/summary-ranges/
//
// Given a sorted integer array without duplicates, return the summary of its ranges.
//
// Example 1:
//
//   Input:  [0,1,2,4,5,7]
//   Output: ["0->2","4->5","7"]
//   Explanation: 0,1,2 form a continuous range; 4,5 form a continuous range.
// 
// Example 2:
//
//   Input:  [0,2,3,4,6,8,9]
//   Output: ["0","2->4","6","8->9"]
//   Explanation: 2,3,4 form a continuous range; 8,9 form a continuous range.

// 一个有序数组，把连续的数字用一个range表示

class Num228_SummaryRanges {
  // MARK: - Common way: scan from left to right, build results in progress
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

  // MARK: - Common way2: scan from left to right, use i for start and j for end.
  func summaryRanges_standard(_ nums: [Int]) -> [String] {
    guard nums.count > 0 else { return [] }
    var i = 0
    var res: [String] = []
    while i < nums.count {
      var j = i
      while j < nums.count, j + 1 < nums.count && nums[j + 1] == nums[j] + 1 {
        j += 1
      }
      if j == i {
        res.append("\(nums[i])")
      } else {
        res.append("\(nums[i])->\(nums[j])")
      }
      i = j + 1
    }
    return res
  }

  // Inset a separator at the break point, then split into segments, then maps to string.
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

  // Reduce into number segments
  func summaryRanges_reduce(_ nums: [Int]) -> [String] {
    let consequentNumArrays = nums.reduce([]) { (res, currentNum) -> [[Int]] in
      var res = res
      if var lastArray = res.last {
        if lastArray.last! == currentNum - 1 {
          // consequent
          res = res.dropLast(1)
          lastArray.append(currentNum)
          res.append(lastArray)
          return res
        } else {
          // append new arrays
          res.append([currentNum])
          return res
        }
      } else {
        res.append([currentNum])
        return res
      }
    }
    return consequentNumArrays.map { nums -> String in
      if nums.count == 1 {
        return String(nums[0])
      } else {
        return "\(nums[0])->\(nums.last!)"
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
