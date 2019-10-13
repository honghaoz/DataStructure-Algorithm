// 11_Container With Most Water
// https://leetcode.com/problems/container-with-most-water/
//
// Created by Honghao Zhang on 10/3/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given n non-negative integers a1, a2, ..., an , where each represents a point at coordinate (i, ai). n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0). Find two lines, which together with x-axis forms a container, such that the container contains the most water.
//
//Note: You may not slant the container and n is at least 2.
//
//
//
//
//
//The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section) the container can contain is 49.
//
//
//
//Example:
//
//Input: [1,8,6,2,5,4,8,3,7]
//Output: 49
//

// 中等题，需要记住解决方法是用2 pointer，从两边夹逼，选小的的那边开始夹。
// Tags: 双指针
// 当两个柱子一样高的时候，为什么随便选：https://leetcode.wang/leetCode-11-Container-With-Most-Water.html

import Foundation

class Num11 {
  /// 脑筋急转弯题目
  /// 记忆类题目，你知道答案，那么你就知道答案。
  /// https://leetcode.wang/leetCode-11-Container-With-Most-Water.html
  func maxArea(_ height: [Int]) -> Int {
    guard height.count > 0 else {
      return 0
    }

    // two pointers
    var i = 0
    var j = height.count - 1

    // result
    var maxArea = 0
    while i < j {
      maxArea = max(maxArea, (j - i) * min(height[i], height[j]))
      if height[i] > height[j] {
        j -= 1
      }
      else {
        i += 1
      }
    }

    return maxArea
  }
}
