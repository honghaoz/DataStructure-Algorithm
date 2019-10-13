// 83_Remove Duplicates from Sorted List
// https://leetcode.com/problems/remove-duplicates-from-sorted-list/
//
// Created by Honghao Zhang on 9/7/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a sorted linked list, delete all duplicates such that each element appear only once.
//
//Example 1:
//
//Input: 1->1->2
//Output: 1->2
//Example 2:
//
//Input: 1->1->2->3->3
//Output: 1->2->3
//

import Foundation

class Num83 {
  // Check if current val is same as the previous value, if so, remove it.
  func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    let root: ListNode? = ListNode(0)
    root?.next = head
    var prev = root
    var current = head
    while current != nil {
      if prev !== root, current?.val == prev!.val {
        prev?.next = current?.next
        current = current?.next
        continue
      }

      prev = current
      current = current?.next
    }
    return root?.next
  }
}
