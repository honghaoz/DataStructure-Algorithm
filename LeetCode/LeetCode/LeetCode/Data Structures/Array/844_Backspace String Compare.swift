// 844_Backspace String Compare
// https://leetcode.com/problems/backspace-string-compare/
//
// Created by Honghao Zhang on 9/2/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given two strings S and T, return if they are equal when both are typed into empty text editors. # means a backspace character.
//
//Example 1:
//
//Input: S = "ab#c", T = "ad#c"
//Output: true
//Explanation: Both S and T become "ac".
//Example 2:
//
//Input: S = "ab##", T = "c#d#"
//Output: true
//Explanation: Both S and T become "".
//Example 3:
//
//Input: S = "a##c", T = "#a#c"
//Output: true
//Explanation: Both S and T become "c".
//Example 4:
//
//Input: S = "a#c", T = "b"
//Output: false
//Explanation: S becomes "c" while T becomes "b".
//Note:
//
//1 <= S.length <= 200
//1 <= T.length <= 200
//S and T only contain lowercase letters and '#' characters.
//Follow up:
//
//Can you solve it in O(N) time and O(1) space?
//

import Foundation

class Num844 {
  // Process the string from left to right, then compare.
  // O(n), O(n)
  func backspaceCompare(_ S: String, _ T: String) -> Bool {
    return process(S) == process(T)
  }

  private func process(_ s: String) -> String {
    var processed: [Character] = []
    for c in s {
      if c != "#" {
        processed.append(c)
      } else {
        _ = processed.popLast()
      }
    }
    return String(processed)
  }

  // Two pointers
  // Chekc in reversed order.
  func backspaceCompare_O1(_  S: String, _ T: String) -> Bool {
    var p1 = 0
    var p2 = 0
    let s = String(S.reversed())
    let t = String(T.reversed())
    while p1 < s.count || p2 < t.count {
      skipHashes(s, &p1)
      skipHashes(t, &p2)
      if p1 < s.count, p2 < t.count {
        if s[p1] != t[p2] {
          return false
        }
      }
      if p1 < s.count, p2 >= t.count {
        return false
      }
      if p1 >= s.count, p2 < t.count {
        return false
      }
      p1 += 1
      p2 += 1
    }
    return true
  }

  private func skipHashes(_ s: String, _ p: inout Int) {
    guard p < s.count else { return }
    var skip = 0
    while p < s.count && (skip > 0 || s[p] == "#") {
      if s[p] == "#" {
        skip += 1
      } else {
        skip -= 1
      }
      p += 1
    }
  }

  private func countOfHash(_ s: String, _ p: Int) -> Int {
    guard p < s.count else { return 0 }
    var p = p
    var c = 0
    while p < s.count, s[p] == "#" {
      c += 1
      p += 1
    }
    return c
  }
}

extension String {
  subscript(_ index: Int) -> Character {
    return self[self.index(startIndex, offsetBy: index)]
  }
}
