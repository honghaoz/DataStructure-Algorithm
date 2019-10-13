// 2. Add Two Numbers
// https://leetcode.com/problems/add-two-numbers/
//
//You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
//
//You may assume the two numbers do not contain any leading zero, except the number 0 itself.
//
//Example:
//
//Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
//Output: 7 -> 0 -> 8
//Explanation: 342 + 465 = 807.

import Foundation

class Num2_AddTwoNumbers {
  func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    let res = ListNode(0)
    var p = res
    var p1 = l1
    var p2 = l2
    var carry: Int?
    while p1 != nil && p2 != nil {
      let sum = p1!.val + p2!.val + (carry ?? 0)
      carry = nil
      if sum >= 10 {
        p.next = ListNode(sum % 10)
        p = p.next!
        carry = sum / 10
      } else {
        p.next = ListNode(sum)
        p = p.next!
      }
      p1 = p1!.next
      p2 = p2!.next
    }

    p1 = p1 ?? p2
    while p1 != nil {
      let sum = p1!.val + (carry ?? 0)
      carry = nil
      if sum >= 10 {
        p.next = ListNode(sum % 10)
        p = p.next!
        carry = sum / 10
      } else {
        p.next = ListNode(sum)
        p = p.next!
      }
      p1 = p1!.next
    }
    if let last = carry {
      p.next = ListNode(last)
    }
    return res.next
  }

  func addTwoNumbers2(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    let res = ListNode(0)
    var p: ListNode? = res
    var p1: ListNode? = l1
    var p2: ListNode? = l2
    var carry: Int = 0
    while p1 != nil || p2 != nil {
      let sum = (p1?.val ?? 0) + (p2?.val ?? 0) + carry
      p!.next = ListNode(sum % 10)
      p = p!.next
      carry = sum / 10
      p1 = p1?.next
      p2 = p2?.next
    }
    if carry > 0 {
      p!.next = ListNode(carry)
    }
    return res.next
  }
}
