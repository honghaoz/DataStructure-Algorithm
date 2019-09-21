// 53_Maximum Subarray
// https://leetcode.com/problems/maximum-subarray/
//
// Created by Honghao Zhang on 9/5/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.
//
//Example:
//
//Input: [-2,1,-3,4,-1,2,1,-5,4],
//Output: 6
//Explanation: [4,-1,2,1] has the largest sum = 6.
//Follow up:
//
//If you have figured out the O(n) solution, try coding another solution using the divide and conquer approach, which is more subtle.
//

import Foundation

class Num53 {
  /// Divide and conquer
  func maxSubArray(_ nums: [Int]) -> Int {
    return maxSubArrayHelper(nums, 0, nums.count) // needs to compute in place.
  }
  
  private func maxSubArrayHelper(_ nums: [Int], _ left: Int, _ right: Int) -> Int {
    guard left < right else { return 0 }
    if left + 1 == right {
          return nums[left]
        }

    let mid = (left + right) / 2
    let maxLeft = maxSubArrayHelper(nums, left, mid)
    let maxRight = maxSubArrayHelper(nums, mid, right)
    let maxMid = maxSubArrayMid(nums, left, right, mid)
    return max(maxLeft, maxRight, maxMid)
  }

  private func maxSubArrayMid(_ nums: [Int], _ left: Int, _ right: Int, _ mid: Int) -> Int {
    guard left < right else {
      return 0
    }

    var maxLeft: Int! = nil
    var sum = 0
    for i in (left..<mid).reversed() { // compute from mid -> left
      sum += nums[i]
      if maxLeft == nil {
        maxLeft = sum
      } else {
        maxLeft = max(maxLeft, sum)
      }
    }
    var maxRight: Int! = nil
    sum = 0
    for i in mid..<right { // compute from mid -> right
      sum += nums[i]
      if maxRight == nil {
        maxRight = sum
      } else {
        maxRight = max(maxRight, sum)
      }
    }
    return maxLeft + maxRight
  }

  // https://leetcode.com/problems/maximum-subarray/solution/
  // TODO: Greedy
  // TODO: DP
}
