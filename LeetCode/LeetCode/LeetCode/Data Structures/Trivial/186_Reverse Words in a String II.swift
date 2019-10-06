// 186_Reverse Words in a String II
// https://leetcode.com/problems/reverse-words-in-a-string-ii/
//
// Created by Honghao Zhang on 10/5/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given an input string , reverse the string word by word.
//
//Example:
//
//Input:  ["t","h","e"," ","s","k","y"," ","i","s"," ","b","l","u","e"]
//Output: ["b","l","u","e"," ","i","s"," ","s","k","y"," ","t","h","e"]
//Note:
//
//A word is defined as a sequence of non-space characters.
//The input string does not contain leading or trailing spaces.
//The words are always separated by a single space.
//Follow up: Could you do it in-place without allocating extra space?
//

import Foundation

class Num186 {
  // 考编程细节题
  // MARK: - 用functional的方式来写
  func reverseWords(_ s: inout [Character]) {
    s = Array(Array(s.split(separator: " ").reversed()).reduce([]) {
      $0 + $1 + [" "]
    }.dropLast())
  }
}
