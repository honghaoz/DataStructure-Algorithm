// 1143_Longest Common Subsequence
// https://leetcode.com/problems/longest-common-subsequence/
//
// Created by Honghao Zhang on 10/1/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given two strings text1 and text2, return the length of their longest common subsequence.
//
//A subsequence of a string is a new string generated from the original string with some characters(can be none) deleted without changing the relative order of the remaining characters. (eg, "ace" is a subsequence of "abcde" while "aec" is not). A common subsequence of two strings is a subsequence that is common to both strings.
//
//
//
//If there is no common subsequence, return 0.
//
//
//
//Example 1:
//
//Input: text1 = "abcde", text2 = "ace"
//Output: 3
//Explanation: The longest common subsequence is "ace" and its length is 3.
//Example 2:
//
//Input: text1 = "abc", text2 = "abc"
//Output: 3  ngest common subsequence is "abc" and its length is 3.
//Example 3:
//
//Input: text1 = "abc", text2 = "def"
//Output: 0
//Explanation: There is no such common subsequence, so the result is 0.
//
//
//Constraints:
//
//1 <= text1.length <= 1000
//1 <= text2.length <= 1000
//The input strings consist of lowercase English characters only.
//

import Foundation

class Num1143 {
  // 双序列DP，用s[i][j]表示子问题的结果。
  // s[i][j] 表示text1前i个字符和text2前j个字符
  // 注意点：
  //   - s需要initialize大一点
  //   - compare最后两个字符的时候是用text1[i - 1]和text2[j - 1]
  func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
    guard text1.count > 0 else {
      return 0
    }
    guard text2.count > 0 else {
      return 0
    }
    
    // Make string to array, so you can easily access the individual char
    let text1 = Array(text1)
    let text2 = Array(text2)
    
    // state:
    // s[i][j] represents the longest common subsequence for text1[0...i] and text2[0...j]
    var s: [[Int]] = Array(repeating: Array(repeating: 0, count: text2.count + 1), count: text1.count + 1)
    // non-emtpy string to empty, delete all
    // for i in 0...text1.count {
    //   s[i][0] = 0
    // }
    // // from empty string to text
    // for j in 0...text2.count {
    //   s[0][j] = 0
    // }
    
    // function
    // s[i][j]
    for i in 1...text1.count {
      for j in 1...text2.count {
        if text1[i - 1] == text2[j - 1] {
          s[i][j] = s[i - 1][j - 1] + 1
        }
        else {
          s[i][j] = max(s[i - 1][j - 1], s[i][j - 1], s[i - 1][j])
        }
      }
    }
    
    return s[text1.count][text2.count]
  }
}
