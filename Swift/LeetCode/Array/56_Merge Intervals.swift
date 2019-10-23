// 56_Merge Intervals
// https://leetcode.com/problems/merge-intervals/
//
// Created by Honghao Zhang on 10/23/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a collection of intervals, merge all overlapping intervals.
//
//Example 1:
//
//Input: [[1,3],[2,6],[8,10],[15,18]]
//Output: [[1,6],[8,10],[15,18]]
//Explanation: Since intervals [1,3] and [2,6] overlaps, merge them into [1,6].
//Example 2:
//
//Input: [[1,4],[4,5]]
//Output: [[1,5]]
//Explanation: Intervals [1,4] and [4,5] are considered overlapping.
//NOTE: input types have been changed on April 15, 2019. Please reset to default code definition to get new method signature.
//

// 给出一些interval，类似meeting时间
// 求合并overlaps的时间段

import Foundation

class Num56 {
  // MARK: - Sort by start time then iterate
  func merge(_ intervals: [[Int]]) -> [[Int]] {
    // sort by start time
    let sorted = intervals.sorted {
      $0[0] < $1[0]
    }
    
    var merged: [[Int]] = []
    for i in sorted {
      if merged.isEmpty {
        merged.append(i)
      }
      else {
        let lastInterval = merged.last!
        // if the current interval starts before the end time
        // of merged last interval, overlaps, should merge
        if i[0] <= lastInterval[1] {
          merged.removeLast()
          merged.append([lastInterval[0], max(lastInterval[1], i[1])])
        }
        else {
          merged.append(i)
        }
      }
    }
    
    return merged
  }
}
