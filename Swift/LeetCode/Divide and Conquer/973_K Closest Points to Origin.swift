// 973_K Closest Points to Origin
// https://leetcode.com/problems/k-closest-points-to-origin
//
// Created by Honghao Zhang on 10/20/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// We have a list of points on the plane.  Find the K closest points to the origin (0, 0).
//
//(Here, the distance between two points on a plane is the Euclidean distance.)
//
//You may return the answer in any order.  The answer is guaranteed to be unique (except for the order that it is in.)
//
//
//
//Example 1:
//
//Input: points = [[1,3],[-2,2]], K = 1
//Output: [[-2,2]]
//Explanation:
//The distance between (1, 3) and the origin is sqrt(10).
//The distance between (-2, 2) and the origin is sqrt(8).
//Since sqrt(8) < sqrt(10), (-2, 2) is closer to the origin.
//We only want the closest K = 1 points from the origin, so the answer is just [[-2,2]].
//Example 2:
//
//Input: points = [[3,3],[5,-1],[-2,4]], K = 2
//Output: [[3,3],[-2,4]]
//(The answer [[-2,4],[3,3]] would also be accepted.)
//
//
//Note:
//
//1 <= K <= points.length <= 10000
//-10000 < points[i][0] < 10000
//-10000 < points[i][1] < 10000
//

// 找出离(0, 0)点最近的K个点

import Foundation

class Num973 {
  // MARK: - Just sort for the first K elements
  // Then return the first K
  // TODO: 实现一遍partition！！！
  // https://leetcode.com/problems/k-closest-points-to-origin/discuss/367728/swift-quick-select

  /// Get the distance squared ( to the second power)
  private func distance(_ point: [Int]) -> Int {
    return point[0] * point[0] + point[1] * point[1]
  }

  // MARK: - Sort and return the first K
  // O(n lg n)
  // There's extra work for elements in range K... No need to sort them
  func kClosest_sort(_ points: [[Int]], _ K: Int) -> [[Int]] {
    let sorted = points.sorted(by: { (p1: [Int], p2: [Int]) -> Bool in
      return (p1[0] * p1[0] + p1[1] * p1[1]) < (p2[0] * p2[0] + p2[1] * p2[1])
    }).prefix(K)

    return Array(sorted)
  }
}
