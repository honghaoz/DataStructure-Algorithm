// 937_Reorder Data in Log Files
// https://leetcode.com/problems/reorder-data-in-log-files/
//
// Created by Honghao Zhang on 9/20/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// You have an array of logs.  Each log is a space delimited string of words.
//
//For each log, the first word in each log is an alphanumeric identifier.  Then, either:
//
//Each word after the identifier will consist only of lowercase letters, or;
//Each word after the identifier will consist only of digits.
//We will call these two varieties of logs letter-logs and digit-logs.  It is guaranteed that each log has at least one word after its identifier.
//
//Reorder the logs so that all of the letter-logs come before any digit-log.  The letter-logs are ordered lexicographically ignoring identifier, with the identifier used in case of ties.  The digit-logs should be put in their original order.
//
//Return the final order of the logs.
//
//
//
//Example 1:
//
//Input: logs = ["dig1 8 1 5 1","let1 art can","dig2 3 6","let2 own kit dig","let3 art zero"]
//Output: ["let1 art can","let3 art zero","let2 own kit dig","dig1 8 1 5 1","dig2 3 6"]
//
//
//Constraints:
//
//0 <= logs.length <= 100
//3 <= logs[i].length <= 100
//logs[i] is guaranteed to have an identifier, and a word after the identifier.
//

import Foundation

class Num937 {
  /// Stupid questions, too many edge cases.
  func reorderLogFiles(_ logs: [String]) -> [String] {
    let digs = logs.filter {
      return [Character]([Character]($0).split(separator: " ")[1])[0].isNumber
    }
    let lets = logs.filter {
      return [Character]([Character]($0).split(separator: " ")[1])[0].isLetter
    }
    return lets.sorted {
      let firstWord = $0.split(separator: " ")[1...].joined(separator: " ")
      let secondWord = $1.split(separator: " ")[1...].joined(separator: " ")
      if firstWord == secondWord {
        return $0.split(separator: " ")[0] < $0.split(separator: " ")[1]
      }
      return firstWord < secondWord
      } + digs
  }
}

extension Character {
  var isLetter: Bool {
    return Character("a").asciiValue! <= self.asciiValue! && self.asciiValue! <= Character("z").asciiValue!
  }
  var isNumber: Bool {
    return Character("0").asciiValue! <= self.asciiValue! && self.asciiValue! <= Character("9").asciiValue!
  }
}
