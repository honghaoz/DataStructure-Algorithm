// 387_First Unique Character in a String
// https://leetcode.com/problems/first-unique-character-in-a-string/
//
// Created by Honghao Zhang on 10/13/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a string, find the first non-repeating character in it and return it's index. If it doesn't exist, return -1.
//
//Examples:
//
//s = "leetcode"
//return 0.
//
//s = "loveleetcode",
//return 2.
//Note: You may assume the string contain only lowercase letters.
//

// 找到一个字符串中第一个不重复的字符

import Foundation

class Num387 {
  // MARK: - Build char count dictionary and check char again
  func firstUniqChar(_ s: String) -> Int {
    var charCount: [Character: Int] = [:]
    for c in s {
      charCount[c] = (charCount[c] ?? 0) + 1
    }
    for (index, c) in s.enumerated() {
      if charCount[c] == 1 {
        return index
      }
    }
    return -1
  }
}
