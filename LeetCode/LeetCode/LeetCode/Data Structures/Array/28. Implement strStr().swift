//
//  28. Implement strStr().swift
//  LeetCode
//
//  Created by Honghao Zhang on 2016-11-02.
//  Copyright © 2016 Honghaoz. All rights reserved.
//

//Implement strStr().
//
//Returns the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.

import Foundation

class Num28_ImplementStrStr: Solution {
	func strStr(_ haystack: String, _ needle: String) -> Int {
		let haystack = [Character](haystack.characters)
		let needle = [Character](needle.characters)
		
		guard needle.count <= haystack.count else { return -1 }
		
		if haystack.count == 0 { return 0 }
		if needle.count == 0 { return 0 }
		
		for i in 0..<haystack.count {
			// There's no enough characters to compare
			if haystack.count - i < needle.count {
				return -1
			}
			
			// Compare first
			var j = 0
			if needle[j] == haystack[i] {
				var ii = i
				while j < needle.count, ii < haystack.count {
					if needle[j] == haystack[ii] {
						j += 1
						ii += 1
					} else {
						break
					}
				}
				
				if j == needle.count {
					return i
				}
			}
		}
		
		return -1
	}
	
	func test() {
		
	}
}
