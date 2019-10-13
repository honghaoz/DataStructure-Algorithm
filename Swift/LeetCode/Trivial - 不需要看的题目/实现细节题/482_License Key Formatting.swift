// 482. License Key Formatting.swift
// https://leetcode.com/problems/license-key-formatting/
//
// You are given a license key represented as a string S which consists only alphanumeric character and dashes. The string is separated into N+1 groups by N dashes.
//
//Given a number K, we would want to reformat the strings such that each group contains exactly K characters, except for the first group which could be shorter than K, but still must contain at least one character. Furthermore, there must be a dash inserted between two groups and all lowercase letters should be converted to uppercase.
//
//Given a non-empty string S and a number K, format the string according to the rules described above.
//
//Example 1:
//
//Input: S = "5F3Z-2e-9-w", K = 4
//
//Output: "5F3Z-2E9W"
//
//Explanation: The string S has been split into two parts, each part has 4 characters.
//Note that the two extra dashes are not needed and can be removed.
//Example 2:
//
//Input: S = "2-5g-3-J", K = 2
//
//Output: "2-5G-3J"
//
//Explanation: The string S has been split into three parts, each part has 2 characters except the first part as it could be shorter as mentioned above.
//Note:
//
//The length of string S will not exceed 12,000, and K is a positive integer.
//String S consists only of alphanumerical characters (a-z and/or A-Z and/or 0-9) and dashes(-).
//String S is non-empty.

import Foundation

class Num482_LicenseKeyFormatting: Solution {
  /// A straight forward way, constructing the result string by scaning the chars one by one.
  func licenseKeyFormatting(_ S: String, _ K: Int) -> String {
    let s = Array(S)
    var res = ""
    var count = 0
    for i in (0...(s.count - 1)).reversed() {
      if s[i] == "-" { continue } // ignores the original dash
      res += String(s[i].upperCase)
      count += 1

      if i != 0, count % K == 0 {
        res += "-"
      }
    }
    // The key can't begin with "-"
    if res.last == "-" {
      res.removeLast()
    }
    return String(res.reversed())
  }

  func licenseKeyFormatting2(_ S: String, _ K: Int) -> String {
    let s = S.replacingOccurrences(of: "-", with: "").reversed()
    var key: [Character] = []
    for (index, c) in s.enumerated() {
      if index > 0, index % K == 0 {
        key.append("-")
      }
      key.append(c)
    }
    return String(key.reversed()).uppercased()
  }

  func test() {
    // licenseKeyFormatting("2-4A0r7-4k", 4) == "24A0-R74K"
  }
}

private extension Character {
  var isSmallerCase: Bool {
    let a = "a".unicodeScalars.first!.value
    let z = "z".unicodeScalars.first!.value
    let selfValue = String(self).unicodeScalars.first!.value
    if a <= selfValue && selfValue <= z {
      return  true
    }
    return false
  }

  var upperCase: Character {
    if self.isSmallerCase {
      let a = "a".unicodeScalars.first!.value
      let A = "A".unicodeScalars.first!.value
      let offset: UInt32 = a - A
      let selfValue = String(self).unicodeScalars.first!.value
      return Character(UnicodeScalar(selfValue - offset)!)
    }
    return self
  }
}
