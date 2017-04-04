//
//  266. Palindrome Permutation.swift
//  LeetCode
//
//  Created by Honghao Zhang on 2016-11-03.
//  Copyright © 2016 Honghaoz. All rights reserved.
//

//Given a string, determine if a permutation of the string could form a palindrome.
//
//For example,
//"code" -> False, "aab" -> True, "carerac" -> True.

import Foundation

class Num266_PalindromePermutation: Solution {
	func canPermutePalindrome(_ s: String) -> Bool {
		let s = [Character](s.characters)
		var freq: [Character : Int] = [:]
		var oddCount: Int = 0
		
		for i in 0..<s.count {
			if let count = freq[s[i]] {
				freq[s[i]] = count + 1
			}
			else {
				freq[s[i]] = 1
			}
		}
		
		for (_, value) in freq {
			if value % 2 == 1 {
				oddCount += 1
			}
			
			if oddCount >= 2 {
				return false
			}
		}
		
		return true
	}
	
	func test() {
		assert(canPermutePalindrome("odd") == true)
		assert(canPermutePalindrome("carerac") == true)
		assert(canPermutePalindrome("code") == false)
	}
}
