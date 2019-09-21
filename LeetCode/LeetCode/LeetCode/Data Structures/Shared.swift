//
//  Common.swift
//  LeetCode
//
//  Created by Honghao Zhang on 9/1/19.
//  Copyright © 2019 Honghaoz. All rights reserved.
//

import Foundation

public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init(_ val: Int) {
    self.val = val
    self.next = nil
  }
}

class TreeNode {
  public var val: Int
  public var left: TreeNode?
  public var right: TreeNode?
  public init(_ val: Int) {
    self.val = val
    self.left = nil
    self.right = nil
  }
}
