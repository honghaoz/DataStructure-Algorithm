//
//  58. Length of Last Word.swift
//  LeetCode
//
//  Created by Honghao Zhang on 2016-11-02.
//  Copyright © 2016 Honghaoz. All rights reserved.
//

import Foundation

class Num58_LengthOfLastWord: Solution {
	func lengthOfLastWord(_ s: String) -> Int {
		return s.characters.split(separator: " ").last?.count ?? 0
	}
	
	func test() {
		
	}
}
