// 338_Counting Bits
// https://leetcode.com/problems/counting-bits/
//
// Created by Honghao Zhang on 10/20/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a non negative integer number num. For every numbers i in the range 0 ≤ i ≤ num calculate the number of 1's in their binary representation and return them as an array.
//
//Example 1:
//
//Input: 2
//Output: [0,1,1]
//Example 2:
//
//Input: 5
//Output: [0,1,1,2,1,2]
//Follow up:
//
//It is very easy to come up with a solution with run time O(n*sizeof(integer)). But can you do it in linear time O(n) /possibly in a single pass?
//Space complexity should be O(n).
//Can you do it like a boss? Do it without using any builtin function like __builtin_popcount in c++ or in any other language.
//

import Foundation

class Num338 {
  // MARK: - Bit manipulation
  func countBits_bitManipulation(_ num: Int) -> [Int] {
    if num == 0 {
      return [0]
    }
    
    var result: [Int] = Array(repeating: 0, count: num + 1)
    for i in 1...num {
      result[i] = result[i & (i - 1)] + 1
    }
    return result
  }
  
  // MARK: - Map every number to the bit count
  func countBits(_ num: Int) -> [Int] {
    return Array(0...num).map {
      popCount($0)
    }
  }
  
  /// Get number of 1s for a number
  private func popCount(_ num: Int) -> Int {
    var num = num
    var count = 0
    while num != 0 {
      count += 1
      num = num & (num - 1)
    }
    return count
  }
}
