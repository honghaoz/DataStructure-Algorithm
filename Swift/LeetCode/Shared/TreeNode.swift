//
//  TreeNode.swift
//  LeetCode
//
//  Created by Honghao Zhang on 10/12/19.
//  Copyright © 2019 Honghaoz. All rights reserved.
//

import Foundation

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
