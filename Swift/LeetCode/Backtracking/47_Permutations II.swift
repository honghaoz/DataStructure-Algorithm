// 47_Permutations II
// https://leetcode.com/problems/permutations-ii/
//
// Created by Honghao Zhang on 10/4/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a collection of numbers that might contain duplicates, return all possible unique permutations.
//
//Example:
//
//Input: [1,1,2]
//Output:
//[
//  [1,1,2],
//  [1,2,1],
//  [2,1,1]
//]
//

// 给出一些可能重复的数字，求可能的排列
// 这种情况下需要skip相同的数字，用一个visited dict

import Foundation

class Num47 {

  // MARK: 好理解的backtrack，
  // 与46 Permutation唯一的不同是需要一个visited dict来检查这个路径是否已经走过了，来避免重复
  // 参考：https://leetcode.com/problems/permutations-ii/discuss/18648/Share-my-Java-code-with-detailed-explanantion
  func permuteUnique(_ nums: [Int]) -> [[Int]] {
    return permuteUniqueHelper([], nums)
  }

  /// Return permutations with current path and numbers available
  /// - Parameter path: the selected numbers
  /// - Parameter numsToSelect: the possible path
  private func permuteUniqueHelper(_ path: [Int], _ numsToSelect: [Int]) -> [[Int]] {
    if numsToSelect.count == 0 {
      return [path]
    }

    var result: [[Int]] = []
    var visited: [Int] = []
    for i in 0..<numsToSelect.count {
      if visited.contains(numsToSelect[i]) {
        continue
      }
      visited.append(numsToSelect[i])
      // for each number, choose and find the possible results
      result += permuteUniqueHelper(path + [numsToSelect[i]], numsToSelect.exluded(i: i))
    }
    return result
  }
}

private extension Array where Element == Int {
  func exluded(i: Int) -> [Int] {
    var result: [Int] = []
    for j in 0..<self.count {
      if j != i {
        result.append(self[j])
      }
    }
    return result
  }
}
