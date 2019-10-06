// 97_Interleaving String
// https://leetcode.com/problems/interleaving-string
//
// Created by Honghao Zhang on 10/3/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given s1, s2, s3, find whether s3 is formed by the interleaving of s1 and s2.
//
//Example 1:
//
//Input: s1 = "aabcc", s2 = "dbbca", s3 = "aadbbcbcac"
//Output: true
//Example 2:
//
//Input: s1 = "aabcc", s2 = "dbbca", s3 = "aadbbbaccc"
//Output: false
//

import Foundation

class Num97 {
  // MARK: Recursive
  // The idea is straightforward: If s3 can be composed with s1 and s2, the first char of s3 must
  // be equal to s1[0] or s2[0], if it's matched
  // then we stripe it from both string and call with the rest string.
  func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
    return isInterleaveHelper(Array(s1), Array(s2), Array(s3))
  }
  
  func isInterleaveHelper(_ s1: [Character], _ s2: [Character], _ s3: [Character]) -> Bool {
    guard s1.count > 0 else {
      return s2 == s3
    }
    guard s2.count > 0 else {
      return s1 == s3
    }
    guard s3.count > 0 else {
      return s1.count == 0 && s2.count == 0
    }
    
    if s1[0] == s3[0] && s2[0] == s3[0] {
      return isInterleaveHelper(s1[1...].array, s2, s3[1...].array) || isInterleaveHelper(s1, s2[1...].array, s3[1...].array)
    }
    else if s1[0] == s3[0] {
      return isInterleaveHelper(s1[1...].array, s2, s3[1...].array)
    }
    else if s2[0] == s3[0] {
      return isInterleaveHelper(s1, s2[1...].array, s3[1...].array)
    }
    else {
      // no match, can't interleave
      return false
    }
  }
  
  // MARK: Recursive, slightly efficient
  func isInterleave2(_ s1: String, _ s2: String, _ s3: String) -> Bool {
    return isInterleaveHelper2(Array(s1), 0, Array(s2), 0, Array(s3), 0)
  }
  
  // i is the start index
  func isInterleaveHelper2(_ s1: [Character], _ i1: Int, _ s2: [Character], _ i2: Int, _ s3: [Character], _ i3: Int) -> Bool {
    guard i1 < s1.count else {
      return s2[i2...] == s3[i3...]
    }
    guard i2 < s2.count else {
      return s1[i1...] == s3[i3...]
    }
    guard i3 < s3.count else {
      return i1 == s1.count && i2 == s2.count
    }
    
    if s1[i1] == s3[i3] && s2[i2] == s3[i3] {
      return isInterleaveHelper2(s1, i1 + 1, s2, i2, s3, i3 + 1) || isInterleaveHelper2(s1, i1, s2, i2 + 1, s3, i3 + 1)
    }
    else if s1[i1] == s3[i3] {
      return isInterleaveHelper2(s1, i1 + 1, s2, i2, s3, i3 + 1)
    }
    else if s2[i2] == s3[i3] {
      return isInterleaveHelper2(s1, i1, s2, i2 + 1, s3, i3 + 1)
    }
    else {
      // no match, can't interleave
      return false
    }
  }
  
  // MARK: - DP solution
  // 2d array to represent if s1 prefix and s2 prefix can interleave s3 prefix
  func isInterleave_DP(_ s1: String, _ s2: String, _ s3: String) -> Bool {
    guard s1.count > 0 else {
      return s2 == s3
    }
    guard s2.count > 0 else {
      return s1 == s3
    }
    guard s3.count > 0 else {
      return s1.count == 0 && s2.count == 0
    }
    guard s3.count == s1.count + s2.count else {
      return false
    }
    
    // state
    // s[i][j] represents if s1[0..<i] and s2[0..<j] can compose s3[0..<(i + j)]
    var s: [[Bool]] = Array(repeating: Array(repeating: false, count: s2.count + 1), count: s1.count + 1)
    
    // initialize
    s[0][0] = true
    
    for i in 1...s1.count {
      // if s1[0..<i] is equal to s3[0..<i]
      s[i][0] = s1[0..<i] == s3[0..<i]
    }
    for j in 1...s2.count {
      // if s2[0..<i] is equal to s3[0..<j]
      s[0][j] = s2[0..<j] == s3[0..<j]
    }
    
    // function
    // s[i][j] == s[]
    for i in 1...s1.count {
      for j in 1...s2.count {
        // if last char in s1 == s3, this is matched, check if s[i - 1][j]
        if s1[i - 1] == s3[i + j - 1] {
          s[i][j] = s[i][j] || s[i - 1][j] // If s[i][j] is true, keep it.
        }
        // if last char in s2 == s3, this is matched, check if s[i - 1][j]
        if s2[j - 1] == s3[i + j - 1] {
          s[i][j] = s[i][j] || s[i][j - 1]
        }
      }
    }
    
    // answer
    return s[s1.count][s2.count]
  }
}

extension ArraySlice where Element == Character {
  var array: [Character] {
    return Array(self)
  }
}
