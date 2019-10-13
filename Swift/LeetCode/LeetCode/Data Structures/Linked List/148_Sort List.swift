// 148_Sort List
// https://leetcode.com/problems/sort-list/submissions/
//
// Created by Honghao Zhang on 9/7/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Sort a linked list in O(n log n) time using constant space complexity.
//
//Example 1:
//
//Input: 4->2->1->3
//Output: 1->2->3->4
//Example 2:
//
//Input: -1->5->3->4->0
//Output: -1->0->3->4->5
//

import Foundation

class Num148 {
  // Divide and conquer, break the list into two parts, sort then merge.
  func sortList(_ head: ListNode?) -> ListNode? {
    // base case
    if head == nil {
      return head
    }
    if head?.next == nil {
      return head
    }

    // divide into two parts
    let root: ListNode? = ListNode(0)
    root?.next = head

    var slow = root
    var fast = root
    while fast?.next != nil {
      slow = slow?.next
      fast = fast?.next?.next
    }
    let rightHead = slow?.next
    slow?.next = nil

    let leftSorted = sortList(head)
    let rightSorted = sortList(rightHead)

    return Num21().mergeTwoLists(leftSorted, rightSorted)
  }
}
