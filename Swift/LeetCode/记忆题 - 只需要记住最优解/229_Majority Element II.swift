// 229_Majority Element II
// https://leetcode.com/problems/majority-element-ii/
//
// Created by Honghao Zhang on 10/23/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given an integer array of size n, find all elements that appear more than ⌊ n/3 ⌋ times.
//
//Note: The algorithm should run in linear time and in O(1) space.
//
//Example 1:
//
//Input: [3,2,3]
//Output: [3]
//Example 2:
//
//Input: [1,1,1,3,3,2,2,2]
//Output: [1,2]
//

// 在一堆数字总找出> count / 3的数字
// Voting algo

import Foundation

class Num229 {
  // MARK: - Voting system
  func majorityElement(_ nums: [Int]) -> [Int] {
    guard !nums.isEmpty else {
      return []
    }
    var count1 = 0
    var candidate1: Int = nums[0]
    var count2 = 0
    var candidate2: Int = nums[0]

    for n in nums {
      // order matters, must check candidate first
      if n == candidate1 {
        count1 += 1
      }
      else if n == candidate2 {
        count2 += 1
      }
      else if count1 == 0 {
        candidate1 = n
        count1 = 1
      }
      else if count2 == 0 {
        candidate2 = n
        count2 = 1
      }
      else {
        count1 -= 1
        count2 -= 1
      }
    }

    count1 = 0
    count2 = 0
    for n in nums {
      if n == candidate1 {
        count1 += 1
      }
      if n == candidate2 {
        count2 += 1
      }
    }

    var result = Set<Int>()
    if count1 > nums.count / 3 {
      result.insert(candidate1)
    }
    if count2 > nums.count / 3 {
      result.insert(candidate2)
    }
    return Array(result)
  }
}
