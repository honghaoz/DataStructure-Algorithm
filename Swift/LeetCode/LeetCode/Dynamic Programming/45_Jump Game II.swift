// 45_Jump Game II
// https://leetcode.com/problems/jump-game-ii/
//
// Created by Honghao Zhang on 9/21/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given an array of non-negative integers, you are initially positioned at the first index of the array.
//
//Each element in the array represents your maximum jump length at that position.
//
//Your goal is to reach the last index in the minimum number of jumps.
//
//Example:
//
//Input: [2,3,1,1,4]
//Output: 2
//Explanation: The minimum number of jumps to reach the last index is 2.
//    Jump 1 step from index 0 to 1, then 3 steps to the last index.
//Note:
//
//You can assume that you can always reach the last index.
//

import Foundation

class Num45 {
  // Standard DP. However, time limit exceeded
  func jump_dp(_ nums: [Int]) -> Int {
    if nums.count == 0 {
      return -1
    }
    if nums.count == 1 {
      return 0
    }
    
    // s[i] means the min jumps to index i
    var s: [Int] = Array(repeating: Int.max, count: nums.count)
    s[0] = 0
    
    // s[i] = min(s[j] + 1), j < i && j can reach i
    for i in 1..<nums.count {
      for j in 0..<i {
        // s[j] != Int.max: j can be reached from 0
        // j + nums[j] >= i: j can reach i
        if s[j] != Int.max, j + nums[j] >= i {
          s[i] = min(s[i], s[j] + 1)
        }
      }
    }
    return s[nums.count - 1]
  }
  
  // DP with greedy
  func jump_dp_with_greedy(_ nums: [Int]) -> Int {
    if nums.count == 0 {
      return -1
    }
    if nums.count == 1 {
      return 0
    }
    
    // s[i] means the min jumps to index i
    var s: [Int] = Array(repeating: Int.max, count: nums.count)
    s[0] = 0
    
    // s[i] = min(s[j] + 1), j < i && j can reach i
    for i in 1..<nums.count {
      for j in 0..<i {
        // s[j] != Int.max: j can be reached from 0
        // j + nums[j] >= i: j can reach i
        if s[j] != Int.max, j + nums[j] >= i {
          s[i] = s[j] + 1 // greedy. why???
          break // greedy
        }
      }
    }
    return s[nums.count - 1]
  }
  
  // Greedy
  func jump_greedy(_ nums: [Int]) -> Int {
    // greedy
    // start from 0
    // find the furthest index can be reached
    // then check the indices between 0 to the furthest index
    // (also need to record the jumps
    // if there's a new furthest index, update it
    // if found the furthest index >= nums.count - 1, stop
    
    if nums.count == 0 {
      return -1
    }
    if nums.count == 1{
      return 0
    }
    
    // loop invariant:
    // for jumps count, the end is the furthest index can reach.
    var i = 0
    var jumps = 0
    var end = 0
    
    while i <= end {
      jumps += 1
      // nextEnd is the furthest index can reach when jumps + 1
      var nextEnd = end
      while i <= end {
        nextEnd = max(nextEnd, i + nums[i])
        i += 1
      }
      if nextEnd >= nums.count - 1 {
        return jumps
      }
      end = nextEnd
    }
    
    // should already returned
    assertionFailure()
    return jumps
  }
}
