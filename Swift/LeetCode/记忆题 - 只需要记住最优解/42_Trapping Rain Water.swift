// 42_Trapping Rain Water
// https://leetcode.com/problems/trapping-rain-water/
//
// Created by Honghao Zhang on 11/5/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it is able to trap after raining.
//
//
//The above elevation map is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. In this case, 6 units of rain water (blue section) are being trapped. Thanks Marcos for contributing this image!
//
//Example:
//
//Input: [0,1,0,2,1,0,1,3,2,1,2,1]
//Output: 6
//

// 给出一堆bar的高度，求出能装起来的水的量

import Foundation

class Num42 {
  // MARK: - 从左向右投影，从右向左投影，然后求投影相交的面积
  func trap(_ height: [Int]) -> Int {
    guard height.count >= 3 else {
      return 0
    }

    // stores the highest height looking to the left
    var leftMaxHeight: [Int] = Array(repeating: 0, count: height.count)
    leftMaxHeight[0] = height[0]
    for i in 1..<height.count {
      leftMaxHeight[i] = max(height[i], leftMaxHeight[i - 1])
    }

    var rightMaxHeight: [Int] = Array(repeating: 0, count: height.count)
    rightMaxHeight[height.count - 1] = height[height.count - 1]
    for i in (0..<height.count - 1).reversed() {
      rightMaxHeight[i] = max(height[i], rightMaxHeight[i + 1])
    }

    var answer: Int = 0
    for i in 1..<height.count - 1 {
      answer += min(leftMaxHeight[i], rightMaxHeight[i]) - height[i]
    }
    return answer
  }
}
