// 85_Maximal Rectangle
// https://leetcode.com/problems/maximal-rectangle/
//
// Created by Honghao Zhang on 9/20/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a 2D binary matrix filled with 0's and 1's, find the largest rectangle containing only 1's and return its area.
//
//Example:
//
//Input:
//[
//  ["1","0","1","0","0"],
//  ["1","0","1","1","1"],
//  ["1","1","1","1","1"],
//  ["1","0","0","1","0"]
//]
//Output: 6
//

// 求一个matrix中最大的rectangle

import Foundation

class Num85 {
  // DP, build a state of the max width for each row ends at a index
  // Then for each element, check the size with each possible height
  func maximalRectangle(_ matrix: [[Character]]) -> Int {
    guard matrix.count > 0 else {
      return 0
    }
    let m = matrix.count // row count
    guard matrix[0].count > 0 else {
      return 0
    }
    let n = matrix[0].count // column count

    // state:
    // maxWidth[i][j] stores the max width ends at [i][j]
    var maxWidth: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: m)

    // answer
    var maxSize: Int = 0

    // initialize:
    // maxWidth
    for i in 0..<m {
      for j in 0..<n {
        if j == 0 {
          maxWidth[i][j] = (matrix[i][j] == "1") ? 1 : 0
        }
        else {
          if matrix[i][j] == "1" {
            maxWidth[i][j] = maxWidth[i][j - 1] + 1
          }
        }
      }
    }

    // function & answer
    for i in 0..<m {
      for j in 0..<n {
        if matrix[i][j] == "1" {
          // the width of the largest rectangle whose bottom right corner is (i, j)
          var width = maxWidth[i][j]

          // iterate the max width from current row to above to check the size for each possible height
          var k = i
          while k >= 0, maxWidth[k][j] > 0 {
            width = min(width, maxWidth[k][j])
            let height = i - k + 1

            maxSize = max(maxSize, width * height)

            k -= 1
          }
        }
      }
    }

    return maxSize
  }
}
