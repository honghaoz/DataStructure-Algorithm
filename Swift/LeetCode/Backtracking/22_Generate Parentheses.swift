// 22_Generate Parentheses
// https://leetcode.com/problems/generate-parentheses/
//
// Created by Honghao Zhang on 10/6/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.
//
//For example, given n = 3, a solution set is:
//
//[
//  "((()))",
//  "(()())",
//  "(())()",
//  "()(())",
//  "()()()"
//]
//

// 给出需要有几对括号
// 求出所有可能的结果

import Foundation

class Num22 {
  // MARK: Backtracking
  func generateParenthesis(_ n: Int) -> [String] {
    var results: [String] = []
    generateParenthesis("", n, n, &results)
    return results
  }
  
  /// Generate parentheses string with left count and right count.
  /// - Parameter str: Current parentheses string
  /// - Parameter left: The number of "(" to add.
  /// - Parameter right: The number of ")" to add.
  /// - Parameter results: The results array.
  private func generateParenthesis(_ str: String, _ left: Int, _ right: Int, _ results: inout [String]) {
    // it's not possible to have more ")" to add
    // 只可能有更多的右括弧，不可能有更多的左括弧
    guard left <= right else {
      return
    }
    
    // if there's no more parentheses to add, we found a solution
    if left == 0, right == 0 {
      results.append(str)
      return
    }
    
    if left == right {
      // can only append left
      generateParenthesis(str + "(", left - 1, right, &results)
    }
    else if left < right {
      if left > 0 {
        // can append left
        generateParenthesis(str + "(", left - 1, right, &results)
      }
      // can append right
      generateParenthesis(str + ")", left, right - 1, &results)
    }
  }
}
