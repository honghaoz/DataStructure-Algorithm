//
//  206. Reverse Linked List.swift
//  LeetCode
//
//  Created by Honghao Zhang on 2016-11-05.
//  Copyright © 2016 Honghaoz. All rights reserved.
//

//Reverse a singly linked list.
//

import Foundation

/**
* Definition for singly-linked list.
* public class ListNode {
*     public var val: Int
*     public var next: ListNode?
*     public init(_ val: Int) {
*         self.val = val
*         self.next = nil
*     }
* }
*/

class Num206_ReverseLinkedList: Solution {
	public class ListNode {
		public var val: Int
		public var next: ListNode?
		public init(_ val: Int) {
			self.val = val
			self.next = nil
		}
	}
	
	func reverseList(_ head: ListNode?) -> ListNode? {
		var i: ListNode? = head
		var j: ListNode? = i?.next
		var k: ListNode? = j?.next
		
		i?.next = nil
		while j != nil {
			j?.next = i
			i = j
			j = k
			k = k?.next
		}
		
		return i
		// nil
		
		// 1
		// i j k
		
		// 1->2
		// i  j  k
		
		// 1->2->3
		
		
		// 1->2->3->4->nil
		// i  j  k
		// 1  2->3->4->nil
		// 1<-2  3->4->nil
		
		// 1<-2  3->4->nil
		//    i  j  k
		// 1<-2<-3  4->nil
		
		
		// 1<-2<-3  4->nil
		//       i  j  k
		// 1<-2<-3<-4
		//          i  j  k
	}
	
	func test() {
		
	}
}
