// 140_Word Break II
// https://leetcode.com/problems/word-break-ii/
//
// Created by Honghao Zhang on 9/23/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a non-empty string s and a dictionary wordDict containing a list of non-empty words, add spaces in s to construct a sentence where each word is a valid dictionary word. Return all such possible sentences.
//
//Note:
//
//The same word in the dictionary may be reused multiple times in the segmentation.
//You may assume the dictionary does not contain duplicate words.
//Example 1:
//
//Input:
//s = "catsanddog"
//wordDict = ["cat", "cats", "and", "sand", "dog"]
//Output:
//[
//  "cats and dog",
//  "cat sand dog"
//]
//Example 2:
//
//Input:
//s = "pineapplepenapple"
//wordDict = ["apple", "pen", "applepen", "pine", "pineapple"]
//Output:
//[
//  "pine apple pen apple",
//  "pineapple pen apple",
//  "pine applepen apple"
//]
//Explanation: Note that you are allowed to reuse a dictionary word.
//Example 3:
//
//Input:
//s = "catsandog"
//wordDict = ["cats", "dog", "sand", "and", "cat"]
//Output:
//[]
//

import Foundation

class Num140: Solution {
  // DP:
  // a standard DP will just require one state, which here is the result dictionary
  // However, since computing substirng needs some time. If we just start to collect
  // the results but finally found there's no solution, this is a waste of time.
  //
  // To optimize the efficiency, we can use word break I to check if there's a solution
  // Or not firstly
  // Once we know there's a solution. We start to compute the results (the real job).
  func wordBreak(_ str: String, _ wordDict: [String]) -> [String] {
    // isBreakable[i], substring [0, i) is breakable
    var isBreakable: [Bool] = Array(repeating: false, count: str.count + 1)
    isBreakable[0] = true

    for i in 1..<isBreakable.count {
      for j in (0...(i - 1)).reversed() {
        // if found s[j] is true, which is breakable for [0, j)
        // and
        // substring from [j to i] is in the wordDict, then s[i] is true
        if isBreakable[j] == true, wordDict.contains(str[j..<i]) {
          isBreakable[i] = true
          break // We only care if i is breakable or not. found one solution is good
        }
      }
    }

    // We want to confirm we do have a solution. Otherwise, just return empty array.
    // This can avoid unnecessary string/substring computation ahead.
    guard isBreakable[str.count] == true else {
      return []
    }

    // result[i] stores the solutions for str[0..<i]
    var result: [Int: [String]] = [:]
    result[0] = [""]

    // s[i] is true for every j in 0..<i
    //   1) s[j] is true
    //   2) s[j..<i] is in the dict

    // 01234567
    // leetcode, "leet", "code"
    // tffftffft

    //  0123456789
    // "catsanddog"
    // result[0] = [""]
    // result[3] = ["cat"]
    // result[4] = ["cats"]
    // for index 7: result[7] is:
    //   [["cats and"]
    //    ["cat sand"]]
    for i in 1...str.count {
      // construct list of strings for i
      var stringsForI: [String] = []
      for j in 0..<i {
        let substring = str[j..<i]
        if isBreakable[j] == true, wordDict.contains(substring) {
          // found a solution
          let stringsForJ = result[j]!

          // collect the one string for i
          stringsForI += stringsForJ.map {
            if $0 == "" { // to avoid unnecessary space
              return substring
            } else {
              return $0 + " " + substring
            }
          }
        }
      }
      result[i] = stringsForI
    }
    return result[str.count] ?? []
  }

  func test() {
    print(wordBreak("catsanddog", ["cat","cats","and","sand","dog"]))
  }
}
