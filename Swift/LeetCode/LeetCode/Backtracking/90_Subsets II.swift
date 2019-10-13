// 90_Subsets II
// https://leetcode.com/problems/subsets-ii/
//
// Created by Honghao Zhang on 10/4/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a collection of integers that might contain duplicates, nums, return all possible subsets (the power set).
//
//Note: The solution set must not contain duplicate subsets.
//
//Example:
//
//Input: [1,2,2]
//Output:
//[
//  [2],
//  [1],
//  [1,2,2],
//  [2,2],
//  [1,2],
//  []
//]
//

import Foundation

class Num90 {
  // MARK: - backtrack
  // 跟78的subsets的区别是：
  //   1) nums sorted
  //   2) 增加了一个visited dict来避免重复
  func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
    var results: [[Int]] = []
    subsets_backtrackHelper([], nums.sorted(), &results)
    return results
  }

  func subsets_backtrackHelper(_ path: [Int], _ numsToSelect: [Int], _ result: inout [[Int]]) {
    result.append(path)
    if numsToSelect.count == 0 {
      return
    }

    var visited: [Int] = []
    for i in 0..<numsToSelect.count {
      if visited.contains(numsToSelect[i]) {
        continue
      }
      visited.append(numsToSelect[i])
      subsets_backtrackHelper(path + [numsToSelect[i]], numsToSelect.exluded(before: i + 1), &result)
    }
  }
}

private extension Array where Element == Int {
  func exluded(before i: Int) -> [Int] {
    var result: [Int] = []
    for j in 0..<self.count {
      if j >= i {
        result.append(self[j])
      }
    }
    return result
  }
}
