// 190_Reverse Bits
// https://leetcode.com/problems/reverse-bits/
//
// Created by Honghao Zhang on 10/16/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Reverse bits of a given 32 bits unsigned integer.
//
//
//
//Example 1:
//
//Input: 00000010100101000001111010011100
//Output: 00111001011110000010100101000000
//Explanation: The input binary string 00000010100101000001111010011100 represents the unsigned integer 43261596, so return 964176192 which its binary representation is 00111001011110000010100101000000.
//Example 2:
//
//Input: 11111111111111111111111111111101
//Output: 10111111111111111111111111111111
//Explanation: The input binary string 11111111111111111111111111111101 represents the unsigned integer 4294967293, so return 3221225471 which its binary representation is 10101111110010110010011101101001.
//
//
//Note:
//
//Note that in some languages such as Java, there is no unsigned integer type. In this case, both input and output will be given as signed integer type and should not affect your implementation, as the internal binary representation of the integer is the same whether it is signed or unsigned.
//In Java, the compiler represents the signed integers using 2's complement notation. Therefore, in Example 2 above the input represents the signed integer -3 and the output represents the signed integer -1073741825.
//
//
//Follow up:
//
//If this function is called many times, how would you optimize it?
//

// 把一个2进制数字reverse

import Foundation

class Num190 {
  // MARK: - Use bit manipulation
  // 基本思路就是把n的每一bit都从右向左读一遍
  // 读的过程中，result保存每一位，并且向左移
  func reverseBits(_ n: Int) -> Int {
    var n = n
    var result = 0 // the reversed int

    for i in 0..<32 { // 对于32位的每一位
      result += (n & 1) // n & 1：取出n的最后一位数字。result是从右边向左移动
      n >>= 1 // n右移一位，这下下一次n & 1就会取第二位
      if i < 31 {
        result <<= 1
      }
    }

    return result

    // 0011
  }
}
