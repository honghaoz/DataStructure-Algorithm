// 118_Pascal's Triangle
// https://leetcode.com/problems/pascals-triangle/
//
// Created by Honghao Zhang on 10/16/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a non-negative integer numRows, generate the first numRows of Pascal's triangle.
//
//
//In Pascal's triangle, each number is the sum of the two numbers directly above it.
//
//Example:
//
//Input: 5
//Output:
//[
//     [1],
//    [1,1],
//   [1,2,1],
//  [1,3,3,1],
// [1,4,6,4,1]
//]
//

// 构建一个Pascal Triangle

import Foundation

class Num118 {
  // MARK: - 从上到下推导
  func generate(_ numRows: Int) -> [[Int]] {
    if numRows == 0 {
      return []
    }

    var triangle: [[Int]] = [[1]]
    for i in 1..<numRows { // i = 0 -> row1
      let lastRow = triangle[i - 1]
      var row = Array(repeating: 0, count: i + 1)
      for j in 0..<(i + 1) {
        row[j] = ((j - 1) < 0 ? 0 : lastRow[j - 1]) + (j >= lastRow.count ? 0 : lastRow[j])
      }
      triangle.append(row)
    }
    return triangle
  }
}
