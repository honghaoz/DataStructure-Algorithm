// 581_Shortest Unsorted Continuous Subarray
// https://leetcode.com/problems/shortest-unsorted-continuous-subarray/
//
// Created by Honghao Zhang on 10/27/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given an integer array, you need to find one continuous subarray that if you only sort this subarray in ascending order, then the whole array will be sorted in ascending order, too.
//
//You need to find the shortest such subarray and output its length.
//
//Example 1:
//
//Input: [2, 6, 4, 8, 10, 9, 15]
//Output: 5
//Explanation: You need to sort [6, 4, 8, 10, 9] in ascending order to make the whole array sorted in ascending order.
//Note:
//
//Then length of the input array is in range [1, 10,000].
//The input array may contain duplicates, so ascending order here means <=.
//

import Foundation

class Num581 {
  // MARK: - Sort and compare
  func findUnsortedSubarray(_ nums: [Int]) -> Int {
    let sorted = nums.sorted()
    var l = nums.count - 1 // the first index that nums are different
    var r = 0 // the last index that nums are different
    for i in 0..<nums.count {
      if nums[i] != sorted[i] {
        l = min(l, i)
        r = max(r, i)
      }
    }
    if r > l {
      return r - l + 1
    }
    else {
      return 0
    }
  }

  // MARK: - Using stack
  // 因为这是找一个unsorted subarray
  // 那么就是要找这个subarray的最小值和最大值。
  // 然后开始值就是这个array中刚刚比最小值小的那个点
  // 终止值就是这个array中刚刚比最大值大的那个点
  //
  // 找最小值的时候，考虑用一个stack来记录上升曲线，当出现下降曲线时，pop stack，直到stack的top刚好比当前值小
  // 进行这个过程，直到结束，记录这个过程中最小的index，这个就是初始index
  // func findUnsortedSubarray(_ nums: [Int]) -> Int {
  //     var stack: [Int] = []
  // }

  // https://leetcode.com/problems/shortest-unsorted-continuous-subarray/solution/
}
