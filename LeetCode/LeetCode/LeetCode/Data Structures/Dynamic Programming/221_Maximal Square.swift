// 221_Maximal Square
// https://leetcode.com/problems/maximal-square/
//
// Created by Honghao Zhang on 9/20/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a 2D binary matrix filled with 0's and 1's, find the largest square containing only 1's and return its area.
//
//Example:
//
//Input:
//
//1 0 1 0 0
//1 0 1 1 1
//1 1 1 1 1
//1 0 0 1 0
//
//Output: 4
//

import Foundation

class Num221 {
  // https://leetcode.com/problems/maximal-square/solution/

  // DP standard with 4 steps
  func maximalSquare(_ matrix: [[Character]]) -> Int {
    // get matrix size
    let m = matrix.count
    guard m > 0 else { return 0 }
    let n = matrix[0].count
    guard n > 0 else { return 0 }

    // 1) state: s[i][j] is the size of the largest square ends at [i][j]
    // aka. [i][j] is the bottom right corner.
    var s = Array(repeating: Array(repeating: 0, count: n), count: m)

    // 2) initialize, edges are determined
    for i in 0..<m {
      for j in 0..<n {
        if i == 0 || j == 0 {
          s[i][j] = (matrix[i][j] == "0") ? 0 : 1
        }
      }
    }

    // 3) function: s[i][j] = min(s[i - 1][j - 1], s[i][j - 1], s[i - 1][j]) + 1
    for i in 0..<m {
      for j in 0..<n {
        // skip edges
        if i == 0 || j == 0 {
          continue
        }

        if matrix[i][j] == "1" {
          s[i][j] = min(s[i - 1][j - 1], s[i][j - 1], s[i - 1][j]) + 1
        }
      }
    }
     print(1, terminator: "")

    // at this moment, s contains the largest size for any i and j

    // 4) answer
    var maxSize = 0
    for i in 0..<m {
      for j in 0..<n {
        maxSize = max(maxSize, s[i][j])
      }
    }
    return maxSize * maxSize
  }

  // DP optimized
  func maximalSquare2(_ matrix: [[Character]]) -> Int {
    // get matrix size
    let m = matrix.count
    guard m > 0 else { return 0 }
    let n = matrix[0].count
    guard n > 0 else { return 0 }

    // state: s[i][j] is the size of the largest square ends at [i][j]
    // aka. [i][j] is the bottom right corner.
    var s = Array(repeating: Array(repeating: 0, count: n), count: m)

    // answer
    var maxSize = 0

    for i in 0..<m {
      for j in 0..<n {
        // initialize: For edge
        if i == 0 || j == 0 {
          s[i][j] = (matrix[i][j] == "0") ? 0 : 1
          maxSize = max(maxSize, s[i][j])
          continue
        }

        if matrix[i][j] == "0" {
          continue
        }
        else {
          // function:
          s[i][j] = min(s[i - 1][j - 1], s[i][j - 1], s[i - 1][j]) + 1
          maxSize = max(maxSize, s[i][j])
        }
      }
    }

    return maxSize * maxSize
  }
}
