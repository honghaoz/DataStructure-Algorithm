// 34_Find First and Last Position of Element in Sorted Array
// https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/
//
// Created by Honghao Zhang on 9/16/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given an array of integers nums sorted in ascending order, find the starting and ending position of a given target value.
//
//Your algorithm's runtime complexity must be in the order of O(log n).
//
//If the target is not found in the array, return [-1, -1].
//
//Example 1:
//
//Input: nums = [5,7,7,8,8,10], target = 8
//Output: [3,4]
//Example 2:
//
//Input: nums = [5,7,7,8,8,10], target = 6
//Output: [-1,-1]
//

import Foundation

class Num34 {
  // Two pass of binary search
  func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    if nums.count == 0 {
      return [-1, -1]
    }
    if nums.count == 1 {
      if nums[0] == target {
        return [0, 0]
      } else {
        return [-1, -1]
      }
    }

    return [findIndex(nums, target, true), findIndex(nums, target, false)]
  }

  /// Helper function, to find either left most index or the right most index
  private func findIndex(_ nums: [Int], _ target: Int, _ isLeftMost: Bool) -> Int {
    if nums.count == 0 {
      return -1
    }
    if nums.count == 1 {
      if nums[0] == target {
        return 0
      } else {
        return -1
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
        if isLeftMost {
          end = mid
        }
        else {
          start = mid
        }
      }
    }

    if isLeftMost {
      if nums[start] == target {
        return start
      }
      else if nums[end] == target {
        return end
      }
      else {
        return -1
      }
    }
    else {
      if nums[end] == target {
        return end
      }
      else if nums[start] == target {
        return start
      }
      else {
        return -1
      }
    }
  }
}
