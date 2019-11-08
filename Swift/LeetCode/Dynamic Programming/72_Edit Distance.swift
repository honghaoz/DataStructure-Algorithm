// 72_Edit Distance
// https://leetcode.com/problems/edit-distance/
//
// Created by Honghao Zhang on 10/1/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given two words word1 and word2, find the minimum number of operations required to convert word1 to word2.
//
//You have the following 3 operations permitted on a word:
//
//Insert a character
//Delete a character
//Replace a character
//Example 1:
//
//Input: word1 = "horse", word2 = "ros"
//Output: 3
//Explanation:
//horse -> rorse (replace 'h' with 'r')
//rorse -> rose (remove 'r')
//rose -> ros (remove 'e')
//Example 2:
//
//Input: word1 = "intention", word2 = "execution"
//Output: 5
//Explanation:
//intention -> inention (remove 't')
//inention -> enention (replace 'i' with 'e')
//enention -> exention (replace 'n' with 'x')
//exention -> exection (replace 'n' with 'c')
//exection -> execution (insert 'u')
//

// 找出最小的edit distance

import Foundation

class Num72 {
  // DP, Two sequence DP problem, use 2d array for the state.
  // s[i][j] represents the min distance for word1[0...i] to word2[0...j],
  // so for s[i][j], we can check it's relationship between previous states under 1) deletion, 2) insert and 3) replace situations.
  func minDistance(_ word1: String, _ word2: String) -> Int {
    if word1.count == 0 {
      return word2.count
    }
    if word2.count == 0 {
      return word1.count
    }

    let word1 = Array(word1)
    let word2 = Array(word2)

    // state
    // s[i][j] represents the min distance for word1[0...i] to word2[0...j]
    var s: [[Int]] = Array(repeating: Array(repeating: 0, count: word2.count + 1), count: word1.count + 1)

    // initialize
    for i in 0...word1.count {
      s[i][0] = i // delete i characters
    }
    for j in 0...word2.count {
      s[0][j] = j // insert j characters
    }

    // function
    for i in 1...word1.count {
      for j in 1...word2.count {
        // 按照edit operation的不同，分别计算三种操作需要的最小次数
        
        // delete: delete the last character in word1
        let deletion = s[i - 1][j] + 1

        // insert: insert a new character in word1, this means word1[0...i] should match word2[0...j - 1]
        let insertion = s[i][j - 1] + 1

        // replace
        let replace: Int
        if word1[i - 1] == word2[j - 1] {
          // if both side have same character: no action
          replace = s[i - 1][j - 1]
        }
        else {
          // otherwise, replace has one distance
          replace = s[i - 1][j - 1] + 1
        }

        s[i][j] = min(deletion, insertion, replace)
      }
    }

    // answer
    return s[word1.count][word2.count]
  }
}
