// 876_Middle of the Linked List
// https://leetcode.com/problems/middle-of-the-linked-list/
//
// Created by Honghao Zhang on 9/7/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a non-empty, singly linked list with head node head, return a middle node of linked list.
//
//If there are two middle nodes, return the second middle node.
//
//
//
//Example 1:
//
//Input: [1,2,3,4,5]
//Output: Node 3 from this list (Serialization: [3,4,5])
//The returned node has value 3.  (The judge's serialization of this node is [3,4,5]).
//Note that we returned a ListNode object ans, such that:
//ans.val = 3, ans.next.val = 4, ans.next.next.val = 5, and ans.next.next.next = NULL.
//Example 2:
//
//Input: [1,2,3,4,5,6]
//Output: Node 4 from this list (Serialization: [4,5,6])
//Since the list has two middle nodes with values 3 and 4, we return the second one.
//
//
//Note:
//
//The number of nodes in the given list will be between 1 and 100.
//

import Foundation

class Num876 {
  func middleNode(_ head: ListNode?) -> ListNode? {
      let root: ListNode? = ListNode(0)
    root?.next = head
    var slow = root
    var fast = root
    while fast?.next != nil {
      slow = slow?.next
      fast = fast?.next?.next
    }
    // if fast is just the last node, the slow is the last node of first half.
    // should return the next node, which is the head of the right part.
    if fast != nil {
      return slow?.next
    }
    return slow
  }
}
