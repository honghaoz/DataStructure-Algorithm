// 122_Best Time to Buy and Sell Stock II
// https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/
//
// Created by Honghao Zhang on 10/13/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Say you have an array for which the ith element is the price of a given stock on day i.

//Design an algorithm to find the maximum profit. You may complete as many transactions as you like (i.e., buy one and sell one share of the stock multiple times).
//
//Note: You may not engage in multiple transactions at the same time (i.e., you must sell the stock before you buy again).
//
//Example 1:
//
//Input: [7,1,5,3,6,4]
//Output: 7
//Explanation: Buy on day 2 (price = 1) and sell on day 3 (price = 5), profit = 5-1 = 4.
//             Then buy on day 4 (price = 3) and sell on day 5 (price = 6), profit = 6-3 = 3.
//Example 2:
//
//Input: [1,2,3,4,5]
//Output: 4
//Explanation: Buy on day 1 (price = 1) and sell on day 5 (price = 5), profit = 5-1 = 4.
//             Note that you cannot buy on day 1, buy on day 2 and sell them later, as you are
//             engaging multiple transactions at the same time. You must sell before buying again.
//Example 3:
//
//Input: [7,6,4,3,1]
//Output: 0
//Explanation: In this case, no transaction is done, i.e. max profit = 0.
//

// 有未来价格图，可以任意买卖，求最大profit

import Foundation

class Num122 {
  // MAKR: - 把每个上升高度都收集起来
  // O(n)
  // O(1)
  func maxProfit(_ prices: [Int]) -> Int {
    guard prices.count > 0 else {
      return 0
    }
    if prices.count == 1 {
      return 0
    }

    var profit = 0
    for i in 1..<prices.count {
      let previous = prices[i - 1]
      let current = prices[i]
      let diff = current - previous
      if diff > 0 {
        profit += diff
      }
    }
    return profit
  }
}
