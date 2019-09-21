// 1108_Defanging an IP Address
// https://leetcode.com/problems/defanging-an-ip-address/submissions/
//
// Created by Honghao Zhang on 9/5/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// 1108. Defanging an IP Address
//Easy
//
//88
//
//304
//
//Favorite
//
//Share
//Given a valid (IPv4) IP address, return a defanged version of that IP address.
//
//A defanged IP address replaces every period "." with "[.]".
//
//
//
//Example 1:
//
//Input: address = "1.1.1.1"
//Output: "1[.]1[.]1[.]1"
//Example 2:
//
//Input: address = "255.100.50.0"
//Output: "255[.]100[.]50[.]0"
//
//
//Constraints:
//
//The given address is a valid IPv4 address.
//

import Foundation

class Num1108 {
  func defangIPaddr(_ address: String) -> String {
      return address.replacingOccurrences(of: ".", with: "[.]")
  }
}
