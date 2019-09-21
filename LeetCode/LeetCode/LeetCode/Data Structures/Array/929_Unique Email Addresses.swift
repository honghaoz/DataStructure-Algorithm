// 929. Unique Email Addresses.swift
// https://leetcode.com/problems/unique-email-addresses/
//Every email consists of a local name and a domain name, separated by the @ sign.
//
//For example, in alice@leetcode.com, alice is the local name, and leetcode.com is the domain name.
//
//Besides lowercase letters, these emails may contain '.'s or '+'s.
//
//If you add periods ('.') between some characters in the local name part of an email address, mail sent there will be forwarded to the same address without dots in the local name.  For example, "alice.z@leetcode.com" and "alicez@leetcode.com" forward to the same email address.  (Note that this rule does not apply for domain names.)
//
//If you add a plus ('+') in the local name, everything after the first plus sign will be ignored. This allows certain emails to be filtered, for example m.y+name@email.com will be forwarded to my@email.com.  (Again, this rule does not apply for domain names.)
//
//It is possible to use both of these rules at the same time.
//
//Given a list of emails, we send one email to each address in the list.  How many different addresses actually receive mails?
//
//
//
//Example 1:
//
//Input: ["test.email+alex@leetcode.com","test.e.mail+bob.cathy@leetcode.com","testemail+david@lee.tcode.com"]
//Output: 2
//Explanation: "testemail@leetcode.com" and "testemail@lee.tcode.com" actually receive mails
//
//
//Note:
//
//1 <= emails[i].length <= 100
//1 <= emails.length <= 100
//Each emails[i] contains exactly one '@' character.
//All local and domain names are non-empty.
//Local names do not start with a '+' character.

import Foundation

class Num929_Solution {
  func numUniqueEmails(_ emails: [String]) -> Int {
    return Set(emails.map { self.sanitizedEmail($0) }).count
  }

  private func sanitizedEmail(_ email: String) -> String {
    let components = email.split(separator: "@") // String.Subsquence == Substring
    let local = components[0]
    let domain = components[1]

    var processedLocal = local.filter { $0 != "." } // filter returns String
    if let plusIndex = processedLocal.firstIndex(of: "+") {
      processedLocal = String(processedLocal[processedLocal.startIndex..<plusIndex])

    }
    return processedLocal + "@" + domain
  }

  private func sanitizedEmail2(_ email: String) -> String {
    let components = email.split(separator: "@")
    let local = components[0]
    let domain = components[1]

    let newLocal = String(local[local.startIndex..<(local.firstIndex(of: "+") ?? local.endIndex)])
    return newLocal.replacingOccurrences(of: ".", with: "") + "@" + domain
  }
}
