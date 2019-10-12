// 648_Replace Words
// https://leetcode.com/problems/replace-words/
//
// Created by HongHao Zhang on 10/12/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// In English, we have a concept called root, which can be followed by some other words to form another longer word - let's call this word successor. For example, the root an, followed by other, which can form another word another.
//
//Now, given a dictionary consisting of many roots and a sentence. You need to replace all the successor in the sentence with the root forming it. If a successor has many roots can form it, replace it with the root with the shortest length.
//
//You need to output the sentence after the replacement.
//
//Example 1:
//
//Input: dict = ["cat", "bat", "rat"]
//sentence = "the cattle was rattled by the battery"
//Output: "the cat was rat by the bat"
//
//
//Note:
//
//The input will only have lower-case letters.
//1 <= dict words number <= 1000
//1 <= sentence words number <= 1000
//1 <= root length <= 100
//1 <= sentence words length <= 1000
//

// 把一个sentence中的每个word都替换成root（词根）

import Foundation

class Num648 {
  // MARK: - Trie
  func 
  
  // MARK: - Hash
  // process each word in the sentence. For each word, check its prefix aginst the dictionary
  // O(word counts * each word length)
  func replaceWords(_ dict: [String], _ sentence: String) -> String {
    let roots = Set(dict)
    let words = sentence.split(separator: " ")
    return words.map {
      return process(roots, String($0))
    }.joined(separator: " ")
  }
  
  /// process a word with the dictionary to make it short
  /// for example: cattle -> cat
  private func process(_ roots: Set<String>, _ word: String) -> String {
    // find a root in the set that the root and word have common prefix
    // for each prefix in the word, check if there's a root
    for length in 1...word.count {
      let prefix = word[0..<length]
      if roots.contains(prefix) {
        return prefix
      }
    }
    return word
  }
}
