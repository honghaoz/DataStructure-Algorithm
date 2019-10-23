// 561_Array Partition I
// https://leetcode.com/problems/array-partition-i/
//
// Created by Honghao Zhang on 10/19/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given an array of 2n integers, your task is to group these integers into n pairs of integer, say (a1, b1), (a2, b2), ..., (an, bn) which makes sum of min(ai, bi) for all i from 1 to n as large as possible.
//
//Example 1:
//
//Input: [1,4,3,2]
//
//Output: 4
//Explanation: n is 2, and the maximum sum of pairs is 4 = min(1, 2) + min(3, 4).
//Note:
//
//n is a positive integer, which is in the range of [1, 10000].
//All the integers in the array will be in the range of [-10000, 10000].
//

// 两两配对, 取每个pair的最小值，求这些最小值最大的和。

import Foundation

class Num561 {
  // 两两配对，取最小值，实际上就是把两个值放一起相抵消。
  // 最优的办法就是让两个值的距离最近，那么抵消的值就最小，那么和就最大
  func arrayPairSum(_ nums: [Int]) -> Int {
      let nums = nums.sorted()
      var sum = 0
      for i in stride(from: 0, through: nums.count - 1, by: 2) {
          sum += nums[i]
      }
      return sum
  }
}
