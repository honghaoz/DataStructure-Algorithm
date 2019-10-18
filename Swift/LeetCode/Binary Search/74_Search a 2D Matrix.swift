// 74_Search a 2D Matrix
// https://leetcode.com/problems/search-a-2d-matrix/
//
// Created by Honghao Zhang on 10/17/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Write an efficient algorithm that searches for a value in an m x n matrix. This matrix has the following properties:
//
//Integers in each row are sorted from left to right.
//The first integer of each row is greater than the last integer of the previous row.
//Example 1:
//
//Input:
//matrix = [
//  [1,   3,  5,  7],
//  [10, 11, 16, 20],
//  [23, 30, 34, 50]
//]
//target = 3
//Output: true
//Example 2:
//
//Input:
//matrix = [
//  [1,   3,  5,  7],
//  [10, 11, 16, 20],
//  [23, 30, 34, 50]
//]
//target = 13
//Output: false
//

// 在一个sorted matrix中找数字

import Foundation

class Num74 {
  // MARK: - Binary search
  // 只是需要做一个1d index 到 2d coordinate的转换
  func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    let m = matrix.count
    guard m > 0 else {
      return false
    }
    let n = matrix[0].count
    guard n > 0 else {
      return false
    }

    var start = 0
    var end = m * n - 1
    while start + 1 < end {
      let mid = start + (end - start) / 2
      let (x, y) = getCoordinate(mid, m, n)
      let midNum = matrix[x][y]
      if target < midNum {
        end = mid
      }
      else if target > midNum {
        start = mid
      }
      else {
        return true
      }
    }

    let (startX, startY) = getCoordinate(start, m, n)
    if matrix[startX][startY] == target {
      return true
    }
    let (endX, endY) = getCoordinate(end, m, n)
    if matrix[endX][endY] == target {
      return true
    }
    return false
  }

  // m rows
  // n columns
  private func getCoordinate(_ index: Int, _ m: Int, _ n: Int) -> (Int, Int) {
    let x = index / n
    let y = index % n
    return (x, y)
  }
}
