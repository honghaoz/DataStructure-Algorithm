// 5_Longest Palindromic Substring
// https://leetcode.com/problems/longest-palindromic-substring/
//
// Created by Honghao Zhang on 10/8/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.
//
//Example 1:
//
//Input: "babad"
//Output: "bab"
//Note: "aba" is also a valid answer.
//Example 2:
//
//Input: "cbbd"
//Output: "bb"
//

// 找一个字符串中最长的palindrome substring

import Foundation

class Num5 {
  // MARK: 2维DP 
  func longestPalindrome(_ s: String) -> String {
    return longestPalindromeHelper(Array(s))
  }
  
  private func longestPalindromeHelper(_ s: [Character]) -> String {
    //  01234
    // "babad"
    //
    if s.count == 0 {
      return ""
    }
    if s.count == 1 {
      return String(s)
    }
    
    // state: f[i][j] indicates if s[i...j] is a palindorme string
    var f: [[Bool]] = Array(repeating: Array(repeating: false, count: s.count), count: s.count)
    
    // initialize
    for i in 0..<s.count {
      f[i][i] = true
    }
    
    // function
    for length in 2...s.count {
      for i in 0...(s.count - length) {
        let j = i + length - 1
        // if length == 2
        // 0 1 -> 1 0
        // if length == 3
        // 0 2 -> 1 1
        // if length == 4
        // 0 3 -> 1 2
        if length == 2 {
          f[i][j] = s[i] == s[j]
        }
        else {
          f[i][j] = (s[i] == s[j] && f[i + 1][j - 1])
        }
        
      }
    }
    
    // answer
    var longest: (Int, Int) = (0, 0)
    for i in 0..<s.count {
      for j in i..<s.count {
        if f[i][j] {
          if (j - i) > (longest.1 - longest.0) {
            longest = (i, j)
          }
        }
      }
    }
    return String(s[longest.0...longest.1])
  }
}
