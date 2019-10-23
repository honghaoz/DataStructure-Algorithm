// 40_Combination Sum II
// https://leetcode.com/problems/combination-sum-ii/
//
// Created by Honghao Zhang on 10/6/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a collection of candidate numbers (candidates) and a target number (target), find all unique combinations in candidates where the candidate numbers sums to target.
//
//Each number in candidates may only be used once in the combination.
//
//Note:
//
//All numbers (including target) will be positive integers.
//The solution set must not contain duplicate combinations.
//Example 1:
//
//Input: candidates = [10,1,2,7,6,1,5], target = 8,
//A solution set is:
//[
//  [1, 7],
//  [1, 2, 5],
//  [2, 6],
//  [1, 1, 6]
//]
//Example 2:
//
//Input: candidates = [2,5,2,1,2], target = 5,
//A solution set is:
//[
//  [1,2,2],
//  [5]
//]
//

// 给一些一定量的数字和一个target，求出所有能sum == target的所有组合
// 数字可能会有重复，每个数字只能用一次

import Foundation

class Num40 {
  // MARK: - Backtrack
  // 上一个题是每个选过的element还可以再选
  // 这个题是选过的就不能再选了
  // Sorted, skip same value, only chose candidates after the index
  func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
    var results: [[Int]] = []
    combinationSum2Helper([], candidates.sorted(), target, &results)
    return results
  }

  private func combinationSum2Helper(_ chosen: [Int], _ candidates: [Int], _ target: Int, _ results: inout [[Int]]) {
    if target < 0 {
      return
    }
    // Must check target == 0 before checking the candidates
    // This makes sure any good results are recorded
    if target == 0 {
      results.append(chosen)
      return
    }
    if candidates.count == 0 {
      return
    }

    for i in 0..<candidates.count {
      // skips duplicates
      if i > 0, candidates[i] == candidates[i - 1] {
        continue
      }
      let toChoose = candidates[i]
      combinationSum2Helper(chosen + [toChoose], Array(candidates[(i + 1)...]), target - toChoose, &results)
    }
  }
}
