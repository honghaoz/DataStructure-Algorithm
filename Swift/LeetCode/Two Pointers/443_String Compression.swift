// 443_String Compression
// https://leetcode.com/problems/string-compression/
//
// Created by Honghao Zhang on 10/17/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given an array of characters, compress it in-place.
//
//The length after compression must always be smaller than or equal to the original array.
//
//Every element of the array should be a character (not int) of length 1.
//
//After you are done modifying the input array in-place, return the new length of the array.
//
//
//Follow up:
//Could you solve it using only O(1) extra space?
//
//
//Example 1:
//
//Input:
//["a","a","b","b","c","c","c"]
//
//Output:
//Return 6, and the first 6 characters of the input array should be: ["a","2","b","2","c","3"]
//
//Explanation:
//"aa" is replaced by "a2". "bb" is replaced by "b2". "ccc" is replaced by "c3".
//
//
//Example 2:
//
//Input:
//["a"]
//
//Output:
//Return 1, and the first 1 characters of the input array should be: ["a"]
//
//Explanation:
//Nothing is replaced.
//
//
//Example 3:
//
//Input:
//["a","b","b","b","b","b","b","b","b","b","b","b","b"]
//
//Output:
//Return 4, and the first 4 characters of the input array should be: ["a","b","1","2"].
//
//Explanation:
//Since the character "a" does not repeat, it is not compressed. "bbbbbbbbbbbb" is replaced by "b12".
//Notice each digit has it's own entry in the array.
//
//
//Note:
//
//All characters have an ASCII value in [35, 126].
//1 <= len(chars) <= 1000.
//

// 压缩字母，连续的char用这个char和重复的数字个数表示
// 把连续的char用数字代替，单个char不用处理。超过10个数字，添加两个chars

import Foundation

class Num443 {
  // MARK: - Read and write pointer (index)
  func compress(_ chars: inout [Character]) -> Int {
    guard chars.count > 0 else {
      return 0
    }

    // the write index
    var write = 0

    // the read index
    var read = 1
    // the count for current char's continuous count
    var count = 1
    while read < chars.count {
      if chars[read - 1] == chars[read] {
        // if same char, just increment count
        count += 1
      }
      else {
        if count == 1 {
          // no need to compress
          chars[write] = chars[read - 1]
          write += 1
        }
        else {
          chars[write] = chars[read - 1]
          write += 1
          for c in Array("\(count)") { // for count > 10, needs to append chars separately
            chars[write] = c
            write += 1
          }

          // reset
          count = 1
        }
      }

      read += 1
    }

    if count > 1 {
      chars[write] = chars[read - 1]
      write += 1
      for c in Array("\(count)") {
        chars[write] = c
        write += 1
      }
    }
    else if count == 1 {
      chars[write] = chars[read - 1]
      write += 1
    }

    return write
  }
}
