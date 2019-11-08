// 132_Palindrome Partitioning II
// https://leetcode.com/problems/palindrome-partitioning-ii/
//
// Created by Honghao Zhang on 10/1/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a string s, partition s such that every substring of the partition is a palindrome.
//
//Return the minimum cuts needed for a palindrome partitioning of s.
//
//Example:
//
//Input: "aab"
//Output: 1
//Explanation: The palindrome partitioning ["aa","b"] could be produced using 1 cut.
//

import Foundation

class Num132 {
  // MARK: - DP with faster isPalindrome
  /// O(n^2)
  func minCut_dp(_ str: String) -> Int {
    guard str.count > 0 else {
      return 0
    }

    let str = Array(str)

    // To make the isPalindrome check faster, we need
    // to do some pre processing
    // isPalindrome[i][j] indicates if s[i...j] is a palindrome string
    var isPalindrome: [[Bool]] = Array(repeating: Array(repeating: false, count: str.count + 1), count: str.count + 1)

    for length in 1...str.count {
      for i in 0...(str.count - length) {
        let j = i + length - 1
        if j == i {
          isPalindrome[i][i] = true
        }
        else if j == i + 1 {
          isPalindrome[i][j] = (str[i] == str[j])
        }
        else {
          isPalindrome[i][j] = (str[i] == str[j] && isPalindrome[i + 1][j - 1])
        }
      }
    }

    // state
    // s[i] represents the min palindrom partitions. for str[0..<i]
    var s: [Int] = Array(repeating: Int.max, count: str.count + 1)

    // initialize
    s[0] = 0

    // transition function
    for i in 1..<s.count {
      var minPartitions = Int.max
      for j in 0..<i {
        if isPalindrome[j][i - 1] {
          minPartitions = min(minPartitions, s[j] + 1)
        }
      }
      s[i] = minPartitions
    }

    // answer
    // the min cut is the partitions count - 1
    return s[str.count] - 1
  }

  // MARK: - DP without isPalindrome check optimization
  /// Time complexity: O(n^3)
  func minCut_dp2(_ str: String) -> Int {
    guard str.count > 0 else {
      return 0
    }

    // state
    // s[i] represents the min palindrom partitions. for str[0..<i]
    var s: [Int] = Array(repeating: Int.max, count: str.count + 1)

    // initialize
    // "aab"
    s[0] = 0 // ""
    // s[1] = s[0] + 1 = 1 // "a"
    // s[2] = min(s[1] + 1, s[0] + 1) = 1 // "aa"
    // s[3] = s[2] + 1 = 2 // "aab"

    // transition function
    for i in 1..<s.count {
      var minPartitions = Int.max
      for j in (0..<i).reversed() {
        let substring = str[j..<i]
        if substring.isPalindrome {
          minPartitions = min(minPartitions, s[j] + 1)
        }
      }
      s[i] = minPartitions
    }

    // answer
    // the min cut is the partitions count - 1
    return s[str.count] - 1
  }
}

extension String {
  var isPalindrome: Bool {
    if self.count == 0 {
      return true
    }

    //  01234
    // "abcd" 4/2 = 2
    // "abcde" 5/2 = 2

    var i = 0
    while i < self.count / 2 {
      let j = self.count - 1 - i
      if self[i] != self[j] {
        return false
      }

      i += 1
    }

    return true
  }
}
