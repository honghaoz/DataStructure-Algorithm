// 125_Valid Palindrome
// https://leetcode.com/problems/valid-palindrome/
//
// Created by Honghao Zhang on 10/16/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.
//
//Note: For the purpose of this problem, we define empty string as valid palindrome.
//
//Example 1:
//
//Input: "A man, a plan, a canal: Panama"
//Output: true
//Example 2:
//
//Input: "race a car"
//Output: false
//

import Foundation

class Num125 {
  // MARK: - Process the string and check if it's palindrom
  func isPalindrome(_ s: String) -> Bool {
    let processed = Array(s).filter { $0.isGood }.map { $0.lowercased() }
    return processed == processed.reversed()
    // could use two pointers
  }
}

private extension Character {
  var isGood: Bool {
    return (Character("a") <= self && self <= Character("z"))
      || (Character("A") <= self && self <= Character("Z"))
      || (Character("0") <= self && self <= Character("9"))
  }
}
