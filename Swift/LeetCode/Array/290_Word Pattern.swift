//
//  290. Word Pattern.swift
//  https://leetcode.com/problems/word-pattern/
//
//  Created by Honghao Zhang on 2016-11-04.
//  Copyright © 2016 Honghaoz. All rights reserved.
//

//Given a pattern and a string str, find if str follows the same pattern.
//
//Here follow means a full match, such that there is a bijection between a letter in pattern and a non-empty word in str.
//
//Examples:
//pattern = "abba", str = "dog cat cat dog" should return true.
//pattern = "abba", str = "dog cat cat fish" should return false.
//pattern = "aaaa", str = "dog cat cat dog" should return false.
//pattern = "abba", str = "dog dog dog dog" should return false.
//Notes:
//You may assume pattern contains only lowercase letters, and str contains lowercase letters separated by a single space.

// Related: 890_Find and Replace Pattern

import Foundation

class Num290_WordPattern: Solution {
  /// Try to normalize the pattern and the str then compare the pattern
	func wordPattern(_ pattern: String, _ str: String) -> Bool {
		return normalizedPattern(pattern) == buildPattern(str)
	}

  /// "cat dog" -> "ab"
  private func buildPattern(_ string: String) -> String {
    var pattern: [Character] = []

    // The beginning char, which is a
    var char: Character = "a"
    var map: [String: Character] = [:]

    let strings = string.split(separator: " ").map({ String($0) })
    for s in strings {
      // if found a replacement pattern char, add the replacement to the result pattern
      if let replacment = map[s] {
        pattern.append(replacment)
      }
      // this s a new char, record the map and use the new pattern char
      else {
        pattern.append(char)
        map[s] = char

        // a -> b ...
        char = Character(UnicodeScalar(char.asciiValue! + 1))
      }
    }
    return String(pattern)
  }

  // eb -> ab
  // cca -> aab
  private func normalizedPattern(_ string: String) -> String {
    var pattern: [Character] = []

    // The next pattern char, begin with 'a'
    var char: Character = "a"

    // a map from original char to the pattern char
    var map: [Character: Character] = [:]

    // build the pattern
    for c in string {
      // if found a replacement pattern char, add the replacement to the result pattern
      if let replacement = map[c] {
        pattern.append(replacement)
      }
      // this s a new char, record the map and use the new pattern char
      else {
        pattern.append(char) // use the next pattern char
        map[c] = char

        // prepare for the next pattern char
        // a -> b ...
        char = Character(Unicode.Scalar(char.asciiValue! + 1))
      }
    }
    return String(pattern)
  }
	
	func test() {
		
	}
}
