// 131_Palindrome Partitioning
// https://leetcode.com/problems/palindrome-partitioning/
//
// Created by Honghao Zhang on 10/1/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a string s, partition s such that every substring of the partition is a palindrome.
//
//Return all possible palindrome partitioning of s.
//
//Example:
//
//Input: "aab"
//Output:
//[
//  ["aa","b"],
//  ["a","a","b"]
//]
//

// 找一个string中找出全部palindrome partition

import Foundation

class Num131 {
  // MARK: - Backtrack Standard Template
  // 因为是partition，就是看切割点在哪里，所以就顺序找分割点
  // 如果招到一个合适的分割点，就把当前的substring存在path里，然后找剩下的partition
  // 只要没有string可以分割了
  func partition_backtrack(_ s: String) -> [[String]] {
    var results: [[String]] = []
    partitionHelper([], s, &results)
    return results
  }

  private func partitionHelper(_ path: [String], _ restString: String, _ results: inout [[String]]) {
    if restString.count == 0 {
      results.append(path)
      return
    }

    for i in 1...restString.count {
      let substring = restString[0..<i]
      if substring.isPalindrome {
        partitionHelper(path + [substring], restString[i..<restString.count], &results)
      }
    }
  }

  // DFS recursive
  // Three important steps:
  // 1) choose, choose at the break point
  // 2) explore, explore the rest path after a choose
  // 3) unchoose, go back and try with the next one.
  // https://leetcode.com/problems/palindrome-partitioning/discuss/182307/Java%3A-Backtracking-Template-General-Approach
  func partition(_ s: String) -> [[String]] {
    if s.count == 0 {
      return [[]] // This critical, for an empty string, we can assume there's empty partition.
    }

    var results: [[String]] = []
    // i is end index of the substring + 1
    for i in 1...s.count {
      let substring = s[0..<i]
      if substring.isPalindrome {
        let partitions: [[String]]
        if i == s.count {
          partitions = partition("")
        }
        else {
          partitions = partition(s[i..<s.count])
        }
        // append the result with the current substring
        results += partitions.map { [substring] + $0 }
      }
    }

    return results
  }
}
