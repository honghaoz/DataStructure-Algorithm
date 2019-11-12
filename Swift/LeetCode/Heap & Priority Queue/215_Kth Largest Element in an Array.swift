// 215_Kth Largest Element in an Array
// https://leetcode.com/problems/kth-largest-element-in-an-array/
//
// Created by Honghao Zhang on 11/8/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Find the kth largest element in an unsorted array. Note that it is the kth largest element in the sorted order, not the kth distinct element.
//
//Example 1:
//
//Input: [3,2,1,5,6,4] and k = 2
//Output: 5
//Example 2:
//
//Input: [3,2,3,1,2,4,5,5,6] and k = 4
//Output: 4
//Note:
//You may assume k is always valid, 1 ≤ k ≤ array's length.
//

// 找到第K大的元素

import Foundation

class Num215 {
  // MARK: - Quick Select
  // TODO:

  // MARK: - Heap
  // TODO:
  
  // MARK: - Sort and return the Kth
  // n lg n
  func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
      return nums.sorted()[nums.count - k]
  }
}
