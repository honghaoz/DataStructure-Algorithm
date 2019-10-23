// 890_Find and Replace Pattern
// https://leetcode.com/problems/find-and-replace-pattern/
//
// Created by Honghao Zhang on 10/20/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// You have a list of words and a pattern, and you want to know which words in words matches the pattern.
//
//A word matches the pattern if there exists a permutation of letters p so that after replacing every letter x in the pattern with p(x), we get the desired word.
//
//(Recall that a permutation of letters is a bijection from letters to letters: every letter maps to another letter, and no two letters map to the same letter.)
//
//Return a list of the words in words that match the given pattern.
//
//You may return the answer in any order.
//
//
//
//Example 1:
//
//Input: words = ["abc","deq","mee","aqq","dkd","ccc"], pattern = "abb"
//Output: ["mee","aqq"]
//Explanation: "mee" matches the pattern because there is a permutation {a -> m, b -> e, ...}.
//"ccc" does not match the pattern because {a -> c, b -> c, ...} is not a permutation,
//since a and b map to the same letter.
//
//
//Note:
//
//1 <= words.length <= 50
//1 <= pattern.length = words[i].length <= 20
//

// 找出符合pattern的string

import Foundation

class Num890 {
  // Just use normalized pattern to filter out unmatched one
  func findAndReplacePattern(_ words: [String], _ pattern: String) -> [String] {
    let pattern = normalizedPattern(pattern)
    return words.filter {
      normalizedPattern($0) == pattern
    }
  }

  // eb -> ab
  // cca -> aab
  private func normalizedPattern(_ string: String) -> String {
    var pattern: [Character] = []

    // The beginning char, which is a
    var char: Character = "a"
    // a map from original char to the pattern char
    var map: [Character: Character] = [:]
    for c in string {
      // if found a replacement pattern char, add the replacement to the result pattern
      if let replacment = map[c] {
        pattern.append(replacment)
      }
        // this s a new char, record the map and use the new pattern char
      else {
        pattern.append(char)
        map[c] = char

        // a -> b ...
        char = Character(UnicodeScalar(char.asciiValue! + 1))
      }
    }
    return String(pattern)
  }
}
