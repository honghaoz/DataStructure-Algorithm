// 406_Queue Reconstruction by Height
// https://leetcode.com/problems/queue-reconstruction-by-height/
//
// Created by Honghao Zhang on 11/11/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Suppose you have a random list of people standing in a queue. Each person is described by a pair of integers (h, k), where h is the height of the person and k is the number of people in front of this person who have a height greater than or equal to h. Write an algorithm to reconstruct the queue.
//
//Note:
//The number of people is less than 1,100.
//
//
//Example
//
//Input:
//[[7,0], [4,4], [7,1], [5,0], [6,1], [5,2]]
//
//Output:
//[[5,0], [7,0], [5,2], [6,1], [4,4], [7,1]]
//

// 给出一堆人，第一个数字是这个人的高度。第二个数字是前面有多少个人比我高或者相等
// 要求把这个queue按规则sort好

import Foundation

class Num406 {
  // MARK: - Greedy
  // 先sort by height then position
  // 然后按照p的位置来insert到新的array
  func reconstructQueue(_ people: [[Int]]) -> [[Int]] {
    let sortedByHeightThenPosition = people.sorted {
      if $0[0] == $1[0] {
        return $0[1] < $1[1]
      }
      else {
        return $0[0] > $1[0]
      }
    }

    var queue: [[Int]] = []
    for p in sortedByHeightThenPosition {
      queue.insert(p, at: p[1])
    }
    return queue
  }
}
