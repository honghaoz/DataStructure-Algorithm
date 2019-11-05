// 232_Implement Queue using Stacks
// https://leetcode.com/problems/implement-queue-using-stacks/
//
// Created by Honghao Zhang on 10/16/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Implement the following operations of a queue using stacks.
//
//push(x) -- Push element x to the back of queue.
//pop() -- Removes the element from in front of queue.
//peek() -- Get the front element.
//empty() -- Return whether the queue is empty.
//Example:
//
//MyQueue queue = new MyQueue();
//
//queue.push(1);
//queue.push(2);
//queue.peek();  // returns 1
//queue.pop();   // returns 1
//queue.empty(); // returns false
//Notes:
//
//You must use only standard operations of a stack -- which means only push to top, peek/pop from top, size, and is empty operations are valid.
//Depending on your language, stack may not be supported natively. You may simulate a stack by using a list or dequeue (double-ended queue), as long as you use only standard operations of a stack.
//You may assume that all operations are valid (for example, no pop or peek operations will be called on an empty queue).
//

import Foundation

class Num232 {
  // MARK: - 用两个stack
  // Push - O(1) per operation.
  // Pop - Amortized O(1) per operation.
  // 正常的stack接受新的数字，当反向stack空白的时候，记录front
  // 反向的stack存的是反过来的数字，当pop的时候，如果反向stack有，则直接返回。否则，把正常stack中的数字倒腾过来。
  class MyQueue {

    private var stack: [Int] = [] // stores the incoming values
    private var reversedStack: [Int] = [] // stores the reversed values

    private var front: Int = -1 // stores the front value in the `stack`
    // the front value is only valid when reversedStack is empty.

    /** Initialize your data structure here. */
    init() {

    }

    /** Push element x to the back of queue. */
    func push(_ x: Int) {
      if stack.isEmpty {
        front = x // when stack is empty, front should update to the new front
      }
      stack.append(x)
    }

    /** Removes the element from in front of queue and returns that element. */
    func pop() -> Int {
      if reversedStack.isEmpty {
        // if there's no value in the reversed stack, we need to move the
        // values from the normal stack
        while !stack.isEmpty {
          reversedStack.append(stack.removeLast())
        }
      }
      return reversedStack.popLast() ?? -1
    }

    /** Get the front element. */
    func peek() -> Int {
      if reversedStack.isEmpty {
        if stack.isEmpty {
          return -1
        }
        return front
      }
      return reversedStack.last ?? -1
    }

    /** Returns whether the queue is empty. */
    func empty() -> Bool {
      return stack.isEmpty && reversedStack.isEmpty
    }
  }

  /**
   * Your MyQueue object will be instantiated and called as such:
   * let obj = MyQueue()
   * obj.push(x)
   * let ret_2: Int = obj.pop()
   * let ret_3: Int = obj.peek()
   * let ret_4: Bool = obj.empty()
   */
}
