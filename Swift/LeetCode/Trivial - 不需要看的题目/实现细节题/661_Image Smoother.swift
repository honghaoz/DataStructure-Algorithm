// 661_Image Smoother
// https://leetcode.com/problems/image-smoother/
//
// Created by Honghao Zhang on 10/16/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a 2D integer matrix M representing the gray scale of an image, you need to design a smoother to make the gray scale of each cell becomes the average gray scale (rounding down) of all the 8 surrounding cells and itself. If a cell has less than 8 surrounding cells, then use as many as you can.
//
//Example 1:
//
//Input:
//[[1,1,1],
// [1,0,1],
// [1,1,1]]
//Output:
//[[0, 0, 0],
// [0, 0, 0],
// [0, 0, 0]]
//Explanation:
//For the point (0,0), (0,2), (2,0), (2,2): floor(3/4) = floor(0.75) = 0
//For the point (0,1), (1,0), (1,2), (2,1): floor(5/6) = floor(0.83333333) = 0
//For the point (1,1): floor(8/9) = floor(0.88888889) = 0
//Note:
//
//The value in the given matrix is in the range of [0, 255].
//The length and width of the given matrix are in the range of [1, 150].
//

// 取像素点周围的平均值

import Foundation

class Num661 {
  // MARK: - For loop
  func imageSmoother_ForLoop(_ M: [[Int]]) -> [[Int]] {
    let m = M.count
    guard m > 0 else {
      return []
    }
    let n = M[0].count
    guard n > 0 else {
      return []
    }

    var result: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: m)
    for i in 0..<m {
      for j in 0..<n {
        var sum = 0
        var count = 0
        for a in i - 1 ... i + 1 {
          for b in j - 1 ... j + 1 {
            if 0 <= a, a < m, 0 <= b, b < n {
              sum += M[a][b]
              count += 1
            }
          }
        }
        result[i][j] = sum / count
      }
    }
    return result
  }

  // MARK: - Hard coded
  func imageSmoother(_ M: [[Int]]) -> [[Int]] {
    let m = M.count
    guard m > 0 else {
      return []
    }
    let n = M[0].count
    guard n > 0 else {
      return []
    }

    var result: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: m)
    for i in 0..<m {
      for j in 0..<n {
        result[i][j] = (M.at(i - 1, j - 1) + M.at(i - 1, j) + M.at(i - 1, j + 1) +
          M.at(i, j - 1) + M.at(i, j) + M.at(i, j + 1) +
          M.at(i + 1, j - 1) + M.at(i + 1, j) + M.at(i + 1, j + 1)) / M.validCount(i, j)
      }
    }
    return result
  }
}

private extension Array where Element == [Int] {
  func at(_ i: Int, _ j: Int) -> Int {
    guard isValidIndex(i, j) else {
      return 0
    }
    return self[i][j]
  }

  func validCount(_ i: Int, _ j: Int) -> Int {
    var result = 0
    if isValidIndex(i - 1, j - 1) {
      result += 1
    }
    if isValidIndex(i - 1, j) {
      result += 1
    }
    if isValidIndex(i - 1, j + 1) {
      result += 1
    }
    if isValidIndex(i, j - 1) {
      result += 1
    }
    if isValidIndex(i, j) {
      result += 1
    }
    if isValidIndex(i, j + 1) {
      result += 1
    }
    if isValidIndex(i + 1, j - 1) {
      result += 1
    }
    if isValidIndex(i + 1, j) {
      result += 1
    }
    if isValidIndex(i + 1, j + 1) {
      result += 1
    }
    return result
  }

  func isValidIndex(_ i: Int, _ j: Int) -> Bool {
    if i < 0 {
      return false
    }
    if j < 0 {
      return false
    }
    if i >= self.count {
      return false
    }
    if j >= self[0].count {
      return false
    }
    return true
  }
}
