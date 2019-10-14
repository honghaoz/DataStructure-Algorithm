// 13_Roman to Integer
// https://leetcode.com/problems/roman-to-integer/
//
// Created by Honghao Zhang on 10/13/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.
//
//Symbol       Value
//I             1
//V             5
//X             10
//L             50
//C             100
//D             500
//M             1000
//For example, two is written as II in Roman numeral, just two one's added together. Twelve is written as, XII, which is simply X + II. The number twenty seven is written as XXVII, which is XX + V + II.
//
//Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:
//
//I can be placed before V (5) and X (10) to make 4 and 9.
//X can be placed before L (50) and C (100) to make 40 and 90.
//C can be placed before D (500) and M (1000) to make 400 and 900.
//Given a roman numeral, convert it to an integer. Input is guaranteed to be within the range from 1 to 3999.
//
//Example 1:
//
//Input: "III"
//Output: 3
//Example 2:
//
//Input: "IV"
//Output: 4
//Example 3:
//
//Input: "IX"
//Output: 9
//Example 4:
//
//Input: "LVIII"
//Output: 58
//Explanation: L = 50, V= 5, III = 3.
//Example 5:
//
//Input: "MCMXCIV"
//Output: 1994
//Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.
//

// 罗马数字转为阿拉伯数字。

import Foundation

class Num13 {
  // MARK: - 从后往前扫描每个字母，如果当前的字母数值小于之前的数值，则减去
  func romanToInt(_ s: String) -> Int {
    var dict = [Character: Int]()
    dict[Character("I")] = 1
    dict[Character("V")] = 5
    dict[Character("X")] = 10
    dict[Character("L")] = 50
    dict[Character("C")] = 100
    dict[Character("D")] = 500
    dict[Character("M")] = 1000

    let chars = [Character](s.reversed())
    var number = 0

    // 从后往前扫描，如果遇到当前的数字比之前的数字小，那么就需要减去：比如IV -> 5 - 1
    for i in 0..<chars.count {
      guard let current = dict[chars[i]] else {
        return number
      }
      if i > 0 && current < dict[chars[i - 1]]! {
        number -= current
      } else {
        number += current
      }
    }

    return number
  }
}
