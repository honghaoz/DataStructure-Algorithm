// 88_Merge Sorted Array
// https://leetcode.com/problems/merge-sorted-array/
//
// Created by Honghao Zhang on 10/4/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given two sorted integer arrays nums1 and nums2, merge nums2 into nums1 as one sorted array.
//
//Note:
//
//The number of elements initialized in nums1 and nums2 are m and n respectively.
//You may assume that nums1 has enough space (size that is greater or equal to m + n) to hold additional elements from nums2.
//Example:
//
//Input:
//nums1 = [1,2,3,0,0,0], m = 3
//nums2 = [2,5,6],       n = 3
//
//Output: [1,2,2,3,5,6]
//

// 简单题，需要记住最优解是从右到左merge
// Tags: 双指针

import Foundation

class Num88 {
  // Merge 2 sorted array from the right, use 2 pointers.
  // 为了避免整体数组的移动，我们从大到小merge
  func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    // the index to insert for the largest number.
    var p = m + n - 1
    var p1 = m - 1
    var p2 = n - 1
    while p1 >= 0 && p2 >= 0 {
      if nums1[p1] < nums2[p2] {
        // insert nums2[b]
        nums1[p] = nums2[p2]
        p2 -= 1
      }
      else {
        nums1[p] = nums1[p1]
        p1 -= 1
      }
      p -= 1
    }
    // copy nums2 if needed
    while p2 >= 0 {
      nums1[p] = nums2[p2]
      p2 -= 1
      p -= 1
    }
  }
}
