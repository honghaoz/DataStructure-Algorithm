// 244_Shortest Word Distance II
// https://leetcode.com/problems/shortest-word-distance-ii/
//
// Created by Honghao Zhang on 10/18/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Design a class which receives a list of words in the constructor, and implements a method that takes two words word1 and word2 and return the shortest distance between these two words in the list. Your method will be called repeatedly many times with different parameters.
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

// 之前那个题目是一次function call，找一次
// 这个题目是设计一个class，function会被call很多次
// 找两个word的最小距离，但是需要初始化一下
// 就是找两个Int array中最小的差值

import Foundation

class Num244 {
  // MARK: - Two Indices
  class WordDistance {
    // 每个单词对应的indice list
    var wordIndices: [String: [Int]] = [:]
    init(_ words: [String]) {
      for i in 0..<words.count {
        wordIndices[words[i]] = (wordIndices[words[i]] ?? []) + [i]
      }
    }

    // 在两个数组中找最小的差值，用双index，每次循环update最小差值
    // 然后增加小的那个index
    func shortest(_ word1: String, _ word2: String) -> Int {
      let indices1 = wordIndices[word1]!
      let indices2 = wordIndices[word2]!
      guard indices1.count > 0, indices2.count > 0 else {
        return 0
      }

      var i1 = 0
      var i2 = 0
      var minDistance = Int.max
      while i1 < indices1.count, i2 < indices2.count {
        minDistance = min(minDistance, abs(indices1[i1] - indices2[i2]))
        if minDistance == 0 {
          return minDistance
        }
        if indices1[i1] < indices2[i2] {
          i1 += 1
        }
        else {
          i2 += 1
        }
      }
      return minDistance
    }
  }

  /**
   * Your WordDistance object will be instantiated and called as such:
   * let obj = WordDistance(words)
   * let ret_1: Int = obj.shortest(word1, word2)
   */
}
