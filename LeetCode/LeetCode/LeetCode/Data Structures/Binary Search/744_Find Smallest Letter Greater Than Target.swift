// 744_Find Smallest Letter Greater Than Target
// https://leetcode.com/problems/find-smallest-letter-greater-than-target/
//
// Created by Honghao Zhang on 9/16/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a list of sorted characters letters containing only lowercase letters, and given a target letter target, find the smallest element in the list that is larger than the given target.
//
//Letters also wrap around. For example, if the target is target = 'z' and letters = ['a', 'b'], the answer is 'a'.
//
//Examples:
//
//Input:
//letters = ["c", "f", "j"]
//target = "a"
//Output: "c"
//
//Input:
//letters = ["c", "f", "j"]
//target = "c"
//Output: "f"
//
//Input:
//letters = ["c", "f", "j"]
//target = "d"
//Output: "f"
//
//Input:
//letters = ["c", "f", "j"]
//target = "g"
//Output: "j"
//
//Input:
//letters = ["c", "f", "j"]
//target = "j"
//Output: "c"
//
//Input:
//letters = ["c", "f", "j"]
//target = "k"
//Output: "c"
//Note:
//
//letters has a length in range [2, 10000].
//letters consists of lowercase letters, and contains at least 2 unique letters.
//target is a lowercase letter.
//

import Foundation

class Num744 {
  /// Binary search to find the last index of the target
  func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
    assert(letters.count >= 2)

    // find the last index of the target
    var start = 0
    var end = letters.count - 1
    while start + 1 < end {
      let mid = start + (end - start) / 2
      if letters[mid] < target {
        start = mid
      }
      else if letters[mid] > target {
        end = mid
      }
      else {
        // if equal, move start
        start = mid
      }
    }
    // if found
    if letters[start] == target {
      // if start/end is same
      if letters[end] == target {
        // wraps around
        return letters[0]
      }
        // if start/ned is not the same
      else {
        return letters[end]
      }
    }
    else if letters[end] == target {
      // wraps around
      return letters[0]
    }
      // if not found
    else {
      // target is smaller than start
      if target < letters[start] {
        return letters[start]
      }
        // target is between start and end
      else if letters[start] < target, target < letters[end] {
        return letters[end]
      }
        // target is greater than end
      else {
        return letters[0]
      }
    }
  }
}
