// 915_Partition Array into Disjoint Intervals
// https://leetcode.com/problems/partition-array-into-disjoint-intervals/
//
// Created by Honghao Zhang on 10/5/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
//
// Given an array A, partition it into two (contiguous) subarrays left and right so that:
//
//Every element in left is less than or equal to every element in right.
//left and right are non-empty.
//left has the smallest possible size.
//Return the length of left after such a partitioning.  It is guaranteed that such a partitioning exists.
//
//
//
//Example 1:
//
//Input: [5,0,3,8,6]
//Output: 3
//Explanation: left = [5,0,3], right = [8,6]
//Example 2:
//
//Input: [1,1,1,0,6,12]
//Output: 4
//Explanation: left = [1,1,1,0], right = [6,12]
//
//
//Note:
//
//2 <= A.length <= 30000
//0 <= A[i] <= 10^6
//It is guaranteed there is at least one way to partition A as described.
//

// 寻找一个dividing line，左边的所有元素<=右边的所有元素
// 找到一个缝隙，使左边的元素都 <= 右边的元素

import Foundation

class Num915 {
  // 看左向右扫描，保留最大值（左边数组保留最大值）
  // 看右向左扫描，保留最小值（右边数组保留最小值）
  // 然后再从左到右扫描，寻找第一个符合条件的point
  func partitionDisjoint(_ A: [Int]) -> Int {
    // stores the max element from 0...index
    var leftMax: [Int] = Array(repeating: Int.min, count: A.count)
    // stores the min element from index..<count
    var rightMin: [Int] = Array(repeating: Int.max, count: A.count)

    var _leftMax = Int.min
    for i in 0..<A.count {
      _leftMax = max(_leftMax, A[i])
      leftMax[i] = _leftMax
    }

    var _rightMin = Int.max
    for i in (0..<A.count).reversed() {
      _rightMin = min(_rightMin, A[i])
      rightMin[i] = _rightMin
    }

    // find the break point
    for i in 0..<(A.count - 1) {
      // left is 0...i
      if leftMax[i] <= rightMin[i + 1] {
        return i + 1
      }
    }
    assertionFailure()
    return A.count
  }
}
