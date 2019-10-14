// 463_Island Perimeter
// https://leetcode.com/problems/island-perimeter/
//
// Created by Honghao Zhang on 10/12/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// You are given a map in form of a two-dimensional integer grid where 1 represents land and 0 represents water.
//
//Grid cells are connected horizontally/vertically (not diagonally). The grid is completely surrounded by water, and there is exactly one island (i.e., one or more connected land cells).
//
//The island doesn't have "lakes" (water inside that isn't connected to the water around the island). One cell is a square with side length 1. The grid is rectangular, width and height don't exceed 100. Determine the perimeter of the island.
//
//
//
//Example:
//
//Input:
//[[0,1,0,0],
// [1,1,1,0],
// [0,1,0,0],
// [1,1,0,0]]
//
//Output: 16
//
//Explanation: The perimeter is the 16 yellow stripes in the image below:
//

// 算一个岛的周长，board中只有一个岛，而且没有空洞。

import Foundation

class Num463 {
  // MARK: - 遍历一边每个cell，如果这个cell是岛，加上岛的边界（out of board或者朝着水）
  // For each cell, if this is 1, add the number of edge that this edge is facing
  // 0 or facing out of the board
  func islandPerimeter(_ grid: [[Int]]) -> Int {
    guard grid.count > 0 else {
      return 0
    }
    guard grid[0].count > 0 else {
      return 0
    }

    var perimeter = 0
    for i in 0..<grid.count {
      for j in 0..<grid[0].count {
        if grid[i][j] == 1 {
          // check 4 directions, count the valid edges
          // up
          if i - 1 < 0 || grid[i - 1][j] == 0 {
            perimeter += 1
          }
          // left
          if j - 1 < 0 || grid[i][j - 1] == 0 {
            perimeter += 1
          }
          // bottom
          if i + 1 == grid.count || grid[i + 1][j] == 0 {
            perimeter += 1
          }
          // right
          if j + 1 == grid[0].count || grid[i][j + 1] == 0 {
            perimeter += 1
          }
        }
      }
    }
    return perimeter
  }
}
