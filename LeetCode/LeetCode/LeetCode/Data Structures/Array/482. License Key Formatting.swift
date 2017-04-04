//
//  482. License Key Formatting.swift
//  LeetCode
//
//  Created by Honghao Zhang on 2017-02-25.
//  Copyright © 2017 Honghaoz. All rights reserved.
//

import Foundation

class Num482_LicenseKeyFormatting: Solution {
	func licenseKeyFormatting(_ S: String, _ K: Int) -> String {
		let s = Array(S.characters)
		var res = ""
		var count = 0
		for i in (0...(s.count - 1)).reversed() {
			if s[i] == "-" { continue }
			res = String(s[i].upperCase) + res
			count += 1
			if count % 4 == 0 && i != 0 {
				res = "-" + res
			}
		}
		return res
	}
	
	func test() {
		//
		licenseKeyFormatting("2-4A0r7-4k", 4) == "24A0-R74K"
	}
}

private extension Character {
	var isSmallerCase: Bool {
		let a = "a".unicodeScalars.first!.value
		let z = "z".unicodeScalars.first!.value
		let selfValue = String(self).unicodeScalars.first!.value
		if a <= selfValue && selfValue <= z {
			return  true
		}
		return false
	}
	
	var upperCase: Character {
		if self.isSmallerCase {
			let a = "a".unicodeScalars.first!.value
			let A = "A".unicodeScalars.first!.value
			let offset: UInt32 = a - A
			let selfValue = String(self).unicodeScalars.first!.value
			return Character(UnicodeScalar(selfValue - offset)!)
		}
		return self
	}
}
