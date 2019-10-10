// 5_Longest Palindromic Substring
// https://leetcode.com/problems/longest-palindromic-substring/
//
// Created by HongHao Zhang on 10/8/19.
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

// 求一个字符串中最长的回文字符串

import Foundation

class Num5 {
  // TODO:
  // O(n^2)
  // 1) 以每个字符作为中心向两边扩散，求出最长的回文字符串
  // 2) DP，用s[i][j]来表示s[i...j]是一个会问字符串，那么s[i][j] = str[i] == str[j] && s[i+1][j-1]
  func longestPalindrome(_ s: String) -> String {
    return ""
  }
}
