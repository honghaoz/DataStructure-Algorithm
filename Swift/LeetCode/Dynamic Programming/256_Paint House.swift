// 256_Paint House
// https://leetcode.com/problems/paint-house/
//
// Created by Honghao Zhang on 10/18/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// There are a row of n houses, each house can be painted with one of the three colors: red, blue or green. The cost of painting each house with a certain color is different. You have to paint all the houses such that no two adjacent houses have the same color.
//
//The cost of painting each house with a certain color is represented by a n x 3 cost matrix. For example, costs[0][0] is the cost of painting house 0 with color red; costs[1][2] is the cost of painting house 1 with color green, and so on... Find the minimum cost to paint all houses.
//
//Note:
//All costs are positive integers.
//
//Example:
//
//Input: [[17,2,17],[16,16,5],[14,3,19]]
//Output: 10
//Explanation: Paint house 0 into blue, paint house 1 into green, paint house 2 into blue.
//             Minimum cost: 2 + 5 + 3 = 10.
//

// 房子涂颜色，有三种不同价格颜色，相邻的两个房子不能涂同样的颜色
// 求最小cost

import Foundation

class Num256 {
  // MARK: - DP
  // state是在i房子涂不同颜色的min cost，
  // 转移方程，根据涂的不同颜色，结合之前i-1个房子min cost，推导下一个min cost
  // 经验：这里state可以简化为三个数字，这样可以节省空间
  func minCost(_ costs: [[Int]]) -> Int {
    let n = costs.count
    guard n > 0 else {
      return 0
    }

    // state
    // s[i][0...2]: the min cost for choose different colors at index i
    var s: [[Int]] = Array(repeating: Array(repeating: 0, count: 3), count: n)

    // initialize
    s[0][0] = costs[0][0]//min(costs[0][1], costs[0][2])
    s[0][1] = costs[0][1]//min(costs[0][0], costs[0][2])
    s[0][2] = costs[0][2]//min(costs[0][0], costs[0][1])

    // transition function
    for i in 1..<n {
      // i choose 0, find the min of s[i - 1][1] and s[i - 1][2]
      s[i][0] = costs[i][0] + min(s[i - 1][1], s[i - 1][2])
      s[i][1] = costs[i][1] + min(s[i - 1][0], s[i - 1][2])
      s[i][2] = costs[i][2] + min(s[i - 1][0], s[i - 1][1])
    }

    // answer
    return s[n - 1].min()!
  }
}
