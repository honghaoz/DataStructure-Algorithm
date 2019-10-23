// 191_Number of 1 Bits
// https://leetcode.com/problems/number-of-1-bits/
//
// Created by Honghao Zhang on 10/6/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Write a function that takes an unsigned integer and return the number of '1' bits it has (also known as the Hamming weight).
//
//
//
//Example 1:
//
//Input: 00000000000000000000000000001011
//Output: 3
//Explanation: The input binary string 00000000000000000000000000001011 has a total of three '1' bits.
//Example 2:
//
//Input: 00000000000000000000000010000000
//Output: 1
//Explanation: The input binary string 00000000000000000000000010000000 has a total of one '1' bit.
//Example 3:
//
//Input: 11111111111111111111111111111101
//Output: 31
//Explanation: The input binary string 11111111111111111111111111111101 has a total of thirty one '1' bits.
//
//
//Note:
//
//Note that in some languages such as Java, there is no unsigned integer type. In this case, the input will be given as signed integer type and should not affect your implementation, as the internal binary representation of the integer is the same whether it is signed or unsigned.
//In Java, the compiler represents the signed integers using 2's complement notation. Therefore, in Example 3 above the input represents the signed integer -3.
//
//
//Follow up:
//
//If this function is called many times, how would you optimize it?
//

import Foundation

class Num191 {
  // Loop, count n % 2 == 1 and loop by n / 2
//  class Solution(object):
//  def hammingWeight(self, n):
//      """
//      :type n: int
//      :rtype: int
//      """
//      number = n
//      count = 0
//      while number > 0:
//        if number % 2 == 1:
//          count += 1
//        number = number / 2
//
//      return count
//

  // MARK: - Shift the mask and count the bits
  // 000100000000000000000000000000000001 & number
  // 000100000000000000000000000000000010 & number
//  public int hammingWeight(int n) {
//      int bits = 0;
//      int mask = 1;
  // 移动32位，每次检查一遍是否有1
//      for (int i = 0; i < 32; i++) {
//          if ((n & mask) != 0) {
//              bits++;
//          }
//          mask <<= 1;
//      }
//      return bits;
//  }
}
