// 836_Rectangle Overlap
// https://leetcode.com/problems/rectangle-overlap
//
// Created by Honghao Zhang on 9/20/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// A rectangle is represented as a list [x1, y1, x2, y2], where (x1, y1) are the coordinates of its bottom-left corner, and (x2, y2) are the coordinates of its top-right corner.
//
//Two rectangles overlap if the area of their intersection is positive.  To be clear, two rectangles that only touch at the corner or edges do not overlap.
//
//Given two (axis-aligned) rectangles, return whether they overlap.
//
//Example 1:
//
//Input: rec1 = [0,0,2,2], rec2 = [1,1,3,3]
//Output: true
//Example 2:
//
//Input: rec1 = [0,0,1,1], rec2 = [1,0,2,1]
//Output: false
//Notes:
//
//Both rectangles rec1 and rec2 are lists of 4 integers.
//All coordinates in rectangles will be between -10^9 and 10^9.
//

import Foundation

class Num836 {
  /// Reduce the problme to 1D, to check if both of two segments are overlapped
  func isRectangleOverlap(_ rect1: [Int], _ rect2: [Int]) -> Bool {
    return isOverlapped(rect1[0], rect1[2], rect2[0], rect2[2]) &&
      isOverlapped(rect1[1], rect1[3], rect2[1], rect2[3])
  }

  /// Checks if two segments are overlapped
  /// a-b, c-d
  private func isOverlapped(_ a: Int, _ b: Int, _ c: Int, _ d: Int) -> Bool {
    guard b > a, d > c else {
      return false
    }

    if a < c {
      return b > c
    }
    else if a > c {
      return a < d
    }
    else {
      return true
    }
  }

  /// Optimized version
  ///  a----b
  ///    c----d
  ///
  ///     a----b
  ///   c----d
  private func isOverlapped2(_ a: Int, _ b: Int, _ c: Int, _ d: Int) -> Bool {
    guard b > a, d > c else {
      return false
    }

    if a <= c, c < b { // c < b, c == b is not allowed
      return true
    }
    if c <= a, a < d {
      return true
    }
    return false
  }

  /// Check with Counterexample, this is easier to understand.
  ///  a----b
  ///          c----d
  ///
  ///          a----b
  ///  c----d
  private func isOverlapped3(_ a: Int, _ b: Int, _ c: Int, _ d: Int) -> Bool {
    guard b > a, d > c else {
      return false
    }
    return !(b <= c || a >= d)
  }
}
