// 912_Sort an Array
// https://leetcode.com/problems/sort-an-array/
//
// Created by Honghao Zhang on 10/20/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given an array of integers nums, sort the array in ascending order.
//
//
//
//Example 1:
//
//Input: [5,2,3,1]
//Output: [1,2,3,5]
//Example 2:
//
//Input: [5,1,1,2,0,0]
//Output: [0,0,1,1,2,5]
//
//
//Note:
//
//1 <= A.length <= 10000
//-50000 <= A[i] <= 50000
//

// 写排序算法

import Foundation

class Num912 {
  // 各种排序算法的实现

  // MARK: - Quick Sort
  // https://leetcode.com/problems/sort-an-array/discuss/280453/Swift-quick-sort
  func sortArray(_ nums: [Int]) -> [Int] {
    var arr = nums
    quickSort(&arr, 0, arr.count - 1)
    return arr
  }

  private func quickSort(_ nums: inout [Int], _ left: Int, _ right: Int) {
    guard left < right else {
      return
    }
    let pivot = nums[left + (right - left) / 2]
    let pivotIndex = partition(&nums, left, right, pivot)
    quickSort(&nums, left, pivotIndex - 1)
    quickSort(&nums, pivotIndex, right)
  }

  /// Quick sort, l <= r, compare pivot: < and >
  private func partition(_ nums: inout [Int], _ left: Int, _ right: Int, _ pivot: Int) -> Int {
    var l = left
    var r = right
    while l <= r {
      while l <= r, nums[l] < pivot {
        l += 1
      }
      while l <= r, nums[r] > pivot {
        r -= 1
      }
      
      if l <= r {
        // swap
        (nums[l], nums[r]) = (nums[r], nums[l])

        l += 1
        r -= 1
      }
    }
    return l
  }

  // https://leetcode.com/problems/sort-an-array/discuss/306250/Swift-Using-Quicksort
  func quickSort_easyToRead(_ nums: [Int]) -> [Int] {
    guard nums.count > 0 else {
      return []
    }

    let pivot = nums[nums.count / 2]
    let smaller = nums.filter { $0 < pivot }
    let equal = nums.filter { $0 == pivot }
    let bigger = nums.filter { $0 > pivot }

    return quickSort_easyToRead(smaller) + equal + quickSort_easyToRead(bigger)
  }
}
