// 349. Intersection of Two Arrays
// https://leetcode.com/problems/intersection-of-two-arrays/
//
// Given two arrays, write a function to compute their intersection.
//
// Example 1:
//
//   Input: nums1 = [1,2,2,1], nums2 = [2,2]
//   Output: [2]
//
// Example 2:
//
//   Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
//   Output: [9,4]
//   Note:
//
// Each element in the result must be unique.
// The result can be in any order.

// 给出两个数组（含重复的数字），找出都出现的数字

import Foundation

class Num349_IntersectionOfTwoArrays: Solution {
  // MARK: - Use the Foundation API
  func setIntersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    return Array(Set(nums1).intersection(Set(nums2)))
  }

  // MARK: - Use two sets
  func intersection_twoSets(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    let set1 = Set(nums1)
    var resultSet = Set<Int>()
    for n in nums2 {
      if set1.contains(n) {
        resultSet.insert(n)
      }
    }
    return Array(resultSet)
  }

  // MARK: - Use a dictionary to set up a keys record, check against with num2
  func dictionaryCheck(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var result = Set<Int>()
    let nums1Dict = Dictionary(nums1.map { ($0, 1) }, uniquingKeysWith: +)
    for n in nums2 {
      if nums1Dict[n] != nil {
        result.insert(n)
      }
    }
    return Array(result)
  }

  // MARK: - 2 for-loops, if same, insert to a set.
  func twoForLoops(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var results = Set<Int>()
    for num1 in nums1 {
      for num2 in nums2 {
        if num1 == num2 {
          results.insert(num1)
        }
      }
    }

    return Array(results)
  }

  func test() {
    // [], [] -> []
    assert(setIntersection([], []) == [])
    // [], [1] -> []
    assert(setIntersection([], [1]) == [])
    // [1], [2] -> []
    assert(setIntersection([1], [2]) == [])
    // [1], [1] -> [1]
    assert(setIntersection([1], [1]) == [1])
    // [1, 2], [2] -> [2]
    assert(setIntersection([1, 2], [2]) == [2])
    // [1, 2, 2, 1], [2, 2] -> [2]
    assert(setIntersection([1, 2, 2, 1], [2, 2]) == [2])

    // [], [] -> []
    assert(setIntersection([], []) == [])
    // [], [1] -> []
    assert(setIntersection([], [1]) == [])
    // [1], [2] -> []
    assert(setIntersection([1], [2]) == [])
    // [1], [1] -> [1]
    assert(setIntersection([1], [1]) == [1])
    // [1, 2], [2] -> [2]
    assert(setIntersection([1, 2], [2]) == [2])
    // [1, 2, 2, 1], [2, 2] -> [2]
    assert(setIntersection([1, 2, 2, 1], [2, 2]) == [2])
  }
}
