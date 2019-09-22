// 441_Arranging Coins
// https://leetcode.com/problems/arranging-coins/
//
// Created by Honghao Zhang on 9/16/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// You have a total of n coins that you want to form in a staircase shape, where every k-th row must have exactly k coins.
//
//Given n, find the total number of full staircase rows that can be formed.
//
//n is a non-negative integer and fits within the range of a 32-bit signed integer.
//
//Example 1:
//
//n = 5
//
//The coins can form the following rows:
//¤
//¤ ¤
//¤ ¤
//
//Because the 3rd row is incomplete, we return 2.
//Example 2:
//
//n = 8
//
//The coins can form the following rows:
//¤
//¤ ¤
//¤ ¤ ¤
//¤ ¤
//
//Because the 4th row is incomplete, we return 3.
//

import Foundation

class Num441 {
  /// Use a binary search to find the row count
  /// Sum is 上底加下底的和，乘以高，除以2
  func arrangeCoins(_ n: Int) -> Int {
      guard n > 0 else {
        return 0
      }
    if n == 1 {
      return 1
    }
    // start, mid, end is the number of rows
    var start = 1
    var end = n
    while start + 1 < end {
      let mid = start + (end - start) / 2
      let sum = (mid + 1) * mid / 2
      if sum < n {
        start = mid
      }
      else if sum > n {
        end = mid
      }
      else {
        return mid
      }
    }
    if (end + 1) * end / 2 <= n {
      return end
    }
    else {
      return start
    }
  }
}
