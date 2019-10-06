// 121_Best Time to Buy and Sell Stock
// https://leetcode.com/problems/best-time-to-buy-and-sell-stock/
//
// Created by Honghao Zhang on 9/21/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Say you have an array for which the ith element is the price of a given stock on day i.
//
//If you were only permitted to complete at most one transaction (i.e., buy one and sell one share of the stock), design an algorithm to find the maximum profit.
//
//Note that you cannot sell a stock before you buy one.
//
//Example 1:
//
//Input: [7,1,5,3,6,4]
//Output: 5
//Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
//             Not 7-1 = 6, as selling price needs to be larger than buying price.
//Example 2:
//
//Input: [7,6,4,3,1]
//Output: 0
//Explanation: In this case, no transaction is done, i.e. max profit = 0.
//

import Foundation

class Num121 {
  // DP, S[i]是一个条件方程
  // 如果新的profit小于0，那么就只记录0
  // 只有profit > 0时才记录
  func maxProfit(_ prices: [Int]) -> Int {
    if prices.count == 0 {
      return 0
    }
    if prices.count == 1 {
      return 0
    }
    // prices.count >= 2
    
    // state: s[i] means the max profit you can get on i-th day
    // this means you can sell on i-th day
    // or there's no transaction was done (min is 0)
    var s: [Int] = Array(repeating: 0, count: prices.count)
    
    // function
    // you max profit you can get on ith day is the max profix you can get on i-1 th day
    // plus the price change between i and i-1 th day
    for i in 1..<prices.count {
      let priceChange = prices[i] - prices[i - 1]
      let newProfit = s[i - 1] + priceChange
      if newProfit < 0 {
        s[i] = 0
      }
      else {
        s[i] = newProfit
      }
    }
    
    var maxPro: Int = 0
    for i in 1..<prices.count {
      maxPro = max(maxPro, s[i])
    }
    return maxPro
  }
}
