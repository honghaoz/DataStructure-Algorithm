// 63_Unique Paths II
// https://leetcode.com/problems/unique-paths-ii/
//
// Created by Honghao Zhang on 10/15/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).
//
//The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).
//
//Now consider if some obstacles are added to the grids. How many unique paths would there be?
//
//
//
//An obstacle and empty space is marked as 1 and 0 respectively in the grid.
//
//Note: m and n will be at most 100.
//
//Example 1:
//
//Input:
//[
//  [0,0,0],
//  [0,1,0],
//  [0,0,0]
//]
//Output: 2
//Explanation:
//There is one obstacle in the middle of the 3x3 grid above.
//There are two ways to reach the bottom-right corner:
//1. Right -> Right -> Down -> Down
//2. Down -> Down -> Right -> Right
//

// 机器人从左上角出发，到右下角。求多少条不同的路径。但是中间有障碍点。

import Foundation

class Num63 {
  // MARK: - DP 坐标型
  // 需要考虑障碍物的情况
  func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
    let m = obstacleGrid.count
    guard m > 0 else {
      return 0
    }
    let n = obstacleGrid[0].count
    guard n > 0 else {
      return 0
    }
    // the top left corner must be not an obstacle
    if obstacleGrid[0][0] == 1 {
      return 0
    }

    // state s[i][j] indicates how many paths reaches s[i][j]
    var s: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: m)

    // initialize
    s[0][0] = 1

    // for the first column
    for i in 1..<m {
      if obstacleGrid[i][0] == 1 {
        s[i][0] = 0
      }
      else {
        s[i][0] = s[i - 1][0]
      }
    }
    // for the first row
    for j in 1..<n {
      if obstacleGrid[0][j] == 1 {
        s[0][j] = 0
      }
      else {
        s[0][j] = s[0][j - 1]
      }
    }

    // transition
    for i in 1..<m {
      for j in 1..<n {
        if obstacleGrid[i][j] == 1 {
          s[i][j] = 0
        }
        else {
          s[i][j] = s[i - 1][j] + s[i][j - 1]
        }
      }
    }

    return s[m - 1][n - 1]
  }
}
