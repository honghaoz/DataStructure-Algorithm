// 445_Add Two Numbers II
// https://leetcode.com/problems/add-two-numbers-ii/submissions/
//
// Created by Honghao Zhang on 9/7/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// You are given two non-empty linked lists representing two non-negative integers. The most significant digit comes first and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
//
//You may assume the two numbers do not contain any leading zero, except the number 0 itself.
//
//Follow up:
//What if you cannot modify the input lists? In other words, reversing the lists is not allowed.
//
//Example:
//
//Input: (7 -> 2 -> 4 -> 3) + (5 -> 6 -> 4)
//Output: 7 -> 8 -> 0 -> 7
//

import Foundation

class Num445 {
  // Use stack to compute.
  func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var stack1 = listToArray(l1)
    var stack2 = listToArray(l2)
    var sumStack: [Int] = []

    var carry: Int = 0
    var n1 = stack1.popLast()
    var n2 = stack2.popLast()
    while n1 != nil || n2 != nil {
      let sum = (n1 ?? 0) + (n2 ?? 0) + carry
      carry = sum / 10
      sumStack.append(sum % 10)

      n1 = stack1.popLast()
      n2 = stack2.popLast()
    }

    if carry > 0 {
      sumStack.append(carry)
    }
    return arrayToList(sumStack.reversed())
  }

  private func listToArray(_ l: ListNode?) -> [Int] {
    var p = l
    var array: [Int] = []
    while p != nil {
      array.append(p!.val)
      p = p!.next
    }
    return array
  }

  private func arrayToList(_ nums: [Int]) -> ListNode? {
    let root = ListNode(0)
    var p = root
    for n in nums {
      let node = ListNode(n)
      p.next = node
      p = p.next!
    }
    return root.next
  }
}
