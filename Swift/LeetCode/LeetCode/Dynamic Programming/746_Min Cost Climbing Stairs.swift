// 746_Min Cost Climbing Stairs
// https://leetcode.com/problems/min-cost-climbing-stairs/
//
// Created by Honghao Zhang on 9/21/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// On a staircase, the i-th step has some non-negative cost cost[i] assigned (0 indexed).
//
//Once you pay the cost, you can either climb one or two steps. You need to find minimum cost to reach the top of the floor, and you can either start from the step with index 0, or the step with index 1.
//
//Example 1:
//
//Input: cost = [10, 15, 20]
//Output: 15
//Explanation: Cheapest is start on cost[1], pay that cost and go to the top.
//Example 2:
//
//Input: cost = [1, 100, 1, 1, 1, 100, 1, 1, 100, 1]
//Output: 6
//Explanation: Cheapest is start on cost[0], and only step on 1s, skipping cost[3].
//Note:
//
//cost will have a length in the range [2, 1000].
//Every cost[i] will be an integer in the range [0, 999].
//

import Foundation

class Num746 {
  // DP, find the state definition
  // s[i] (for i >= 2) means the min cost to get the top of i-1 th stair
  // s[i] = min(s[i - 1] + cost[i - 1], s[i - 2] + cost[i - 2]), the cost needs to be taken into
  // account for next step.
  func minCostClimbingStairs(_ cost: [Int]) -> Int {
    if cost.count == 0 {
      return 0
    }
    if cost.count == 1 {
      return 0
    }
    if cost.count == 2 {
      return 0
    }

    // state:
    // s[i] means the min cost to reach i-th step, i >= 2
    // s[2] is on the top of index: 1
    // s[3] is on the top of index: 2
    //
    // Example:
    //   0   1   2
    // [10, 15, 20]
    // We need get the s[3]

    // initialize:
    var s: [Int] = Array(repeating: 0, count: cost.count + 1)

    // function
    for i in 2...cost.count {
      s[i] = min(s[i - 1] + cost[i - 1], s[i - 2] + cost[i - 2])
    }

    // answer: find s[cost.count]
    return s[cost.count]
  }
}
