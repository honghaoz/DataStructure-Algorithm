// 203_Remove Linked List Elements
// https://leetcode.com/problems/remove-linked-list-elements/
//
// Created by Honghao Zhang on 9/7/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Remove all elements from a linked list of integers that have value val.
//
//Example:
//
//Input:  1->2->6->3->4->5->6, val = 6
//Output: 1->2->3->4->5
//

import Foundation

class Num203 {
  func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
    let root: ListNode? = ListNode(0)
    root?.next = head
    var prev = root
    var current = head
    while current != nil {
      if current?.val == val {
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
