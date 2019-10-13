// 350. Intersection of Two Arrays II
// https://leetcode.com/problems/intersection-of-two-arrays-ii/
// 
// Given two arrays, write a function to compute their intersection.
// Example:
// Given nums1 = [1, 2, 2, 1], nums2 = [2, 2], return [2, 2].
//
// Note:
// Each element in the result should appear as many times as it shows in both arrays.
// The result can be in any order.
// Follow up:
// What if the given array is already sorted? How would you optimize your algorithm?
// What if nums1's size is small compared to nums2's size? Which algorithm is better?
// What if elements of nums2 are stored on disk, and the memory is limited such that you cannot load all elements into the memory at once?

import Foundation

class Num350_IntersectionOfTwoArraysII: Solution {
  /// Straightforward solution, two loops, if equal, record and remove.
  func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var mutableNums1 = nums1
    var mutableNums2 = nums2
    var results: [Int] = []

    var i = 0
    while i < mutableNums1.count {
      for j in 0 ..< mutableNums2.count {
        if mutableNums1[i] == mutableNums2[j] {
          results.append(mutableNums1[i])
          mutableNums1.remove(at: i)
          mutableNums2.remove(at: j)
          i -= 1
          break
        }
      }
      i += 1
    }

    return results
  }

  /// Sort and use two pointers
  func sorted(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    let nums1 = nums1.sorted()
    let nums2 = nums2.sorted()
    var i = 0
    var j = 0
    var res: [Int] = []
    while i < nums1.count, j < nums2.count {
      if nums1[i] < nums2[j] {
        i += 1
        continue
      } else if nums1[i] > nums2[j] {
        j += 1
        continue
      } else {
        res.append(nums1[i])
        i += 1
        j += 1
      }
    }
    return res
  }

  /// Record nums1 frequency, check nums2 and record result.
  func dict(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var nums1Dict: [Int: Int] = [:]
    for n in nums1 {
      if let count = nums1Dict[n] {
        nums1Dict[n] = count + 1
      } else {
        nums1Dict[n] = 1
      }
    }
    var res: [Int] = []
    for n in nums2 {
      if let count = nums1Dict[n] {
        res.append(n)
        if count - 1 == 0 {
          nums1Dict.removeValue(forKey: n)
        } else {
          nums1Dict[n] = count - 1
        }
      }
    }
    return res
  }

  func test() {
    // [], [] -> []
    assert(intersection([], []) == [])
    // [], [1] -> []
    assert(intersection([], [1]) == [])
    // [1], [2] -> []
    assert(intersection([1], [2]) == [])
    // [1], [1] -> [1]
    assert(intersection([1], [1]) == [1])
    // [1, 2], [2] -> [2]
    assert(intersection([1, 2], [2]) == [2])
    // [1, 2, 2, 1], [2, 2] -> [2]
    assert(intersection([1, 2, 2, 1], [2, 2]) == [2, 2])

    // [], [] -> []
    //		assert(intersection2([], []) == [])
    //		// [], [1] -> []
    //		assert(intersection2([], [1]) == [])
    //		// [1], [2] -> []
    //		assert(intersection2([1], [2]) == [])
    //		// [1], [1] -> [1]
    //		assert(intersection2([1], [1]) == [1])
    //		// [1, 2], [2] -> [2]
    //		assert(intersection2([1, 2], [2]) == [2])
    //		// [1, 2, 2, 1], [2, 2] -> [2]
    //		assert(intersection2([1, 2, 2, 1], [2, 2]) == [2])
  }
}
