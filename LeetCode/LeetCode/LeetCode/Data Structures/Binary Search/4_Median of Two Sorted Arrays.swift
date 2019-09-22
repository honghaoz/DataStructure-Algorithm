// 4_Median of Two Sorted Arrays
// https://leetcode.com/problems/median-of-two-sorted-arrays/
//
// Created by Honghao Zhang on 9/16/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// There are two sorted arrays nums1 and nums2 of size m and n respectively.
//
//Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).
//
//You may assume nums1 and nums2 cannot be both empty.
//
//Example 1:
//
//nums1 = [1, 3]
//nums2 = [2]
//
//The median is 2.0
//Example 2:
//
//nums1 = [1, 2]
//nums2 = [3, 4]
//
//The median is (2 + 3)/2 = 2.5
//

import Foundation

class Num4 {
  // O(lg(m + n) solution: https://medium.com/@hazemu/finding-the-median-of-2-sorted-arrays-in-logarithmic-time-1d3f2ecbeb46
  
  // O(m + n) solution
  // Merge two arrays and find the median of the merged array.
  func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    var nums = [Int]()
    var p1 = 0
    var p2 = 0
    while p1 < nums1.count, p2 < nums2.count {
      let num1 = nums1[p1]
      let num2 = nums2[p2]
      if num1 <= num2 {
        nums.append(num1)
        p1 += 1
      }
      else if num1 > num2 {
        nums.append(num2)
        p2 += 1
      }
    }
    while p1 < nums1.count {
      nums.append(nums1[p1])
      p1 += 1
    }
    while p2 < nums2.count {
      nums.append(nums2[p2])
      p2 += 1
    }

    guard nums.count > 0 else { return 0 }

    // [1, 2, 3, 4]
    if nums.count % 2 == 0 {
      let mid = nums.count / 2
      return (Double(nums[mid]) + Double(nums[mid - 1])) / 2
    }
    // [1, 2, 3]
    else {
      return Double(nums[nums.count / 2])
    }
  }
}
