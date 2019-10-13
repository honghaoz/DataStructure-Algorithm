//
//  345. Reverse Vowels of a String.swift
//  https://leetcode.com/problems/reverse-vowels-of-a-string/
//
//  Created by Honghao Zhang on 2016-11-02.
//  Copyright © 2016 Honghaoz. All rights reserved.
//
//Write a function that takes a string as input and reverse only the vowels of a string.
//
//Example 1:
//
//Input: "hello"
//Output: "holle"
//Example 2:
//
//Input: "leetcode"
//Output: "leotcede"
//Note:
//The vowels does not include the letter "y".


import Foundation

class Num345_ReverseVowels: Solution {
  func reverseVowels(_ s: String) -> String {
    var s = [Character](s)
    var vowelsIndices: [Int] = []

    for (index, char) in s.enumerated() {
      if char == "a" || char == "e" || char == "i" || char == "o" || char == "u" ||
        char == "A" || char == "E" || char == "I" || char == "O" || char == "U" {
        vowelsIndices.append(index)
      }
    }

    for i in 0..<vowelsIndices.count / 2 {
      let left = vowelsIndices[i]
      let right = vowelsIndices[vowelsIndices.count - 1 - i]
      (s[left], s[right]) = (s[right], s[left])
    }

    return String(s)
  }

  func test() {

  }
}
