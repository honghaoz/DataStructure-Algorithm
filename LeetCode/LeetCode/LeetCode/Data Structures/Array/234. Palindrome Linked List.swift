//
//  234. Palindrome Linked List.swift
//  LeetCode
//
//  Created by Honghao Zhang on 2016-11-05.
//  Copyright © 2016 Honghaoz. All rights reserved.
//

//Given a singly linked list, determine if it is a palindrome.
//
//Follow up:
//Could you do it in O(n) time and O(1) space?

import Foundation

class Num234_PalindromeLinkedList: Solution {
	public class ListNode {
		public var val: Int
		public var next: ListNode?
		public init(_ val: Int) {
			self.val = val
			self.next = nil
		}
	}
	
	func isPalindrome(_ head: ListNode?) -> Bool {
		// O(n) and O(1)
		
		// Use slow and fast pointer, this is helpful for locating the middle node
		// Unpon find the middle node, reverse the first part
		// Check in two directions
		
		if head == nil { return true } // question: should return false/true?
		if head?.next == nil { return true }
		
		var p = head
		var p2 = head?.next
		
		// nil √
		// 1 √
		// 1>2           end: (1)>(2)
		// 1>2>3         end: 1>(2)>3>(4)
		
		//                       p     p2
		// 1>2>3>4       end: 1>(2)>3>(4)
		// 1>2>3>4>5     end: 1>2>(3)>4>5>()
		// 1>2>3>4>5>6   end: 1>2>(3)>4>5>(6)
		while p2?.next != nil {
			p = p?.next
			p2 = p2?.next?.next
		}
		
		if p2 != nil {
			// even number
			var right = p?.next
			
			// break left
			p?.next = nil
			var left = reverseList(head)
			while left != nil {
				if left?.val != right?.val {
					return false
				}
				left = left?.next
				right = right?.next
			}
		} else {
			// odd number
			var right = reverseList(p?.next)
			var left = head
			while right != nil {
				if left?.val != right?.val {
					return false
				}
				left = left?.next
				right = right?.next
			}
		}
		
		return true
	}
	
	func isPalindrome1(_ head: ListNode?) -> Bool {
		// navie listNode -> Array -> Check | O(n) and On(n)
		//
		var array = [Int]()
		var p = head
		while let value = p?.val {
			array.append(value)
			p = p?.next
		}
		
		// 3 -> 1
		// 4 -> 2  1 2 2 1
		for i in 0..<array.count / 2 {
			if array[i] != array[array.count - i - 1] {
				return false
			}
		}
		
		return true
	}
	
	func reverseList(_ head: ListNode?) -> ListNode? {
		// Recursive
		if head == nil { return nil }
		if head?.next == nil { return head }
		
		// 1>2>3>4>nil
		// 1>2<3<4
		//   |
		//   v
		//  nil
		let restReversed = reverseList(head?.next)
		
		// 1<2<3<4
		head?.next?.next = head
		head?.next = nil
		return restReversed
	}
	
	func test() {
		
	}
}
