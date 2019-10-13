// 35_Search Insert Position
// https://leetcode.com/problems/search-insert-position/
//
// Created by Honghao Zhang on 9/16/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a sorted array and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.
//
//You may assume no duplicates in the array.
//
//Example 1:
//
//Input: [1,3,5,6], 5
//Output: 2
//Example 2:
//
//Input: [1,3,5,6], 2
//Output: 1
//Example 3:
//
//Input: [1,3,5,6], 7
//Output: 4
//Example 4:
//
//Input: [1,3,5,6], 0
//Output: 0
//

import Foundation

class Num35 {
  /// Binary search, when while loop ends, check where to insert
  func searchInsert(_ nums: [Int], _ target: Int) -> Int {
      if nums.count == 0 {
        return 0
      }
    if nums.count == 1 {
      if nums[0] == target {
        return 0
      }
      else if nums[0] > target {
        return 0
      }
      else {
        return 1
      }
    }

    var start = 0
    var end = nums.count - 1
    while start + 1 < end {
      let mid = start + (end - start) / 2
      if nums[mid] < target {
        start = mid
      }
      else if nums[mid] > target {
        end = mid
      }
      else {
        return mid
      }
    }
    if target <= nums[start] {
      return start
    }
    else if nums[start] < target, target <= nums[end] {
      return end
    }
    else {
      return end + 1
    }
  }
}
