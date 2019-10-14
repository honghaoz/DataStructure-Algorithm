// 242_Valid Anagram
// https://leetcode.com/problems/valid-anagram/
//
// Created by Honghao Zhang on 10/13/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given two strings s and t , write a function to determine if t is an anagram of s.
//
//Example 1:
//
//Input: s = "anagram", t = "nagaram"
//Output: true
//Example 2:
//
//Input: s = "rat", t = "car"
//Output: false
//Note:
//You may assume the string contains only lowercase alphabets.
//
//Follow up:
//What if the inputs contain unicode characters? How would you adapt your solution to such case?
//

import Foundation

class Num242 {
  // MARK: - Use char table to count
  // Use char in s to increment the count
  // Use char in t to decrement the count
  // Then check if the count is all zero
  // If during the iteration, count is below zero, can early return
  // O(n)
  // O(1) // this is because the table is fixed size, regardless of the input size
  func isAnagram(_ s: String, _ t: String) -> Bool {
    let alphabeta = "abcdefghijklmnopqrstuvwxyz"
    var table: [Character: Int] = [:]
    for c in alphabeta {
      table[c] = 0
    }

    for c in s {
      table[c] = table[c]! + 1
    }

    for c in t {
      table[c] = table[c]! - 1
      if table[c]! < 0 {
        return false
      }
    }

    for c in alphabeta {
      if table[c] != 0 {
        return false
      }
    }
    return true
  }

  // MARK: - Sort and compare
  // O(n logn)
  // O(1)
  func isAnagram_sort(_ s: String, _ t: String) -> Bool {
    return s.sorted() == t.sorted()
  }
}
