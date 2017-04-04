//
//  205. Isomorphic Strings.swift
//  LeetCode
//
//  Created by Honghao Zhang on 2016-11-02.
//  Copyright © 2016 Honghaoz. All rights reserved.
//
//
//Given two strings s and t, determine if they are isomorphic.
//
//Two strings are isomorphic if the characters in s can be replaced to get t.
//
//All occurrences of a character must be replaced with another character while preserving the order of characters. No two characters may map to the same character but a character may map to itself.
//
//For example,
//Given "egg", "add", return true.
//
//Given "foo", "bar", return false.
//
//Given "paper", "title", return true.
//
//Note:
//You may assume both s and t have the same length.

import Foundation

class Num205_IsomorphicString: Solution {
	func isIsomorphic(_ s: String, _ t: String) -> Bool {
		let s = [Character](s.characters)
		let t = [Character](t.characters)
		guard s.count == t.count else { return false }
		
		var map: [Character : Character] = [:]
		var reversedMap: [Character : Character] = [:]
		for i in 0..<s.count {
			if let value = map[s[i]] {
				if value != t[i] { return false }
			} else {
				if let key = reversedMap[t[i]] {
					if key != s[i] { return false }
				}
				map[s[i]] = t[i]
				reversedMap[t[i]] = s[i]
			}
		}
		return true
	}
	
	func test() {
		
	}
}
