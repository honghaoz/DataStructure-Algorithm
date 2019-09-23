//
//  14. Longest Common Prefix.swift
//  https://leetcode.com/problems/longest-common-prefix/
//
//  Created by Honghao Zhang on 2016-11-03.
//  Copyright © 2016 Honghaoz. All rights reserved.
//

//Write a function to find the longest common prefix string amongst an array of strings.

import Foundation

class Num14_LongestCommonPrefix: Solution {

  /// Use the first string as a reference
  /// loop the rest strings to check if the rest strings shares the common prefix
	func longestCommonPrefix(_ strs: [String]) -> String {
		var res = ""
		guard strs.count > 0 else { return res }
		if strs.count == 1 {
			return strs[0]
		}
		
		let first = Array(strs[0])
		for (i, char) in first.enumerated() {
			for j in 1..<strs.count {
				let chars = Array(strs[j])
				if i >= chars.count {
					return res
				}
				else if char != chars[chars.index(chars.startIndex, offsetBy: i)] {
					return res
				}
			}
			
			res.append(char)
		}
		
		return res
	}
	
	func longestCommonPrefix1(_ strs: [String]) -> String {
		if strs.count == 0 {
			return ""
		}
		
		if strs.count == 1 {
			return strs[0]
		}
		
		let stringsMaxLength = strs.map { Int($0.count) }.max()!
		
		let stringsMaxIndex = strs.count
		
		var commonPrefix = ""
		
		for checkingIndex in 0 ..< stringsMaxLength {
			var lastChar = ""
			for stringIndex in 0 ..< stringsMaxIndex {
				let string = strs[stringIndex]
				
				if checkingIndex >= string.count {
					return commonPrefix
				}
				
				let char = String(string[string.index(string.startIndex, offsetBy: checkingIndex)])
				
				if lastChar == "" {
					lastChar = char
					continue
				} else if lastChar == char {
					if stringIndex == stringsMaxIndex - 1 {
						commonPrefix += char
					} else {
						continue
					}
				} else {
					return commonPrefix
				}
			}
		}
		
		return commonPrefix
	}
	
	func test() {
    
	}
}
