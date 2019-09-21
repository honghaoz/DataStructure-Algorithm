//
//  3. Longest Substring Without Repeating Characters.swift
//  https://leetcode.com/problems/longest-substring-without-repeating-characters/
//
//  Created by Honghao Zhang on 2016-11-05.
//  Copyright © 2016 Honghaoz. All rights reserved.
//

//Given a string, find the length of the longest substring without repeating characters.
//
//Examples:
//
//Given "abcabcbb", the answer is "abc", which the length is 3.
//
//Given "bbbbb", the answer is "b", with the length of 1.
//
//Given "pwwkew", the answer is "wke", with the length of 3. Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
//
//Subscribe to see which companies asked this question

import Foundation

class Num3_LongestSubstringWithoutRepeatingCharacters: Solution {
  // Standard sliding window, move left by 1 or right by 1
  func lengthOfLongestSubstring_slidingWindow(_ s: String) -> Int {
    guard s.isEmpty == false else { return 0 }
    var i = 0
    var j = 0
    let s = [Character](s)
    var result = 0

    var set = Set<Character>()
    while i <  s.count, j < s.count {
      // if found a duplicated char
      if set.contains(s[j]) {
        set.remove(s[i])
        i += 1
      } else {
        set.insert(s[j])
        result = max(result, j - i + 1)
        j += 1
      }
    }
    return result
  }

  // Optimized sliding window, moves left to the desired position directly
  func lengthOfLongestSubstring(_ s: String) -> Int {
    guard s.isEmpty == false else { return 0 }
    let s = [Character](s)
    var i = 0 // the beginning index
    var j = 0 // the end index
    var dict = [Character : Int]() // the dict for char to index
    var result = 0 // the length of the current max substring

    // moves j from 0 -> end
    // moves i of there's a duplicated char
    while i < s.count, j < s.count {
      // If found a duplicated char, and that index is >= i (the beginning index),
      // start a new substring
      if let prevJIndex = dict[s[j]], prevJIndex >= i {
        i = prevJIndex + 1
      }
      dict[s[j]] = j
      result = max(result, j - i + 1)
      j += 1
    }
    return result
  }

  func lengthOfLongestSubstring1(_ s: String) -> Int {
    guard s.isEmpty == false else { return 0 }
    let s = [Character](s)
    var i = 0
    var j = i + 1
    var max = 1
    var pos: [Character : Int] = [s[0] : 0]

    while j < s.count {
      // if find duplicated
      if let existedIndex = pos[s[j]] {
        if s[i] == s[j] {
          i += 1
        } else {
          for x in 0...existedIndex {
            pos.removeValue(forKey: s[x])
          }
          i = existedIndex + 1
        }
      }

      if j - i + 1 > max {
        max = j - i + 1
      }
      pos[s[j]] = j
      j += 1
    }

    return max
  }

  func test() {
    let _ = lengthOfLongestSubstring("tmmzuxt")
  }
}
