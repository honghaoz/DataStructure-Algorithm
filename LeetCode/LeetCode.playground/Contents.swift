//: Playground - noun: a place where people can play

import Foundation
import UIKit

// 228. Summary Ranges
// Given a sorted integer array without duplicates, return the summary of its ranges.
// For example, given [0,1,2,4,5,7], return ["0->2","4->5","7"].

// [-1, 0, 1, 2, 4, 5, 6, 8, 9, 11, 12, 15]
//     [1, 1, 1, 2, 1, 1, 2, 1,  2,  1,  3]

// [-2, 0, 1, 2, 4, 5, 6, 8, 9, 11, 12, 15]
//     [2, 1, 1, 2, 1, 1, 2, 1,  2,  1,  3]

// [] -> []
// [1] -> ["1"]
// [1, 2] -> ["1->2"]
// [1, 3] -> ["1", "3"]
// [1, 2, 3] -> ["1->3"]
// [1, 2, 4] -> ["1->2", "4"]
// [1, 3, 4] -> ["1", "3->4"]

class Solution1 {
	func summaryRanges(nums: [Int]) -> [String] {
		var result: [String] = []
		var start: Int!
		var last: Int!
		for num in nums {
			if start == nil {
				start = num
				last = num
				continue
			}
			
			// Continues
			if (num - last) == 1 {
				last = num
				continue
			}
			// Breaks
			else if (num - last) > 1 {
				if start == last {
					result.append("\(start)")
				} else {
					result.append("\(start)->\(last)")
				}
				
				start = num
				last = num
				continue
			}
		}
		
		if start != nil {
			if start == last {
				result.append("\(start)")
			} else {
				result.append("\(start)->\(last)")
			}
		}
		
		return result
	}
}

func check<T where T: Equatable>(a: T, _ b: T) -> UIColor {
	if a == b {
		return .greenColor()
	}
	return .redColor()
}


//typealias A = Array where Element: Equatable
//extension Array where Element: Equatable {
//	
//}

extension Array: Equatable {}
public func ==<T>(lhs: [T], rhs: [T]) -> Bool {
	if T.self is Equatable {
		
	}
//	guard let lhs = lhs as? [Equatable] else {
//		
//	}
	guard lhs.count == rhs.count else {
		return false
	}
	
	return true
}

check(1, 1)

print([1] == [1])

Solution1().summaryRanges([])
check(Solution1().summaryRanges([1]), ["1"])
Solution1().summaryRanges([1, 2])
Solution1().summaryRanges([1, 3])
check(Solution1().summaryRanges([1, 2, 3]), ["1->3"])
Solution1().summaryRanges([1, 2, 4])
Solution1().summaryRanges([1, 2, 4, 5])
Solution1().summaryRanges([1, 2, 4, 6])
Solution1().summaryRanges([1, 2, 4, 7, 8])
