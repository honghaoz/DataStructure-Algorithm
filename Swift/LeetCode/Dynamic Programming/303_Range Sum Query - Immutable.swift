// 303_Range Sum Query - Immutable
// https://leetcode.com/problems/range-sum-query-immutable/
//
// Created by Honghao Zhang on 9/21/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given an integer array nums, find the sum of the elements between indices i and j (i ≤ j), inclusive.
//
//Example:
//
//Given nums = [-2, 0, 3, -5, 2, -1]
//
//sumRange(0, 2) -> 1
//sumRange(2, 5) -> -1
//sumRange(0, 5) -> -3
//Note:
//
//You may assume that the array does not change.
//There are many calls to sumRange function.
//

import Foundation

class Num303 {
  // Caching the sum until the index
  class NumArray {

    let nums: [Int]
    // returns the sum stops at index, inclusive
    // [1, 2, 3]
    // sumForIndex[0] == 1
    // sumForIndex[1] == 3
    // sumForIndex[2] == 6
    var sumForIndex: [Int: Int] = [:]
    
    init(_ nums: [Int]) {
      self.nums = nums
      var sum = 0
      for i in 0..<nums.count {
        sum += nums[i]
        sumForIndex[i] = sum
      }
    }

    func sumRange(_ i: Int, _ j: Int) -> Int {
      return sumForIndex[j]! - ((i - 1 < 0) ? 0 : sumForIndex[i - 1]!)
    }
  }

  /**
   * Your NumArray object will be instantiated and called as such:
   * let obj = NumArray(nums)
   * let ret_1: Int = obj.sumRange(i, j)
   */
}
