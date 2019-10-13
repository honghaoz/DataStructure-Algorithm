// 300_Longest Increasing Subsequence
// https://leetcode.com/problems/longest-increasing-subsequence/
//
// Created by Honghao Zhang on 9/22/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given an unsorted array of integers, find the length of longest increasing subsequence.
//
//Example:
//
//Input: [10,9,2,5,3,7,101,18]
//Output: 4
//Explanation: The longest increasing subsequence is [2,3,7,101], therefore the length is 4.
//Note:
//
//There may be more than one LIS combination, it is only necessary for you to return the length.
//Your algorithm should run in O(n2) complexity.
//Follow up: Could you improve it to O(n log n) time complexity?
//

import Foundation

class Num300 {
  // brute force time complexity: 2^n
  // For each element, you can choose or not choose, thus, 2^n

  // Standard DP solution
  // Time Complexity: O(n^2)
  func lengthOfLIS_dp(_ nums: [Int]) -> Int {
    guard nums.count > 0 else {
      return 0
    }
    if nums.count == 1 {
      return 1
    }

    //       0. 1. 2. 3. 4. 5.   6.  7
    //     [10, 9, 2, 5, 3, 7, 101, 18]
    // s[i]  1. 1. 1. 2. 2, 3,   4,  4
    // s[i] the longest increasing subsequence ends at index i

    var s: [Int] = Array(repeating: 1, count: nums.count)

    for i in 1..<nums.count {
      // s[i] = for j in [0, i), the max s[j] + 1
      for j in 0..<i {
        if nums[j] < nums[i] {
          s[i] = max(s[i], s[j] + 1)
        }
      }
    }

    var maxLength = 0
    for i in 0..<nums.count {
      maxLength = max(maxLength, s[i])
    }
    return maxLength
  }

  // Recursion with memoization
  var cache: [Int: [Int: Int]] = [:]

  func lengthOfLIS_recursive(_ nums: [Int]) -> Int {
    guard nums.count > 0 else {
      return 0
    }

    return lengthOfLIS(nums, 0, Int.min)
  }

  /// Find the length of LIS in [startIndex, nums.count - 1]
  /// with the max previous value, the result of LIS is > maxPreviousValue
  func lengthOfLIS(_ nums: [Int], _ startIndex: Int, _ maxPreviousValue: Int) -> Int {
    guard startIndex >= 0 else {
      assertionFailure()
      return -1
    }
    guard startIndex < nums.count else {
      assertionFailure()
      return -1
    }

    // base case
    if startIndex == nums.count - 1 {
      return nums[startIndex] > maxPreviousValue ? 1 : 0
    }

    if let result = cache[startIndex]?[maxPreviousValue] {
      return result
    }

    // case1: take nums[startIndex]
    //   nums[startIndex] must > maxPreviousValue
    //   compute the LIS of startIndex + 1 with max previous value is nums[startIndex]
    // case2: not take nums[startIndex]
    //   compute the LIS of startIndex + 1 wiht maxPreviousValue

    // the LIS from startIndex is the max between case1 and case2

    let taken: Int
    if nums[startIndex] > maxPreviousValue {
      taken = 1 + lengthOfLIS(nums, startIndex + 1, nums[startIndex])
    } else {
      taken = 0
    }

    let notTaken = lengthOfLIS(nums, startIndex + 1, maxPreviousValue)
    let length = max(taken, notTaken)

    if var dict = cache[startIndex] {
      dict[maxPreviousValue] = length
      cache[startIndex] = dict
    } else {
      cache[startIndex] = [maxPreviousValue: length]
    }
    return length
  }
}
