// 115_Distinct Subsequences
// https://leetcode.com/problems/distinct-subsequences/
//
// Created by Honghao Zhang on 10/2/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a string S and a string T, count the number of distinct subsequences of S which equals T.
//
//A subsequence of a string is a new string which is formed from the original string by deleting some (can be none) of the characters without disturbing the relative positions of the remaining characters. (ie, "ACE" is a subsequence of "ABCDE" while "AEC" is not).
//
//Example 1:
//
//Input: S = "rabbbit", T = "rabbit"
//Output: 3
//Explanation:
//
//As shown below, there are 3 ways you can generate "rabbit" from S.
//(The caret symbol ^ means the chosen letters)
//
//rabbbit
//^^^^ ^^
//rabbbit
//^^ ^^^^
//rabbbit
//^^^ ^^^
//Example 2:
//
//Input: S = "babgbag", T = "bag"
//Output: 5
//Explanation:
//
//As shown below, there are 5 ways you can generate "bag" from S.
//(The caret symbol ^ means the chosen letters)
//
//babgbag
//^^ ^
//babgbag
//^^    ^
//babgbag
//^    ^^
//babgbag
//  ^  ^^
//babgbag
//    ^^^
//

import Foundation

class Num115 {
  // DP, 有点不好理解
  // https://leetcode.com/problems/distinct-subsequences/discuss/37327/Easy-to-understand-DP-in-Java
  // 双序列题目，不理解 TODO: revisit this later.
  func numDistinct(_ word1: String, _ word2: String) -> Int {
    guard word1.count > 0 else {
      return 0
    }
    guard word2.count > 0 else {
      return 1
    }

    let word1 = Array(word1)
    let word2 = Array(word2)

    // s[i][j] represents the number of distinct subsequence for s[0..<i] and t[0..<j]
    var s: [[Int]] = Array(repeating: Array(repeating: 0, count: word2.count + 1), count: word1.count + 1)
    // non-empty to empty
    for i in 0...word1.count {
      s[i][0] = 1 // the "" is the only one unique subsequence
    }

    for i in 1...word1.count {
      for j in 1...word2.count {
        // if last two char equals
        if word1[i - 1] == word2[j - 1] {
          // case1: assume it doesn't match
          // case2: assume it matches
          s[i][j] = s[i - 1][j] + s[i - 1][j - 1]
        }
        else {
          // if not equal, word1有没有最后一个char没有关系
          s[i][j] = s[i - 1][j]
        }
      }
    }

    return s[word1.count][word2.count]
  }

  // MARK: Recursion Time Limit Exceeded
  func numDistinct_recursive(_ s: String, _ t: String) -> Int {
    return numDistinctHelper(Array(s), Array(t))
  }

  private func numDistinctHelper(_ s: [Character], _ t: [Character]) -> Int {
    if s.isEmpty {
      return 0
    }
    if t.isEmpty {
      return 1 // remove all chars in s
    }
    if s[0] == t[0] {
      return numDistinctHelper([Character](s[1...]), [Character](t[1...])) // if first char matched
        + numDistinctHelper([Character](s[1...]), t) // if first char is not matched
    }
    else {
      return numDistinctHelper([Character](s[1...]), t)
    }
  }

  // MARK: Recursion + Memoization
  // Still have one test case doesn't pass.
  struct Input: Equatable, Hashable {
    let s: [Character]
    let t: [Character]

//    static func ==(lhs: Input, rhs: Input) -> Bool {
//      return lhs.s == rhs.s && lhs.t == rhs.t
//    }

//    func hash(into hasher: inout Hasher) {
//      hasher.combine(self.s)
//      hasher.combine(self.t)
//    }
  }

  var cache: [Input: Int] = [:]

  func numDistinct_recursive_mem(_ s: String, _ t: String) -> Int {
    let input = Input(s: Array(s), t: Array(t))
    return numDistinctHelper(input)
  }

  private func numDistinctHelper(_ input: Input) -> Int {
    let s = input.s
    let t = input.t
    // Should check t is empty first then check s
    if t.isEmpty {
      return 1 // remove all chars in s
    }
    if s.isEmpty {
      return 0
    }

    if let result = cache[input] {
      return result
    }

    if s.firstIndex(of: t[0]) == nil {
      print("s")
      return 0
    }

    let unmatchedInput = Input(s: [Character](s[1...]), t: t)
    if s[0] == t[0] {
      let matchedInput = Input(s: [Character](s[1...]), t: [Character](t[1...]))
      let result = numDistinctHelper(matchedInput) // if first char matched
        + numDistinctHelper(unmatchedInput) // if first char is not matched
      cache[input] = result
      return result
    }
    else {
      let result = numDistinctHelper(unmatchedInput)
      cache[input] = result
      return result
    }
  }
}
