// 202_Happy Number
// https://leetcode.com/problems/happy-number/
//
// Created by Honghao Zhang on 10/5/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Write an algorithm to determine if a number is "happy".
//
//A happy number is a number defined by the following process: Starting with any positive integer, replace the number by the sum of the squares of its digits, and repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1. Those numbers for which this process ends in 1 are happy numbers.
//
//Example:
//
//Input: 19
//Output: true
//Explanation:
//12 + 92 = 82
//82 + 22 = 68
//62 + 82 = 100
//12 + 02 + 02 = 1
//

import Foundation

class Num202 {
  // MARK: - Slow and fast pointer (Floyd's cycle-finding)
  func isHappy_slow_fast(_ n: Int) -> Bool {
    var slow = n
    var fast = n
    repeat {
      slow = sum(slow)
      fast = sum(fast)
      fast = sum(fast)
      if slow == 1 || fast == 1 {
        return true
      }
    } while slow != fast

    return false
  }

  /// MARK: - Use dict to record if number is visited
  func isHappy(_ n: Int) -> Bool {
    var n = n
    var visited: [Int: Bool] = [:]
    while visited[n] == nil, n != 1 {
      visited[n] = true
      n = sum(n)
    }
    if n == 1 {
      return true
    }
    else {
      return false
    }
  }

  private func sum(_ n: Int) -> Int {
    var sum = 0
    var n = n
    while n > 0 {
      let digit = n % 10
      sum += digit * digit
      n = n / 10
    }
    return sum
  }
}
