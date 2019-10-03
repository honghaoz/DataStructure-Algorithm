// 84_Largest Rectangle in Histogram
// https://leetcode.com/problems/largest-rectangle-in-histogram/
//
// Created by Honghao Zhang on 9/23/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given n non-negative integers representing the histogram's bar height where the width of each bar is 1, find the area of largest rectangle in the histogram.
//
//
//
//
//Above is a histogram where width of each bar is 1, given height = [2,1,5,6,2,3].
//
//
//
//
//The largest rectangle is shown in the shaded area, which has area = 10 unit.
//
//
//
//Example:
//
//Input: [2,1,5,6,2,3]
//Output: 10
//

import Foundation

class Num84 {

  

  // DP, O(n^2)
  // Can be optimized to O(n):
  // https://leetcode.com/problems/largest-rectangle-in-histogram/discuss/28902/5ms-O(n)-Java-solution-explained-(beats-96)/248504
  func largestRectangleArea(_ heights: [Int]) -> Int {
    // use two states
    // one for max area ends at the index: i, the height is the heights[i]
    // another for max area starts at the index: i.
    //
    // the max area is the the one combine to left and to right
    // Use 2 passes to find the max area

    guard heights.count > 0 else {
      return 0
    }

    let areaToLeft = largestRectangleAreaToLeft(heights)
    let areaToRight = Array(largestRectangleAreaToLeft(heights.reversed()).reversed())

    var maxArea: Int = 0
    for i in 0..<areaToLeft.count {
      let area = areaToLeft[i] + areaToRight[i] - heights[i]
      maxArea = max(maxArea, area)
    }
    return maxArea
  }

  /// Find the max rect area ends at each index (to left)
  private func largestRectangleAreaToLeft(_ heights: [Int]) -> [Int] {
    guard heights.count > 0 else {
      return []
    }
    var maxAreaToLeft: [Int] = Array(repeating: 0, count: heights.count)
    maxAreaToLeft[0] = heights[0]

    // maxAreaToLeft[i] =
    // if height[i - 1] == height[i]: maxAreaToLeft[i - 1] + height[i]
    // if height[i - 1] < height[i]: height[i]
    // if height[i - 1] > height[i]: find the left most j where height[j] < height[i], j in [0..<i]
    //                               (i - j) * height[i]
    for i in 1..<heights.count {
      if heights[i - 1] < heights[i] {
        maxAreaToLeft[i] = heights[i]
      }
      else if heights[i - 1] > heights[i] {
        // find the left most j where height[j] < height[i]
        var j = i - 1
        while j >= 0, heights[j] >= heights[i] {
          j -= 1
        }

        maxAreaToLeft[i] = (i - j) * heights[i]
      }
      else {
        maxAreaToLeft[i] = maxAreaToLeft[i - 1] + heights[i]
      }
    }

    return maxAreaToLeft
  }
}
