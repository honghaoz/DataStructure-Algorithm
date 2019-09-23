// 674_Longest Continuous Increasing Subsequence
// https://leetcode.com/problems/longest-continuous-increasing-subsequence/
//
// Created by Honghao Zhang on 9/22/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given an unsorted array of integers, find the length of longest continuous increasing subsequence (subarray).
//
//Example 1:
//
//Input: [1,3,5,4,7]
//Output: 3
//Explanation: The longest continuous increasing subsequence is [1,3,5], its length is 3.
//Even though [1,3,5,7] is also an increasing subsequence, it's not a continuous one where 5 and 7 are separated by 4.
//Example 2:
//
//Input: [2,2,2,2,2]
//Output: 1
//Explanation: The longest continuous increasing subsequence is [2], its length is 1.
//Note: Length of the array will not exceed 10,000.
//

import Foundation

class Num674 {
  // Sliding window
  func findLengthOfLCIS(_ nums: [Int]) -> Int {
    if nums.count == 0 {
      return 0
    }
    if nums.count == 1 {
      return 1
    }

    var maxLength = 1
    var start = 0
    var end = 1
    while end < nums.count {
      if nums[end] > nums[end - 1] {
        maxLength = max(maxLength, end - start + 1)
        end += 1
      }
      else {
        start = end
        end = start + 1
      }
    }
    return maxLength
  }
}
