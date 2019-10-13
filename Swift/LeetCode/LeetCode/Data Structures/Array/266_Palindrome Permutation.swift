//
//  266. Palindrome Permutation.swift
//  https://leetcode.com/problems/palindrome-permutation/
//
//  Created by Honghao Zhang on 2016-11-03.
//  Copyright © 2016 Honghaoz. All rights reserved.
//

//Given a string, determine if a permutation of the string could form a palindrome.
//
//For example,
//"code" -> False, "aab" -> True, "carerac" -> True.
//
//Given a string, determine if a permutation of the string could form a palindrome.
//
//Example 1:
//
//Input: "code"
//Output: false
//Example 2:
//
//Input: "aab"
//Output: true
//Example 3:
//
//Input: "carerac"
//Output: true

import Foundation

class Num266_PalindromePermutation: Solution {
  /// compute the char frequence
  /// at most 1 odd frequence is allowed.
	func canPermutePalindrome(_ s: String) -> Bool {
		let s = [Character](s)
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
