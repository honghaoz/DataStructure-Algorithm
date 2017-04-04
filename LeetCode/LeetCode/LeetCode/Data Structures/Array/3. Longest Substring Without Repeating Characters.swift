//
//  3. Longest Substring Without Repeating Characters.swift
//  LeetCode
//
//  Created by Honghao Zhang on 2016-11-05.
//  Copyright © 2016 Honghaoz. All rights reserved.
//

//Given a string, find the length of the longest substring without repeating characters.
//
//Examples:
//
//Given "abcabcbb", the answer is "abc", which the length is 3.
//
//Given "bbbbb", the answer is "b", with the length of 1.
//
//Given "pwwkew", the answer is "wke", with the length of 3. Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
//
//Subscribe to see which companies asked this question

import Foundation

class Num3_LongestSubstringWithoutRepeatingCharacters: Solution {
	func lengthOfLongestSubstring(_ s: String) -> Int {
		guard s.isEmpty == false else { return 0 }
		let s = [Character](s.characters)
		var i = 0
		var j = 0
		var dict = [Character : Int]()
		var res = 0
		
		while i < s.count && j < s.count {
			// If there's existing index and existing index is greater than i
			if let prevJIndex = dict[s[j]], prevJIndex >= i {
				i = max(i, prevJIndex) + 1
			}
			dict[s[j]] = j
			res = max(res, j - i + 1)
			j += 1
		}
		return res
	}
	
	func lengthOfLongestSubstring2(_ s: String) -> Int {
		guard s.isEmpty == false else { return 0 }
		var i = 0
		var j = 0
		let s = [Character](s.characters)
		var res = 0
		
		var set = Set<Character>()
		while i <  s.count && j < s.count {
			if set.contains(s[j]) {
				set.remove(s[i])
				i += 1
			} else {
				set.insert(s[j])
				res = max(res, j - i + 1)
				j += 1
			}
		}
		return res
	}
	
	func lengthOfLongestSubstring1(_ s: String) -> Int {
		guard s.isEmpty == false else { return 0 }
		let s = [Character](s.characters)
		var i = 0
		var j = i + 1
		var max = 1
		var pos: [Character : Int] = [s[0] : 0]
		
		while j < s.count {
			// if find duplicated
			if let existedIndex = pos[s[j]] {
				if s[i] == s[j] {
					i += 1
				} else {
					for x in 0...existedIndex {
						pos.removeValue(forKey: s[x])
					}
					i = existedIndex + 1
				}
			}
			
			if j - i + 1 > max {
				max = j - i + 1
			}
			pos[s[j]] = j
			j += 1
		}
		
		return max
	}
	
	func test() {
		let _ = lengthOfLongestSubstring("tmmzuxt")
	}
}
