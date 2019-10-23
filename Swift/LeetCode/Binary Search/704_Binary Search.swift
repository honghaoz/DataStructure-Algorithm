// 704. Binary Search
// https://leetcode.com/problems/binary-search/
//
// Created by Honghao Zhang on 9/15/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a sorted (in ascending order) integer array nums of n elements and a target value, write a function to search target in nums. If target exists, then return its index, otherwise return -1.
//
//
//Example 1:
//
//Input: nums = [-1,0,3,5,9,12], target = 9
//Output: 4
//Explanation: 9 exists in nums and its index is 4
//
//Example 2:
//
//Input: nums = [-1,0,3,5,9,12], target = 2
//Output: -1
//Explanation: 2 does not exist in nums so return -1
//
//
//Note:
//
//You may assume that all elements in nums are unique.
//n will be in the range [1, 10000].
//The value of each element in nums will be in the range [-9999, 9999].
//

// 标准的二分法查找

import Foundation

class Num704 {
  // standard binary search
  func search(_ nums: [Int], _ target: Int) -> Int {
    guard nums.count > 0 else {
      return -1
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
}
