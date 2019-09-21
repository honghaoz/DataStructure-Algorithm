// 933_Number of Recent Calls
// https://leetcode.com/problems/number-of-recent-calls/
//
// Created by Honghao Zhang on 9/20/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Write a class RecentCounter to count recent requests.
//
//It has only one method: ping(int t), where t represents some time in milliseconds.
//
//Return the number of pings that have been made from 3000 milliseconds ago until now.
//
//Any ping with time in [t - 3000, t] will count, including the current ping.
//
//It is guaranteed that every call to ping uses a strictly larger value of t than before.
//
//
//
//Example 1:
//
//Input: inputs = ["RecentCounter","ping","ping","ping","ping"], inputs = [[],[1],[100],[3001],[3002]]
//Output: [null,1,2,3,3]
//
//
//Note:
//
//Each test case will have at most 10000 calls to ping.
//Each test case will call ping with strictly increasing values of t.
//Each call to ping will have 1 <= t <= 10^9.
//

import Foundation

class Num933 {
  /// Easy one, use a queue.
  class RecentCounter {
    var pings: [Int] = []
    init() {
    }

    func ping(_ t: Int) -> Int {
      pings.append(t)
      let start = (t - 3000)
      var i = pings.count - 1
      while i >= 0, pings[i] >= start {
        i -= 1
      }

      // pings[i] is < start
      return pings.count - (i + 1)
    }
  }

  /**
   * Your RecentCounter object will be instantiated and called as such:
   * let obj = RecentCounter()
   * let ret_1: Int = obj.ping(t)
   */
}
