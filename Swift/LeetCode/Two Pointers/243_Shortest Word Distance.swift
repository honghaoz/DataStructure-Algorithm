// 243_Shortest Word Distance
// https://leetcode.com/problems/shortest-word-distance/
//
// Created by Honghao Zhang on 10/18/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a list of words and two words word1 and word2, return the shortest distance between these two words in the list.
//
//Example:
//Assume that words = ["practice", "makes", "perfect", "coding", "makes"].
//
//Input: word1 = “coding”, word2 = “practice”
//Output: 3
//Input: word1 = "makes", word2 = "coding"
//Output: 1
//Note:
//You may assume that word1 does not equal to word2, and word1 and word2 are both in the list.
//

// 在一个array of string中，找两个word间的最短距离。同一个word可能出现多次
// 循环一遍，用两个index来分别记录两个word找到的index，在循环的过程中记录最小值

import Foundation

class Num243 {
  // MARK: - Two Indices
  // 从左到右记录word1和word2的index，每次循环更新这两个index之间最短的距离
  func shortestDistance(_ words: [String], _ word1: String, _ word2: String) -> Int {
    var word1Index = -1
    var word2Index = -1
    var shortestDistance = Int.max
    for i in 0..<words.count {
      if words[i] == word1 {
        word1Index = i
      }
      else if words[i] == word2 {
        word2Index = i
      }

      if word1Index != -1, word2Index != -1 {
        shortestDistance = min(shortestDistance, abs(word1Index - word2Index))
      }
    }

    return shortestDistance
  }
}
