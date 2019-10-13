// 70_Climbing Stairs
// https://leetcode.com/problems/climbing-stairs/
//
// Created by Honghao Zhang on 9/21/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// You are climbing a stair case. It takes n steps to reach to the top.
//
//Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
//
//Note: Given n will be a positive integer.
//
//Example 1:
//
//Input: 2
//Output: 2
//Explanation: There are two ways to climb to the top.
//1. 1 step + 1 step
//2. 2 steps
//Example 2:
//
//Input: 3
//Output: 3
//Explanation: There are three ways to climb to the top.
//1. 1 step + 1 step + 1 step
//2. 1 step + 2 steps
//3. 2 steps + 1 step
//

import Foundation

class Num70 {
  // DP solution
  func climbStairs(_ n: Int) -> Int {
    if n == 0 {
      return 0
    }
    if n == 1 {
      return 1
    }
    if n == 2 {
      return 2
    }
    // s[i] represents how many ways to reach the i stairs
    // s[1] = 1
    // s[2] = 2
    var s: [Int] = [0, 1, 2]
    for i in 3...n {
      if i == s.count {
        s.append(0)
      }
      s[i] = s[i - 1] + s[i - 2]
    }
    return s[n]
  }
}
