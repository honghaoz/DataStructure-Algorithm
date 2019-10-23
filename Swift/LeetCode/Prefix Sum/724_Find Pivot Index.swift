// 724_Find Pivot Index
// https://leetcode.com/problems/find-pivot-index/
//
// Created by Honghao Zhang on 10/16/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given an array of integers nums, write a method that returns the "pivot" index of this array.
//
//We define the pivot index as the index where the sum of the numbers to the left of the index is equal to the sum of the numbers to the right of the index.
//
//If no such index exists, we should return -1. If there are multiple pivot indexes, you should return the left-most pivot index.
//
//Example 1:
//
//Input:
//nums = [1, 7, 3, 6, 5, 6]
//Output: 3
//Explanation:
//The sum of the numbers to the left of index 3 (nums[3] = 6) is equal to the sum of numbers to the right of index 3.
//Also, 3 is the first index where this occurs.
//
//
//Example 2:
//
//Input:
//nums = [1, 2, 3]
//Output: -1
//Explanation:
//There is no index that satisfies the conditions in the problem statement.
//
//
//Note:
//
//The length of nums will be in the range [0, 10000].
//Each element nums[i] will be an integer in the range [-1000, 1000].
//

// 找到一个点，这个点左边的所有值的sum和右边的所有值的sum（不包含这个点本身）

import Foundation

class Num724 {
  // MARK: - Prefix Sum
  // 先求出sum，然后在求leftSum的时候，rightSum = sum - leftSum - num[i]
  // 那么循环过程中就可以找到leftSum == rightSum的时候
  func pivotIndex(_ nums: [Int]) -> Int {
    var sum = 0
    var leftSum = 0
    for n in nums {
      sum += n
    }

    for i in 0..<nums.count {
      let rightSum = sum - leftSum - nums[i]
      if leftSum == rightSum {
        return i
      }
      leftSum += nums[i]
    }
    return -1
  }
}
