// 720_Longest Word in Dictionary
// https://leetcode.com/problems/longest-word-in-dictionary/
//
// Created by Honghao Zhang on 10/9/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a list of strings words representing an English Dictionary, find the longest word in words that can be built one character at a time by other words in words. If there is more than one possible answer, return the longest word with the smallest lexicographical order.
//
//If there is no answer, return the empty string.
//Example 1:
//
//Input:
//words = ["w","wo","wor","worl", "world"]
//Output: "world"
//Explanation:
//The word "world" can be built one character at a time by "w", "wo", "wor", and "worl".
//Example 2:
//
//Input:
//words = ["a", "banana", "app", "appl", "ap", "apply", "apple"]
//Output: "apple"
//Explanation:
//Both "apply" and "apple" can be built from other words in the dictionary. However, "apple" is lexicographically smaller than "apply".
//Note:
//
//All the strings in the input will only contain lowercase letters.
//The length of words will be in the range [1, 1000].
//The length of words[i] will be in the range [1, 30].
//

// 给出一些word，找出最长的那个word，并且这个word的每一个从0开始的substring都在这个word list中

import Foundation

class Num720 {
  // MARK: Tries + DFS
  // 最优解

  // MARK: - Straightforward way
  func longestWord(_ words: [String]) -> String {
    var dict = Set<String>()
    for w in words {
      dict.insert(w)
    }

    var result: String = ""
    for w in words {
      if isBuiltable(w, dict) {
        if w.count > result.count  {
          result = w
        }
        else if w.count == result.count, w < result {
          result = w
        }
      }
    }

    return result
  }

  private func isBuiltable(_ word: String, _ dictionary: Set<String>) -> Bool {
    if word.count == 0 {
      return true
    }
    if word.count == 1 {
      return dictionary.contains(word)
    }
    let word = Array(word)
    // length 2
    // word
    // 0123
    //  ij
    for length in 1...(word.count - 1) {
      let i = 0
      let j = i + length - 1
      let substring = String(word[i...j])
      if !dictionary.contains(substring) {
        return false
      }
    }

    return true
  }
}
