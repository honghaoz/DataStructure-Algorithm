// 39_Combination Sum
// https://leetcode.com/problems/combination-sum/
//
// Created by Honghao Zhang on 10/5/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a set of candidate numbers (candidates) (without duplicates) and a target number (target), find all unique combinations in candidates where the candidate numbers sums to target.
//
//The same repeated number may be chosen from candidates unlimited number of times.
//
//Note:
//
//All numbers (including target) will be positive integers.
//The solution set must not contain duplicate combinations.
//Example 1:
//
//Input: candidates = [2,3,6,7], target = 7,
//A solution set is:
//[
//  [7],
//  [2,2,3]
//]
//Example 2:
//
//Input: candidates = [2,3,5], target = 8,
//A solution set is:
//[
//  [2,2,2,2],
//  [2,3,3],
//  [3,5]
//]
//

// 给一些可以选择的数字和一个target，求出所有能sum == target的所有组合，每个数字可以重复选择

import Foundation

class Num39 {
  // MARK: - Backtrack Sorted
  // excludes the candidates less than (<) the chosen value。这样就不需要sorted了
  // 如果sorted的话，在exclude的时候会方便一些
  func combinationSum_sorted(_ candidates: [Int], _ target: Int) -> [[Int]] {
    var results: [[Int]] = []
    combinationSumHelper_sorted([], candidates.sorted(), target, &results)
    return results
  }

  private func combinationSumHelper_sorted(_ chosen: [Int], _ candidates: [Int], _ target: Int, _ results: inout [[Int]]) {
    // bad target, no possible solution
    if target < 0 {
      return
    }
    // found a solution, save it
    if target == 0 {
      results.append(chosen)
      return
    }

    // Since candidates are sorted
    // should remove candidates less than the new value to choose, this is to avoid duplicated solution
    // same value could be chosen unlimited times
    for i in 0..<candidates.count {
      if i > 0, candidates[i] == candidates[i - 1] {
        continue
      }
      let toChoose = candidates[i]
      combinationSumHelper_sorted(chosen + [toChoose], Array(candidates[i...]), target - toChoose, &results)
    }
  }

  // MARK: - Backtrack
  // excludes the candidates less than (<) the chosen value。这样就不需要sorted了
  // 如果sorted的话，在exclude的时候会方便一些
  func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    var results: [[Int]] = []
    combinationSumHelper([], candidates, target, &results)
    return results
  }
  
  private func combinationSumHelper(_ chosen: [Int], _ candidates: [Int], _ target: Int, _ results: inout [[Int]]) {
    if target < 0 {
      return
    }
    // found a solution, save it
    if target == 0 {
      results.append(chosen)
      return
    }

    // should remove candidates less than or equal the new value to choose, this is to avoid duplicated solution
    // same value could be chosen unlimited times
    //
    // Why includes equal? Because the same number can be used multiple times
    for i in 0..<candidates.count {
      let toChoose = candidates[i]
      combinationSumHelper(chosen + [toChoose], candidates.excluded(lessThan: toChoose), target - toChoose, &results)
    }
  }
}

private extension Array where Element == Int {
  func excluded(lessThan value: Int) -> [Int] {
    var result: [Int] = []
    for i in 0..<self.count {
      if self[i] >= value {
        result.append(self[i])
      }
    }
    return result
  }
}
