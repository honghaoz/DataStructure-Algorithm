// 739_Daily Temperatures
// https://leetcode.com/problems/daily-temperatures/
//
// Created by Honghao Zhang on 10/20/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a list of daily temperatures T, return a list such that, for each day in the input, tells you how many days you would have to wait until a warmer temperature. If there is no future day for which this is possible, put 0 instead.
//
//For example, given the list of temperatures T = [73, 74, 75, 71, 69, 72, 76, 73], your output should be [1, 1, 4, 2, 1, 1, 0, 0].
//
//Note: The length of temperatures will be in the range [1, 30000]. Each temperature will be an integer in the range [30, 100].
//

// 给出每天的气温，找出每天需要等多少天才能更暖和

import Foundation

class Num739 {
  // MARK: - 用Stack
  // 还是从后向前扫描，用stack来保持一个比当前气温大的数组（stack存的是index）
  // 每次添加新的气温时，把比它小的气温都pop掉
  func dailyTemperatures_Stack(_ T: [Int]) -> [Int] {
    var higherTempIndexStack: [Int] = []
    var answer: [Int] = Array(repeating: 0, count: T.count)
    for i in (0..<T.count).reversed() {
      let currentTemp = T[i]
      while !higherTempIndexStack.isEmpty {
        let next = T[higherTempIndexStack.last!]
        if next <= currentTemp {
          higherTempIndexStack.removeLast()
        }
        else {
          break
        }
      }

      // now higher temp stack stores the next higher temp
      answer[i] = (higherTempIndexStack.last ?? i) - i
      higherTempIndexStack.append(i)
    }

    return answer
  }

  // MARK: - 从后向前扫描，用next来存后面的气温
  // 因为已知气温范围，对于每天的气温，去next里查更高气温的index，并记录最小的天数
  func dailyTemperatures(_ T: [Int]) -> [Int] {
    var result: [Int] = Array(repeating: 0, count: T.count)
    // temp to index
    var next: [Int] = Array(repeating: -1, count: 101)

    for i in (0..<T.count).reversed() {
      let currentTemp = T[i]

      var days = Int.max
      // find the next warmer temp

      // if this is the highest temp, continue
      if currentTemp == 100 {
        next[T[i]] = i
        continue
      }
      else {
        for temp in (currentTemp + 1)...100 {
          if next[temp] > i {
            days = min(next[temp] - i, days)
          }
        }
        // If there's no future warmer day
        if days != Int.max {
          result[i] = days
        }
      }


      next[T[i]] = i
    }

    return result
  }
}
