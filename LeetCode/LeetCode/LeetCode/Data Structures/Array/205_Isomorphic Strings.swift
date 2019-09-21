//
//  205. Isomorphic Strings.swift
//  https://leetcode.com/problems/isomorphic-strings/
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
		let s = [Character](s)
		let t = [Character](t)
		guard s.count == t.count else { return false }

    // s char to t char
		var map: [Character : Character] = [:]
    // t chat to s char
		var reversedMap: [Character : Character] = [:]
		for i in 0..<s.count {
      // if there's recorded t char, compare if they are same
			if let value = map[s[i]] {
				if value != t[i] { return false }
			} else {
        // if there's a recorded s char, compare if they are same
				if let key = reversedMap[t[i]] {
					if key != s[i] { return false }
				}
        // update the records
				map[s[i]] = t[i]
				reversedMap[t[i]] = s[i]
			}
		}
		return true
	}
	
	func test() {
		
	}
}
