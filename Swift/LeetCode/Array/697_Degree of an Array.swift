// 697_Degree of an Array
// https://leetcode.com/problems/degree-of-an-array/
//
// Created by Honghao Zhang on 10/27/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a non-empty array of non-negative integers nums, the degree of this array is defined as the maximum frequency of any one of its elements.
//
//Your task is to find the smallest possible length of a (contiguous) subarray of nums, that has the same degree as nums.
//
//Example 1:
//
//Input: [1, 2, 2, 3, 1]
//Output: 2
//Explanation:
//The input array has a degree of 2 because both elements 1 and 2 appear twice.
//Of the subarrays that have the same degree:
//[1, 2, 2, 3, 1], [1, 2, 2, 3], [2, 2, 3, 1], [1, 2, 2], [2, 2, 3], [2, 2]
//The shortest length is 2. So return 2.
//Example 2:
//
//Input: [1,2,2,3,1,4,2]
//Output: 6
//Note:
//
//nums.length will be between 1 and 50,000.
//nums[i] will be an integer between 0 and 49,999.
//

// Degree是一个数组中最频繁出现的数字的次数
// 找出subarray中保持同样的degree的最短的那个
// （其实就是找出包含degree number的这个subarray）

import Foundation

class Num697 {
  // MARK: - Straightforward
  func findShortestSubArray(_ nums: [Int]) -> Int {
    guard nums.count > 0 else {
      return 0
    }

    // 找出符合degree的num
    // 找出这几个num中最小和最大的index
    // 求出最小length
    var leftIndex: [Int: Int] = [:] // the left most index for a number
    var rightIndex: [Int: Int] = [:] // the right most index for a number
    var numCount: [Int: Int] = [:] // the count for a number
    for (i, num) in nums.enumerated() {
      if leftIndex[num] == nil {
        leftIndex[num] = i
      }
      rightIndex[num] = i

      numCount[num] = numCount[num, default: 0] + 1
    }

    var answer = nums.count
    let degree = numCount.values.max()!
    for num in nums {
      // check the length for the degree numbers
      if numCount[num] == degree {
        answer = min(answer, rightIndex[num]! - leftIndex[num]! + 1)
      }
    }

    return answer
  }
}
