// 62_Unique Paths
// https://leetcode.com/problems/unique-paths/
//
// Created by Honghao Zhang on 9/21/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).
//
//The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).
//
//How many possible unique paths are there?
//
//
//Above is a 7 x 3 grid. How many possible unique paths are there?
//
//Note: m and n will be at most 100.
//
//Example 1:
//
//Input: m = 3, n = 2
//Output: 3
//Explanation:
//From the top-left corner, there are a total of 3 ways to reach the bottom-right corner:
//1. Right -> Right -> Down
//2. Right -> Down -> Right
//3. Down -> Right -> Right
//Example 2:
//
//Input: m = 7, n = 3
//Output: 28
//

// 机器人从左上角出发，到右下角。求多少条不同的路径。

import Foundation

class Num62 {
  // 经典DP文件，参考64 Minimum Path Sum
  // 坐标型动态规划
  func uniquePaths(_ m: Int, _ n: Int) -> Int {
    guard m > 0 else {
      return 0
    }
    guard n > 0 else {
      return 0
    }

    // state: s[i][j] represents the number of unique path to (i, j)
    // initialize
    var s: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: m)
    s[0][0] = 1
    // init row 0
    for j in 1..<n {
      s[0][j] = 1
    }
    // init column 0
    for i in 1..<m {
      s[i][0] = 1
    }

    // transition function
    for i in 1..<m {
      for j in 1..<n {
        s[i][j] = s[i - 1][j] + s[i][j - 1]
      }
    }

    return s[m - 1][n - 1]
  }
}
