// 23_Merge k Sorted Lists
// https://leetcode.com/problems/merge-k-sorted-lists/solution/
//
// Created by Honghao Zhang on 9/7/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Merge k sorted linked lists and return it as one sorted list. Analyze and describe its complexity.
//
//Example:
//
//Input:
//[
//  1->4->5,
//  1->3->4,
//  2->6
//]
//Output: 1->1->2->3->4->4->5->6
//

import Foundation

class Num23 {
  func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    return mergeKListsHelper(lists, 0, lists.count)
  }

  /// use divide and conquer to merge two lists
  /// O(lg k * n), k is the lists.count, n is the total number of the nodes.
  func mergeKListsHelper(_ lists: [ListNode?], _ l: Int, _ r: Int) -> ListNode? {
    guard l < r else {
      return nil
    }
    if l + 1 == r {
      return lists[l]
    }
    let mid = l + (r - l) / 2
    let left = mergeKListsHelper(lists, l, mid)
    let right = mergeKListsHelper(lists, mid, r)
    return mergeTwoLists(left, right)
  }

  /// merge two lists one by one
  /// time: O(k * n), k is the lists.count, n is ???
  func mergeKLists_mergeOneByOne(_ lists: [ListNode?]) -> ListNode? {
    if lists.count == 0 {
      return nil
    }
    if lists.count == 1 {
      return lists[0]
    }
    var result: ListNode? = lists[0]
    for i in 1..<lists.count {
      result = mergeTwoLists(result, lists[i])
    }
    return result
  }

  /// merge 2 lists helper
  private func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let root = ListNode(0)
        var res = root
        var p1 = l1
        var p2 = l2
        while p1 != nil && p2 != nil {
            if p1!.val < p2!.val {
                res.next = p1
                res = res.next!
                p1 = p1!.next
            } else {
                res.next = p2
                res = res.next!
                p2 = p2!.next
            }
        }
        if p1 != nil {
            res.next = p1
        } else if p2 != nil {
            res.next = p2
        }
        return root.next
    }
}
