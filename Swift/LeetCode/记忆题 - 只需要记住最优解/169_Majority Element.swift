// 169. Majority Element
// https://leetcode.com/problems/majority-element/
// 
// Given an array of size n, find the majority element. The majority element is the element that appears more than ⌊ n/2 ⌋ times.
//
// You may assume that the array is non-empty and the majority element always exist in the array.
//
// Example 1:
//
//   Input: [3,2,3]
//   Output: 3
//
// Example 2:
//
//   Input: [2,2,1,1,1,2,2]
//   Output: 2

// 找出一堆数字array中的主要数字（>= n/2)

import Foundation

class Num169_MajorityElement: Solution {
  // MARK: - Boyer-Moore Voting Algorithm (counting)
  // Choose candidate when count is 0. +1, if same, -1 if not.
  // O(n)
  // O(1)
  func boyer_moore_voting(_ nums: [Int]) -> Int {
    var candidate: Int?
    var count = 0
    for i in 0..<nums.count {
      if count == 0 {
        candidate = nums[i]
      }
      if nums[i] == candidate {
        count += 1
      } else {
        count -= 1
      }
    }
    return candidate!
  }

  // MARK: - Use dictionary to count the frequency.
  // O(n)
  // O(n)
  func dictionary1(_ nums: [Int]) -> Int {
    // Normal way to build the dictionary.
    var numCount: [Int : Int] = [:]
    nums.forEach {
      if let count = numCount[$0] {
        numCount[$0] = count + 1
      } else {
        numCount[$0] = 1
      }
    }
    return numCount.filter {
      return $0.value > nums.count / 2
    }.first!.key
  }

  // MARK: - Use dictionary to count the frequency.
  func dictionary2(_ nums: [Int]) -> Int {
    let mappedNums = nums.map { ($0, 1) }
    // Short version:
    let numberCountDict = Dictionary(mappedNums, uniquingKeysWith: +)
    // Long version:
    // let numberCountDict = Dictionary(mappedNums, uniquingKeysWith: { firstValue, secondValue in
    //     return firstValue + secondValue
    // })
    return numberCountDict.filter { key, value in
      return value > nums.count / 2
    }.first!.key
  }

  // MARK: - Sorting the numbers, just return the number at index [count / 2].
  // O(n lgn)
  // O(1)
  func sorting(_ nums: [Int]) -> Int {
    return nums.sorted()[nums.count / 2]
  }

  // MARK: - Divide and Conquer
  func divideAndConquer(_ nums: [Int]) -> Int {
    return divideAndConquerHelper(nums, 0, nums.count - 1)
  }

  /// Find the major element for the index [start...end]
  private func divideAndConquerHelper(_ nums: [Int], _ start: Int, _ end: Int) -> Int {
    if start == end {
      return nums[start]
    }

    let mid = start + (end - start) / 2
    // 1,2 -> 1
    // 1,3 -> 2
    let leftMajor = divideAndConquerHelper(nums, start, mid)
    let rightMajor = divideAndConquerHelper(nums, mid + 1, end)

    if leftMajor == rightMajor {
      return leftMajor
    }
    else {
      // if not equal, needs to check which major has more counts for the range [start...end]
      var leftCount = 0
      var rightCount = 0
      for i in start...end {
        if nums[i] == leftMajor {
          leftCount += 1
        }
        if nums[i] == rightMajor {
          rightCount += 1
        }
      }
      if leftCount > rightCount {
        return leftMajor
      }
      else {
        return rightMajor
      }
    }
  }

  func test() {
    // [1] -> 1
    assert(dictionary1([1]) == 1)

    // 2 / 2 = 1
    // [1, 1] -> 1
    assert(dictionary1([1, 1]) == 1)

    // 3 / 2 = 1.5 = 1
    // [1, 1, 2] -> 1
    // [1, 1, 1] -> 1
    assert(dictionary1([1, 1, 2]) == 1)
    assert(dictionary1([1, 1, 1]) == 1)

    // 4/ 2 = 2
    // [1, 1, 1, 2] -> 1
    assert(dictionary1([1, 1, 1, 2]) == 1)

    assert(boyer_moore_voting([3, 3, 4]) == 3)
  }
}

// Discussion
// https://discuss.leetcode.com/topic/17446/6-suggested-solutions-in-c-with-explanations
