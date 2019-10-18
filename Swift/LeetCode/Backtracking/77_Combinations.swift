// 77_Combinations
// https://leetcode.com/problems/combinations/
//
// Created by Honghao Zhang on 10/6/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given two integers n and k, return all possible combinations of k numbers out of 1 ... n.
//
//Example:
//
//Input: n = 4, k = 2
//Output:
//[
//  [2,4],
//  [3,4],
//  [2,3],
//  [1,2],
//  [1,3],
//  [1,4],
//]
//

import Foundation

class Num77 {
  // Backtrack
  func combine(_ n: Int, _ k: Int) -> [[Int]] {
    guard n > 0 else {
      return []
    }
    var results: [[Int]] = []
    combineHelper([], 1, n, k, &results)
    return results
  }

  /// startNum + n -> the rest numbers available to choose
  private func combineHelper(_ chosen: [Int], _ startNum: Int, _ n: Int, _ k: Int, _ results: inout [[Int]]) {
    if chosen.count == k {
      results.append(chosen)
      return
    }
    if startNum > n {
      return
    }

    for i in startNum...n {
      // choose: var chosen.append(i)
      combineHelper(chosen + [i], i + 1, n, k, &results)
      // backtrack: var chosen.removeLast()
    }
  }
}
