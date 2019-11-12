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

// 找出两个sorted array中的median
// 实际上把题目转换成找出两个array的kth largest value

import Foundation

class Num4 {
  // MARK: - Find the Kth largest
  // https://www.jiuzhang.com/solution/median-of-two-sorted-arrays
//  public class Solution {
//      public double findMedianSortedArrays(int A[], int B[]) {
//          int n = A.length + B.length;
//
//          if (n % 2 == 0) {
//              return (
//                  findKth(A, 0, B, 0, n / 2) +
//                  findKth(A, 0, B, 0, n / 2 + 1)
//              ) / 2.0;
//          }
//
//          return findKth(A, 0, B, 0, n / 2 + 1);
//      }
//
//      // find kth number of two sorted array
//      public static int findKth(int[] A, int startOfA,
//                                int[] B, int startOfB,
//                                int k){
//          if (startOfA >= A.length) {
//              return B[startOfB + k - 1];
//          }
//          if (startOfB >= B.length) {
//              return A[startOfA + k - 1];
//          }
//
//          if (k == 1) {
//              return Math.min(A[startOfA], B[startOfB]);
//          }
//
//          int halfKthOfA = startOfA + k / 2 - 1 < A.length
//              ? A[startOfA + k / 2 - 1]
//              : Integer.MAX_VALUE;
//          int halfKthOfB = startOfB + k / 2 - 1 < B.length
//              ? B[startOfB + k / 2 - 1]
//              : Integer.MAX_VALUE;
//
//          if (halfKthOfA < halfKthOfB) {
//              return findKth(A, startOfA + k / 2, B, startOfB, k - k / 2);
//          } else {
//              return findKth(A, startOfA, B, startOfB + k / 2, k - k / 2);
//          }
//      }
//  }

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

  // MARK: - Find the median number
  func medianOfSortedArrays(_ array1: [Int], _ array2: [Int]) -> Int? {
    if array1.isEmpty, array2.isEmpty {
      return nil
    }
    else if array1.isEmpty {
      return array2[array2.count / 2]
    }
    else if array2.isEmpty {
      return array1[array1.count / 2]
    }

    var index1 = 0
    var index2 = 0
    // 1
    // 2 3 4

    // 4
    // 1 3 5 7 9
    // 2 4 6 8  // 9 - >4
    //
    // 1 3 5 7
    // 2 4 6 8 // 8 -> 4
    var dropCount = (array1.count + array2.count) / 2
    while dropCount > 0 {
      if array1[index1] < array2[index2] {
        index1 += 1
        if index1 >= array1.count {
          return array2[index2 + dropCount - 1]
        }
      }
      else {
        index2 += 1
        if index2 >= array2.count {
          return array1[index1 + dropCount - 1]
        }
      }
      dropCount -= 1
    }

    if index1 < array1.count, index2 < array2.count {
      return min(array1[index1], array2[index2])
    }
    else if index1 >= array1.count {
      return array2[index2]
    }
    else {
      return array1[index1]
    }
  }
}
