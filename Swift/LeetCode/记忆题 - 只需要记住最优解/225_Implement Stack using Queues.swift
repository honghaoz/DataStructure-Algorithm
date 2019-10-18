// 225_Implement Stack using Queues
// https://leetcode.com/problems/implement-stack-using-queues/
//
// Created by Honghao Zhang on 10/17/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Implement the following operations of a stack using queues.
//
//push(x) -- Push element x onto stack.
//pop() -- Removes the element on top of the stack.
//top() -- Get the top element.
//empty() -- Return whether the stack is empty.
//Example:
//
//MyStack stack = new MyStack();
//
//stack.push(1);
//stack.push(2);
//stack.top();   // returns 2
//stack.pop();   // returns 2
//stack.empty(); // returns false
//Notes:
//
//You must use only standard operations of a queue -- which means only push to back, peek/pop from front, size, and is empty operations are valid.
//Depending on your language, queue may not be supported natively. You may simulate a queue by using a list or deque (double-ended queue), as long as you use only standard operations of a queue.
//You may assume that all operations are valid (for example, no pop or top operations will be called on an empty stack).
//

import Foundation

class Num225 {
  // MARK: - Use 2 queues
  // Push: O(1), Pop: O(1)
  // 用两个queue，第一个queue存数字。当pop的时候，把q1的除了最后一个数字都pop到q2里。然后q1和q2 swap一下。
  
  // MARK: - Use one queue to implement
  // Push: O(n), Pop: O(1)
  // 每次放入新元素，把之前的元素吐出来再放回去，这样queue就保持了从前到后是stack的状态
  class MyStack {
    
    private var queue: [Int] = []
    
    /** Initialize your data structure here. */
    init() {}
    
    /** Push element x onto stack. */
    // Push O(n)
    func push(_ x: Int) {
      // 放入新元素，然后把之前的元素吐出来再吃进去，这样就保持了stack的属性
      let count = queue.count
      queue.append(x)
      for _ in 0..<count {
        let element = queue.removeFirst()
        queue.append(element)
      }
    }
    
    /** Removes the element on top of the stack and returns that element. */
    // Pop O(1)
    func pop() -> Int {
      if queue.isEmpty {
        return -1
      }
      return queue.removeFirst()
    }
    
    /** Get the top element. */
    func top() -> Int {
      return queue.first ?? -1
    }
    
    /** Returns whether the stack is empty. */
    func empty() -> Bool {
      return queue.isEmpty
    }
  }
  
  /**
   * Your MyStack object will be instantiated and called as such:
   * let obj = MyStack()
   * obj.push(x)
   * let ret_2: Int = obj.pop()
   * let ret_3: Int = obj.top()
   * let ret_4: Bool = obj.empty()
   */
}
