// 347_Top K Frequent Elements
// https://leetcode.com/problems/top-k-frequent-elements/
//
// Created by Honghao Zhang on 10/29/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a non-empty array of integers, return the k most frequent elements.
//
//Example 1:
//
//Input: nums = [1,1,1,2,2,3], k = 2
//Output: [1,2]
//Example 2:
//
//Input: nums = [1], k = 1
//Output: [1]
//Note:
//
//You may assume k is always valid, 1 ≤ k ≤ number of unique elements.
//Your algorithm's time complexity must be better than O(n log n), where n is the array's size.
//

// 取出出现次数最多的K个元素

import Foundation

class Num347 {
  // MARK: - 统计num count然后用max heap取出
  func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    var numCount: [Int: Int] = [:]
    for n in nums {
      numCount[n] = numCount[n, default: 0] + 1
    }
    let numCountTuples = numCount.map {
      ($0.key, $0.value)
    }

    var heap = Heap(array: numCountTuples, sort: {
      $0.1 > $1.1
    })
    var answer: [Int] = []
    for _ in 0..<k {
      if let top = heap.remove() {
        answer.append(top.0)
      }
    }
    return answer
  }
}
