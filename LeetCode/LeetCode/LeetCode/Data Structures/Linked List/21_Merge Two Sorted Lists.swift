// 21_Merge Two Sorted Lists
// https://leetcode.com/problems/merge-two-sorted-lists/
//
// Created by Honghao Zhang on 9/3/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.
//
//Example:
//
//Input: 1->2->4, 1->3->4
//Output: 1->1->2->3->4->4
//

import Foundation

class Num21 {
  // two pointers
  func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    let root = ListNode(0)
    var p = root
    var p1 = l1
    var p2 = l2
    while p1 != nil && p2 != nil {
        if p1!.val < p2!.val {
            p.next = p1
            p = p.next!
            p1 = p1!.next
        } else {
            p.next = p2
            p = p.next!
            p2 = p2!.next
        }
    }
    if p1 != nil {
        p.next = p1
    } else if p2 != nil {
        p.next = p2
    }
    return root.next
  }
}
