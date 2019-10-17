// 119_Pascal's Triangle II
// https://leetcode.com/problems/pascals-triangle-ii/
//
// Created by Honghao Zhang on 10/16/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a non-negative index k where k ≤ 33, return the kth index row of the Pascal's triangle.
//
//Note that the row index starts from 0.
//
//
//In Pascal's triangle, each number is the sum of the two numbers directly above it.
//
//Example:
//
//Input: 3
//Output: [1,3,3,1]
//Follow up:
//
//Could you optimize your algorithm to use only O(k) extra space?
//

// 返回第N行的数字

import Foundation

class Num119 {
  // O(n) space
  // Can just keep one row and update it many times
  func getRow(_ rowIndex: Int) -> [Int] {
    var triangle: [[Int]] = [[1]]
    if rowIndex == 0 {
      return triangle[0]
    }
    for i in 1...rowIndex { // i = 0 -> row1
      let lastRow = triangle[i - 1]
      var row = Array(repeating: 0, count: i + 1)
      for j in 0..<(i + 1) {
        row[j] = ((j - 1) < 0 ? 0 : lastRow[j - 1]) + (j >= lastRow.count ? 0 : lastRow[j])
      }
      triangle.append(row)
    }
    return triangle[rowIndex]
  }
}
