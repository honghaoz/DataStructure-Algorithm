// 120_Triangle
// https://leetcode.com/problems/triangle/
//
// Created by Honghao Zhang on 9/20/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// 在一个三角形的塔中，找从顶到底走的路径中最短路径的数字。
//
// Given a triangle, find the minimum path sum from top to bottom. Each step you may move to adjacent numbers on the row below.
//
//For example, given the following triangle
//
//[
//     [2],
//    [3,4],
//   [6,5,7],
//  [4,1,8,3]
//]
//The minimum path sum from top to bottom is 11 (i.e., 2 + 3 + 5 + 1 = 11).
//
//Note:
//
//Bonus point if you are able to do this using only O(n) extra space, where n is the total number of rows in the triangle.
//

import Foundation

class Num120 {
  // 坐标型动态规划
  // 1) DP: bottom up with standard 4 steps
  func minimumTotal_DP_bottom_up(_ triangle: [[Int]]) -> Int {
    guard triangle.count > 0 else {
      return 0
    }
    let d = triangle.count
    guard triangle[0].count > 0 else {
      return 0
    }

    // state
    // s[i][j] represents the min total start from (i, j) to the bottom
    var s = [[Int]]()

    // initialize
    for i in 0..<d {
      s.append(Array(repeating: 0, count: i + 1))
    }
    for i in 0..<d {
      for j in 0..<i + 1 {
        if i == d - 1 {
          s[i][j] = triangle[i][j]
        } else {
          s[i][j] = 0
        }
      }
    }

    // transition function
    for i in (0...(d - 1)).reversed() { // bottom up
      if i == d - 1 {
        continue // skips last row
      }
      for j in 0...i {
        s[i][j] = min(s[i + 1][j], s[i + 1][j + 1]) + triangle[i][j]
      }
    }

    // answer
    return s[0][0]
  }

  // 2) DP: top down
  func minimumTotal_DP_top_down(_ triangle: [[Int]]) -> Int {
    guard triangle.count > 0 else {
      return 0
    }
    let d = triangle.count
    guard triangle[0].count > 0 else {
      return 0
    }

    // state
    // s[i][j] represents the min total start from (0, 0) to (i, j)
    var s = [[Int]]()

    // initialize
    for i in 0..<d {
      s.append(Array(repeating: 0, count: i + 1))
    }
    s[0][0] = triangle[0][0]
    for i in 1..<d {
      // init edges
      s[i][0] = triangle[i][0] + s[i - 1][0]
      s[i][i] = triangle[i][i] + s[i - 1][i - 1]
    }

    // function
    for i in 1..<d {
      for j in 1..<i {
        s[i][j] = min(s[i - 1][j - 1], s[i - 1][j]) + triangle[i][j]
      }
    }

    // answer
    var minTotal = Int.max
    // find the min in the last row
    for j in 0..<d {
      minTotal = min(minTotal, s[d - 1][j])
    }
    return minTotal
  }

  // 3) Divide Conquer + Memorization
  // 用一个hashtable来存recursive call的结果，避免重复计算。
  struct Coordinate: Hashable {
    let row: Int
    let column: Int

    init(_ row: Int, _ column: Int) {
      self.row = row
      self.column = column
    }

    func hash(into hasher: inout Hasher) {
      hasher.combine(self.row)
      hasher.combine(self.column)
    }
  }

  func minimumTotal_divide_conquer(_ triangle: [[Int]]) -> Int {
    guard triangle.count > 0 else {
      return 0
    }
    guard triangle[0].count > 0 else {
      return 0
    }

    var cache = [Coordinate: Int]()
    return minimumTotalHelper(triangle, Coordinate(0, 0), &cache)
  }

  // 2
  // 3, 4
  // 6, 5, 7
  // 4, 1, 8, 3
  private func minimumTotalHelper(_ triangle: [[Int]], _ position: Coordinate, _ cache: inout [Coordinate: Int]) -> Int {
    // If it's the bottom line, just return the value
    if position.row == triangle.count - 1 {
      return triangle[position.row][position.column]
    }

    if let previousResult = cache[position] {
      return previousResult
    }

    let leftPosition = Coordinate(position.row + 1, position.column)
    let leftTotal = minimumTotalHelper(triangle, leftPosition, &cache)

    let rightPosition = Coordinate(position.row + 1, position.column + 1)
    let rightTotal = minimumTotalHelper(triangle, rightPosition, &cache)

    let total = min(leftTotal, rightTotal) + triangle[position.row][position.column]
    cache[position] = total
    return total
  }
}
