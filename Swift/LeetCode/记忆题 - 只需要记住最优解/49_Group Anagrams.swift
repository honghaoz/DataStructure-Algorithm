// 49_Group Anagrams
// https://leetcode.com/problems/group-anagrams/
//
// Created by Honghao Zhang on 10/23/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given an array of strings, group anagrams together.
//
//Example:
//
//Input: ["eat", "tea", "tan", "ate", "nat", "bat"],
//Output:
//[
//  ["ate","eat","tea"],
//  ["nat","tan"],
//  ["bat"]
//]
//Note:
//
//All inputs will be in lowercase.
//The order of your output does not matter.
//

import Foundation

class Num49 {
  // MARK: - Generate a key by the letter count
  // For example "ate" -> #1#0...#1...#1...
  // Figure out a way to construct a good key

  // MARK: - Use sorted string as key, return values
  // (N * K log K), N is the count of strs, K is the max count of each s
  func groupAnagrams(_ strs: [String]) -> [[String]] {
    var grouped: [String: [String]] = [:]
    for s in strs {
      let key = String(s.sorted())
      grouped[key] = (grouped[key] ?? []) + [s]
    }

    var result: [[String]] = []
    for (_, group) in grouped {
      result.append(group)
    }
    return result
  }
}
