// 198_House Robber
// https://leetcode.com/problems/house-robber/
//
// Created by Honghao Zhang on 9/21/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed, the only constraint stopping you from robbing each of them is that adjacent houses have security system connected and it will automatically contact the police if two adjacent houses were broken into on the same night.
//
//Given a list of non-negative integers representing the amount of money of each house, determine the maximum amount of money you can rob tonight without alerting the police.
//
//Example 1:
//
//Input: [1,2,3,1]
//Output: 4
//Explanation: Rob house 1 (money = 1) and then rob house 3 (money = 3).
//             Total amount you can rob = 1 + 3 = 4.
//Example 2:
//
//Input: [2,7,9,3,1]
//Output: 12
//Explanation: Rob house 1 (money = 2), rob house 3 (money = 9) and rob house 5 (money = 1).
//             Total amount you can rob = 2 + 9 + 1 = 12.
//

import Foundation

class Num198 {
  // DP, s[i] is the max number you can rob for the houses ends at i
  func rob(_ nums: [Int]) -> Int {
    if nums.count == 0 {
      return 0
    }
    if nums.count == 1 {
      return nums[0]
    }
    if nums.count == 2 {
      return max(nums[0], nums[1])
    }

    // state: s[i] is the max number can get ends at i
    // initialize
    var s: [Int] = Array(repeating: 0, count: nums.count)
    s[0] = nums[0]
    s[1] = max(nums[0], nums[1])

    // function
    for i in 2..<nums.count {
      // s[i] is the max from:
      //   1) stopped on s[i - 1]
      //   2) stopped on s[i - 2]
      s[i] = max(s[i - 1], s[i - 2] + nums[i])
    }

    return s[nums.count - 1]
  }
}
