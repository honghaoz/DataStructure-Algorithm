// 986_Interval List Intersections
// https://leetcode.com/problems/interval-list-intersections/
//
// Created by Honghao Zhang on 10/20/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given two lists of closed intervals, each list of intervals is pairwise disjoint and in sorted order.
//
//Return the intersection of these two interval lists.
//
//(Formally, a closed interval [a, b] (with a <= b) denotes the set of real numbers x with a <= x <= b.  The intersection of two closed intervals is a set of real numbers that is either empty, or can be represented as a closed interval.  For example, the intersection of [1, 3] and [2, 4] is [2, 3].)
//
//
//
//Example 1:
//
//
//
//Input: A = [[0,2],[5,10],[13,23],[24,25]], B = [[1,5],[8,12],[15,24],[25,26]]
//Output: [[1,2],[5,5],[8,10],[15,23],[24,24],[25,25]]
//Reminder: The inputs and the desired output are lists of Interval objects, and not arrays or lists.
//
//
//Note:
//
//0 <= A.length < 1000
//0 <= B.length < 1000
//0 <= A[i].start, A[i].end, B[i].start, B[i].end < 10^9
//NOTE: input types have been changed on April 15, 2019. Please reset to default code definition to get new method signature.
//

// 找出两个区间重合的部分

import Foundation

class Num986 {
  // Use 2 pointers
  // Move the point which has the smaller end time
  func intervalIntersection(_ A: [[Int]], _ B: [[Int]]) -> [[Int]] {
    var result: [[Int]] = []
    var i = 0
    var j = 0
    
    while i < A.count, j < B.count {
      let start = max(A[i][0], B[j][0])
      let end = min(A[i][1], B[j][1])
      
      // Must check if start < end
      // For cases two time interval doesn't overlap, the start > end
      if start <= end {
        result.append([start, end])
      }
      
      // Move the one which has smaller end time
      if A[i][1] < B[j][1] {
        i += 1
      }
      else {
        j += 1
      }
    }
    
    return result
  }
}
