// 76_Minimum Window Substring
// https://leetcode.com/problems/minimum-window-substring/
//
// Created by Honghao Zhang on 10/23/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a string S and a string T, find the minimum window in S which will contain all the characters in T in complexity O(n).
//
//Example:
//
//Input: S = "ADOBECODEBANC", T = "ABC"
//Output: "BANC"
//Note:
//
//If there is no such window in S that covers all characters in T, return the empty string "".
//If there is such window, you are guaranteed that there will always be only one unique minimum window in S.
//

// 在s中找出最小的substring，这个substring要包含t里所有的char
// sliding window

import Foundation

class Num76 {
  // MARK: - Sliding Window
  // find the min window size in `s`, that `s` contains `t`
  func minWindow(_ s: String, _ t: String) -> String {
    var charCount: [Character: Int] = [:]
    var tCharCount: [Character: Int] = [:]
    for c in t {
      tCharCount[c] = (tCharCount[c] ?? 0) + 1
    }

    // window is [i..<j]
    var i = 0
    var j = 0

    // answer
    var minSize = Int.max
    var minI = 0
    var minJ = 0

    let s = Array(s)
    while i <= j, j <= s.count {
      if isContaining(charCount, tCharCount) {
        // contains, should move i
        // update window size
        if j - i < minSize {
          minSize = j - i
          minI = i
          minJ = j
        }

        // move i
        i += 1
        // update the charCount dict
        let oldChar = s[i - 1]
        if charCount[oldChar]! == 1 {
          charCount.removeValue(forKey: oldChar)
        }
        else {
          charCount[oldChar] = charCount[oldChar]! - 1
        }
      }
      else {
        // should move j
        if j == s.count {
          break
        }

        j += 1
        // update charCount dict
        let newChar = s[j - 1]
        charCount[newChar] = charCount[newChar, default: 0] + 1
      }
    }

    return String(s[minI..<minJ])
  }

  /// Checks if s contains t
  private func isContaining(_ sCharCount: [Character: Int], _ tCharCount: [Character: Int]) -> Bool {
    var sCharCount = sCharCount
    for (c, cCount) in tCharCount {
      if let count = sCharCount[c], count >= cCount {
        sCharCount[c] = count - cCount
      }
      else {
        return false
      }
    }
    return true
  }
}
