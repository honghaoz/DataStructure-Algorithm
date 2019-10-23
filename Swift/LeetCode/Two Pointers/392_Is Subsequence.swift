// 392_Is Subsequence
// https://leetcode.com/problems/is-subsequence/
//
// Created by Honghao Zhang on 9/16/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a string s and a string t, check if s is subsequence of t.
//
//You may assume that there is only lower case English letters in both s and t. t is potentially a very long (length ~= 500,000) string, and s is a short string (<=100).
//
//A subsequence of a string is a new string which is formed from the original string by deleting some (can be none) of the characters without disturbing the relative positions of the remaining characters. (ie, "ace" is a subsequence of "abcde" while "aec" is not).
//
//Example 1:
//s = "abc", t = "ahbgdc"
//
//Return true.
//
//Example 2:
//s = "axc", t = "ahbgdc"
//
//Return false.
//
//Follow up:
//If there are lots of incoming S, say S1, S2, ... , Sk where k >= 1B, and you want to check one by one to see if T has its subsequence. In this scenario, how would you change your code?
//
//Credits:
//Special thanks to @pbrother for adding this problem and creating all test cases.
//

// 判断s是否是t的一个subsequence（不是subarray）

import Foundation

class Num392 {
  // MARK: - Two pointers
  // O(n)
  // 用两个index，如果相等，两个index都增长，如果不相等，增加t的index
  // 最后判断s的index是不是已经到了最后一次
  func isSubsequence(_ s: String, _ t: String) -> Bool {
    guard s.count <= t.count else {
      return false
    }
    guard s.count > 0 else {
      return true
    }

    let s = Array(s)
    let t = Array(t)
    var ps = 0
    var pt = 0
    while ps < s.count, pt < t.count {
      if s[ps] == t[pt] {
        ps += 1
        pt += 1
      }
      else {
        pt += 1
      }
    }

    // 如果s全部被扫描，说明有subsequence
    if ps == s.count {
      return true
    } else {
      return false
    }
  }

  // MARK: - 如果有很多s需要查询
  /// Binary search
  /// https://leetcode.com/problems/is-subsequence/discuss/87292/Swift-solution-Binary-Search
  /// https://leetcode.com/problems/is-subsequence/discuss/87302/Binary-search-solution-for-follow-up-with-detailed-comments
//  Binary search:
//
//  record the indexes for each character in t, if s[i] matches t[j], then s[i+1] should match a character in t with index bigger than j. This can be reduced to find the first element larger than a value in an sorted array (find upper bound), which can be achieved using binary search.
//  Trie:
//
//  For example, if s1 has been matched, s1[last char] matches t[j]. Now, s2 comes, if s1 is a prefix of s2, i.e., s1 == s2.substr[0, i-1], we can start match s2 from s2[i], right?
//  So, the idea is to create a Trie for all string that have been matched so far. At a node, we record the position in t which matches this char represented by the node. Now, for an incoming string s, we first search the longest prefix in the Trie, find the matching position of the last prefix-char in t, say j. Then, we can start matching the first non-prefix-char of s from j+1.
//  Now, if we have done the preprocessing as stated in the binary search approach, we can be even faster.
  // TODO:

}
