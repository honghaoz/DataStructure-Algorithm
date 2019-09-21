// 206_Reverse Linked List
// https://leetcode.com/problems/reverse-linked-list/submissions/
//
// Created by Honghao Zhang on 9/5/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Reverse a singly linked list.
//
//Example:
//
//Input: 1->2->3->4->5->NULL
//Output: 5->4->3->2->1->NULL
//Follow up:
//
//A linked list can be reversed either iteratively or recursively. Could you implement both?
//

import Foundation

//public class ListNode {
//  public var val: Int
//  public var next: ListNode?
//  public init(_ val: Int) {
//    self.val = val
//    self.next = nil
//  }
//}

class Num206 {
  // Iteration
  func reverseList_Iteration(_ head: ListNode?) -> ListNode? {
    let root: ListNode? = nil
    var i: ListNode? = root
    var j: ListNode? = head
    var k: ListNode? = head?.next
    while j != nil {
      j?.next = i
      i = j
      j = k
      k = k?.next
    }
    return i
  }

  // Recursive
  func reverseList_Recursive(_ head: ListNode?) -> ListNode? {
    if head?.next == nil {
      return head
    }

    let subHead: ListNode? = head?.next
    let newHead = reverseList_Recursive(subHead)
    subHead?.next = head
    head?.next = nil
    return newHead
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
}
