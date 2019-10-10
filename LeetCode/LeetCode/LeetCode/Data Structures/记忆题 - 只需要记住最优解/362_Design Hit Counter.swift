// 362_Design Hit Counter
// https://leetcode.com/problems/design-hit-counter/
//
// Created by Honghao Zhang on 10/9/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Design a hit counter which counts the number of hits received in the past 5 minutes.
//
//Each function accepts a timestamp parameter (in seconds granularity) and you may assume that calls are being made to the system in chronological order (ie, the timestamp is monotonically increasing). You may assume that the earliest timestamp starts at 1.
//
//It is possible that several hits arrive roughly at the same time.
//
//Example:
//
//HitCounter counter = new HitCounter();
//
//// hit at timestamp 1.
//counter.hit(1);
//
//// hit at timestamp 2.
//counter.hit(2);
//
//// hit at timestamp 3.
//counter.hit(3);
//
//// get hits at timestamp 4, should return 3.
//counter.getHits(4);
//
//// hit at timestamp 300.
//counter.hit(300);
//
//// get hits at timestamp 300, should return 4.
//counter.getHits(300);
//
//// get hits at timestamp 301, should return 3.
//counter.getHits(301);
//Follow up:
//What if the number of hits per second could be very large? Does your design scale?
//

// 返回过去5分钟内的hits的次数

import Foundation

class Num362 {
  // MARK: - Use bucket
  // https://leetcode.com/problems/design-hit-counter/discuss/83483/Super-easy-design-O(1)-hit()-O(s)-getHits()-no-fancy-data-structure-is-needed!

  class HitCounter_Bucket {

    // hits and timestamps have 300 size, like a circular array

    // stores the hit count for an index
    var hits: [Int]
    // stores the time stamps for an index (index is the timestamp % 300)
    var timestamps: [Int]

    /** Initialize your data structure here. */
    init() {
      hits = Array(repeating: 0, count: 300)
      timestamps = Array(repeating: 0, count: 300)
    }

    /** Record a hit.
     @param timestamp - The current timestamp (in seconds granularity). */
    func hit(_ timestamp: Int) {
      let index = timestamp % 300
      if timestamps[index] != timestamp {
        // if the timestamp at the index is not the same, this means a new cycle
        // needs to reset the hits count to 1
        timestamps[index] = timestamp
        hits[index] = 1
      }
      else {
        // if the timestamp is the same, we know this is duplicated hits at the same time
        hits[index] += 1
      }
    }

    /** Return the number of hits in the past 5 minutes.
     @param timestamp - The current timestamp (in seconds granularity). */
    func getHits(_ timestamp: Int) -> Int {
      var count = 0
      for i in 0..<300 {
        // if the interval is within 300
        if timestamp - timestamps[i] < 300 {
          count += hits[i]
        }
      }
      return count
    }
  }

  // MARK: - Naive solution, use an array to store timestamps (use as a queue)
  class HitCounter {

    // stores the hit timestamp
    var hits: [Int] = []
    /** Initialize your data structure here. */
    init() {

    }

    /** Record a hit.
     @param timestamp - The current timestamp (in seconds granularity). */
    func hit(_ timestamp: Int) {
      hits.append(timestamp)
    }

    /** Return the number of hits in the past 5 minutes.
     @param timestamp - The current timestamp (in seconds granularity). */
    func getHits(_ timestamp: Int) -> Int {
      var count = 0
      for h in hits.reversed() {
        // 300
        if h > timestamp - 300 {
          count += 1
        }
      }
      return count
    }
  }

  /**
   * Your HitCounter object will be instantiated and called as such:
   * let obj = HitCounter()
   * obj.hit(timestamp)
   * let ret_2: Int = obj.getHits(timestamp)
   */
}
