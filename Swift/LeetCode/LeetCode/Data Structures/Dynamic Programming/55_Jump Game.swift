// 55_Jump Game
// https://leetcode.com/problems/jump-game/
//
// Created by Honghao Zhang on 9/21/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given an array of non-negative integers, you are initially positioned at the first index of the array.
//
//Each element in the array represents your maximum jump length at that position.
//
//Determine if you are able to reach the last index.
//
//Example 1:
//
//Input: [2,3,1,1,4]
//Output: true
//Explanation: Jump 1 step from index 0 to 1, then 3 steps to the last index.
//Example 2:
//
//Input: [3,2,1,0,4]
//Output: false
//Explanation: You will always arrive at index 3 no matter what. Its maximum
//             jump length is 0, which makes it impossible to reach the last index.
//

import Foundation

class Num55 {
  // Check from right to left
  func canJump_bottom_up(_ nums: [Int]) -> Bool {
    if nums.count == 0 {
      return false
    }
    if nums.count == 1 {
      return true
    }

    // s[i] means i index can reach to the last index
    var s: [Bool] = Array(repeating: false, count: nums.count)
    s[nums.count - 1] = true

    for i in (0...(nums.count - 2)).reversed() {
      let furthestJump = min(i + nums[i], nums.count - 1)
      for j in i...furthestJump {
        // if any number in the range is a good number, then current i is also
        // a good number
        if s[j] == true {
          s[i] = true
          break
        }
      }
    }
    return s[0]
  }

  // Check from left to right
  func canJump_dp_top_down(_ nums: [Int]) -> Bool {
    // s[i] indicates if you can jump to s[i] from index 0
    var s: [Bool] = Array(repeating: false, count: nums.count)
    s[0] = true

    for i in 1..<nums.count {
      for j in (0...(i - 1)).reversed() {
        // for previous index, check if there's a way
        // that i can be reached
        if s[j] && j + nums[j] >= i {
          s[i] = true
          break
        }
      }
    }

    return s[nums.count - 1]
  }

  func canJump_greedy(_ nums: [Int]) -> Bool {
    if nums.count == 0 {
      return false
    }

    var furthest = nums[0]
    for i in 1..<nums.count {
      if i <= furthest, i + nums[i] > furthest {
        furthest = i + nums[i]
      }
    }

    return furthest >= nums.count - 1
  }
}
