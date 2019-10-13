// 139_Word Break
// https://leetcode.com/problems/word-break/
//
// Created by Honghao Zhang on 9/22/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a non-empty string s and a dictionary wordDict containing a list of non-empty words, determine if s can be segmented into a space-separated sequence of one or more dictionary words.
//
//Note:
//
//The same word in the dictionary may be reused multiple times in the segmentation.
//You may assume the dictionary does not contain duplicate words.
//Example 1:
//
//Input: s = "leetcode", wordDict = ["leet", "code"]
//Output: true
//Explanation: Return true because "leetcode" can be segmented as "leet code".
//Example 2:
//
//Input: s = "applepenapple", wordDict = ["apple", "pen"]
//Output: true
//Explanation: Return true because "applepenapple" can be segmented as "apple pen apple".
//             Note that you are allowed to reuse a dictionary word.
//Example 3:
//
//Input: s = "catsandog", wordDict = ["cats", "dog", "sand", "and", "cat"]
//Output: false
//

import Foundation

class Num139 {

  /// DP, s[i] means the substring [0..<i] is breakable.
  /// Time complexity: O(n^3), getting the substring may slow
  func wordBreak(_ str: String, _ wordDict: [String]) -> Bool {
    guard str.count > 0 else {
      return true
    }
    // s[i] means string [0, i) is breakable
    var s: [Bool] = Array(repeating: false, count: str.count + 1)
    s[0] = true // empty string is breakable

    //  01234567  <-- index
    // "leetcode"
    //  tffftffft <-- s

    for i in 1..<s.count {
      for j in (0...(i - 1)).reversed() {
        // if found s[j] is true, which is breakable for [0, j)
        // and
        // substring from [j to i] is in the wordDict, then s[i] is true
        if s[j] == true, wordDict.contains(str[j..<i]) {
          s[i] = true
          break // We only care if i is breakable or not. found one solution is good
        }
      }
    }

    return s[str.count]
  }

  /// DP2, s[i] means the substring [0..<i] is breakable.
  /// Optimized with longest word length in the dictionary
  /// This can avoid unnecessary check if the string is very long
  /// Time complexity: O(N * L^2)
  ///    N: str.count
  ///    L: the longest word length.
  func wordBreak_dp2(_ str: String, _ wordDict: [String]) -> Bool {
    guard str.count > 0 else {
      return true
    }

    // find the longest word in the dictionary
    var maxLength = 0
    for w in wordDict {
      maxLength = max(w.count, maxLength)
    }

    // s[i] means string [0, i) is breakable
    var s: [Bool] = Array(repeating: false, count: str.count + 1)
    s[0] = true // empty string is breakable

    //  01234567  <-- index
    // "leetcode"
    //  tffftffft <-- s

    for i in 1..<s.count {
      var j = i - 1
      while j >= 0 && (i - j) <= maxLength { // (i - j) is the length of the word to check.
        // if found s[j] is true, which is breakable for [0, j)
        // and
        // substring from [j to i] is in the wordDict, then s[i] is true
        if s[j] == true, wordDict.contains(str[j..<i]) {
          s[i] = true
          break // We only care if i is breakable or not. found one solution is good
        }
        j -= 1
      }
    }

    return s[str.count]
  }

  /// Recursive with memoization
  var cache: [Int: Bool] = [:]

  func wordBreak_recursive(_ s: String, _ wordDict: [String]) -> Bool {
    return wordBreak_recursive_helper(s, wordDict, 0)
  }

  /// Returns true if s can be broken from start index
  func wordBreak_recursive_helper(_ s: String, _ wordDict: [String], _ start: Int) -> Bool {
    if start == s.count {
      return true
    }

    if let result = cache[start] {
      return result
    }

    for end in (start + 1)...s.count {
      if wordDict.contains(s[start..<end]), wordBreak_recursive_helper(s, wordDict, end) {
        cache[start] = true
        return true
      }
    }

    cache[start] = false
    return false
  }

  /// BFS, this is a iterative way for the recursive above.
  func wordBreak_iterative(_ str: String, _ wordDict: [String]) -> Bool {
    // stores the start index of each word (or break point)
    var queue: [Int] = [0]
    // a helper dict for memoization, to avoid duplicated search
    var visited: [Int: Bool] = [:]

    while !queue.isEmpty {
      let start = queue.removeFirst()
      if visited[start] == true {
        continue
      }

      for end in (start + 1)...str.count {
        let substring = str[start..<end]
        if end == str.count, wordDict.contains(substring) {
          return true
        }
        if wordDict.contains(substring) {
          queue.append(end)
        }
      }

      visited[start] = true
    }
    return false
  }
}
