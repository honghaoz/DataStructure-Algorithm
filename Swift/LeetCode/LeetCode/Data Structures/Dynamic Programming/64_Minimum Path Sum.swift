// 64_Minimum Path Sum
// https://leetcode.com/problems/minimum-path-sum/
//
// Created by Honghao Zhang on 9/20/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right which minimizes the sum of all numbers along its path.
//
//Note: You can only move either down or right at any point in time.
//
//Example:
//
//Input:
//[
//  [1,3,1],
//  [1,5,1],
//  [4,2,1]
//]
//Output: 7
//Explanation: Because the path 1→3→1→1→1 minimizes the sum.
//

import Foundation

class Num64 {
  // 经典DP问题
  // 坐标型动态规划
  func minPathSum(_ grid: [[Int]]) -> Int {
    guard grid.count > 0 else {
      return 0
    }
    let m = grid.count
    guard grid[0].count > 0 else {
      return 0
    }
    let n = grid[0].count

    // state: s[i][j] represents the min path to (i, j)
    // initialize
    var s: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: m)
    s[0][0] = grid[0][0]
    // init row 0
    for j in 1..<n {
      s[0][j] = s[0][j - 1] + grid[0][j]
    }
    // init column 0
    for i in 1..<m {
      s[i][0] = s[i - 1][0] + grid[i][0]
    }

    // transition function
    for i in 1..<m {
      for j in 1..<n {
        s[i][j] = min(s[i - 1][j], s[i][j - 1]) + grid[i][j]
      }
    }

    return s[m - 1][n - 1]
  }
}
