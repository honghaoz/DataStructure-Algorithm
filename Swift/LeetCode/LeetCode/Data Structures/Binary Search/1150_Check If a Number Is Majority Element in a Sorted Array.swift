// 1150_Check If a Number Is Majority Element in a Sorted Array
// https://leetcode.com/problems/check-if-a-number-is-majority-element-in-a-sorted-array/
//
// Created by Honghao Zhang on 9/16/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given an array nums sorted in non-decreasing order, and a number target, return True if and only if target is a majority element.
//
//A majority element is an element that appears more than N/2 times in an array of length N.
//
//
//
//Example 1:
//
//Input: nums = [2,4,5,5,5,5,5,6,6], target = 5
//Output: true
//Explanation:
//The value 5 appears 5 times and the length of the array is 9.
//Thus, 5 is a majority element because 5 > 9/2 is true.
//Example 2:
//
//Input: nums = [10,100,101,101], target = 101
//Output: false
//Explanation:
//The value 101 appears 2 times and the length of the array is 4.
//Thus, 101 is not a majority element because 2 > 4/2 is false.
//
//
//Note:
//
//1 <= nums.length <= 1000
//1 <= nums[i] <= 10^9
//1 <= target <= 10^9
//

import Foundation

class Num1150 {
  /// Use binary search to find the left and right index
  func isMajorityElement(_ nums: [Int], _ target: Int) -> Bool {
    let firstIndex = findFirstIndex(nums, target)
    let lastIndex = findLastIndex(nums, target)
    if firstIndex == -1 || lastIndex == -1 {
      return false
    }
    let count = lastIndex - firstIndex + 1
    return count > nums.count / 2
  }

  private func findFirstIndex(_ nums: [Int], _ target: Int) -> Int {
    if nums.count == 0 {
      return -1
    }
    if nums.count == 1 {
      if nums[0] == target {
        return 0
      }
      else {
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
        // to find the first index, move end
        end = mid
      }
    }
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

  private func findLastIndex(_ nums: [Int], _ target: Int) -> Int {
    if nums.count == 0 {
      return -1
    }
    if nums.count == 1 {
      if nums[0] == target {
        return 0
      }
      else {
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
        // to find the last index, move start
        start = mid
      }
    }
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
