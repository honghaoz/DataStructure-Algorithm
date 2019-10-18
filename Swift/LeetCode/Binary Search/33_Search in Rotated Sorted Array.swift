// 33_Search in Rotated Sorted Array
// https://leetcode.com/problems/search-in-rotated-sorted-array/
//
// Created by Honghao Zhang on 9/16/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
//
//(i.e., [0,1,2,4,5,6,7] might become [4,5,6,7,0,1,2]).
//
//You are given a target value to search. If found in the array return its index, otherwise return -1.
//
//You may assume no duplicate exists in the array.
//
//Your algorithm's runtime complexity must be in the order of O(log n).
//
//Example 1:
//
//Input: nums = [4,5,6,7,0,1,2], target = 0
//Output: 4
//Example 2:
//
//Input: nums = [4,5,6,7,0,1,2], target = 3
//Output: -1
//

// 在一个rotated sorted array中找数字

import Foundation

class Num33 {
  // MARK: - Binary search
  // 切除可以确认丢掉的那半边
  func search2(_ nums: [Int], _ target: Int) -> Int {
    guard nums.count > 0 else { return -1 }
    var start = 0
    var end = nums.count - 1
    while start + 1 < end {
      let mid = start + (end - start) / 2
      if nums[mid] == target {
        return mid
      }

      // Cut first part
      if nums[start] < nums[mid] {
        if nums[start] <= target && target <= nums[mid] {
          // 可以确保target在左区间
          end = mid
        }
        else {
          // 剩下的情况不细分
          start = mid
        }
      }
        // Cut second part
      else {
        if nums[mid] <= target && target <= nums[end] {
          start = mid
        }
        else {
          end = mid
        }
      }
    }

    if nums[start] == target {
      return start
    }

    if nums[end] == target {
      return end
    }

    return -1
  }

  // Binary search
  func search(_ nums: [Int], _ target: Int) -> Int {
    guard nums.count > 0 else { return -1 }
    var start = 0
    var end = nums.count - 1
    if nums[0] < nums[nums.count - 1] {
      // normal sorted array
      while start + 1 < end {
        let mid = start + (end - start) / 2
        if nums[mid] < target {
          start = mid
        }
        else if nums[mid] > target {
          end = mid
        }
        else {
          return mid
        }
      }
      if nums[start] == target {
        return start
      }
      else if nums[end] == target {
        return end
      }
      else {
        return -1
      }
    }
    else if nums[0] > nums[nums.count - 1] {
      // rotated sorted array
      if target >= nums[0] {
        // target is on the left part
        while start + 1 < end {
          let mid = start + (end - start) / 2
          if nums[mid] < nums[start] {
            // mid is on the right part, should move end
            end = mid
          }
          else {
            // mid is on the left part, should compare with the target
            if nums[mid] < target {
              start = mid
            }
            else if nums[mid] > target {
              end = mid
            }
            else {
              return mid
            }
          }
        }
        if nums[start] == target {
          return start
        }
        else if nums[end] == target {
          return end
        }
        else {
          return -1
        }
      }
      else {
        // target is on the right part
        while start + 1 < end {
          let mid = start + (end - start) / 2
          if nums[mid] > nums[end] {
            // mid is on the left part, should move start
            start = mid
          }
          else {
            // mid is on the right part, compare with the target
            if nums[mid] < target {
              start = mid
            }
            else if nums[mid] > target {
              end = mid
            }
            else {
              return mid
            }
          }
        }
        if nums[start] == target {
          return start
        }
        else if nums[end] == target {
          return end
        }
        else {
          return -1
        }
      }
    }
    // only 1 element
    if nums[0] == target {
      return 0
    } else {
      return -1
    }

  }

  /// From the old file:

  // [ )
  // func search(_ nums: [Int], _ target: Int) -> Int {
  //     guard nums.count > 0 else { return -1 }
  //     var start = 0
  //     var end = nums.count
  //     while start != end {
  //         var mid = start + (end - start) / 2
  //         if nums[mid] == target {
  //             return mid
  //         }
  //         if nums[start] <= nums[mid] {
  //             if nums[start] <= target && target < nums[mid] {
  //                 end = mid
  //             }
  //             else {
  //                 start = mid + 1
  //             }
  //         }
  //         else {
  //             if nums[mid] < target && target <= nums[end - 1] {
  //                 start = mid + 1
  //             }
  //             else {
  //                 end = mid
  //             }
  //         }
  //     }

  //     return -1
  // }

  // [ ]
}
