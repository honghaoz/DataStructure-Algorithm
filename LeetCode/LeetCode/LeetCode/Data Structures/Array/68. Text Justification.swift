//
//  68. Text Justification.swift
//  LeetCode
//
//  Created by Honghao Zhang on 2016-11-05.
//  Copyright © 2016 Honghaoz. All rights reserved.
//

//Given an array of words and a length L, format the text such that each line has exactly L characters and is fully (left and right) justified.
//
//You should pack your words in a greedy approach; that is, pack as many words as you can in each line. Pad extra spaces ' ' when necessary so that each line has exactly L characters.
//
//Extra spaces between words should be distributed as evenly as possible. If the number of spaces on a line do not divide evenly between words, the empty slots on the left will be assigned more spaces than the slots on the right.
//
//For the last line of text, it should be left justified and no extra space is inserted between words.
//
//For example,
//words: ["This", "is", "an", "example", "of", "text", "justification."]
//L: 16.
//
//Return the formatted lines as:
//[
//"This    is    an",
//"example  of text",
//"justification.  "
//]
//Note: Each word is guaranteed not to exceed L in length.

import Foundation

class Num68_TextJustification: Solution {
	func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
		var res: [String] = []
		guard words.count > 0 else { return res }
		var words = words
		
		// Process words untile it's empty
		while words.isEmpty == false {
			let line = processOneLine(&words, maxWidth)
			res.append(line)
		}
		
		return res
	}
	
	private func processOneLine(_ words: inout [String], _ maxWidth: Int) -> String {
		guard words.count > 0 else { return "" }
		
		var pendingWords: [String] = []
		var pendingWordsCount = 0
		while true {
			guard let nextWord = words.first else {
				// no more words to process, this is the last line, left justified
				// Clean trailing space
				var lastWord = pendingWords.removeLast()
				lastWord.characters.removeLast()
				pendingWords.append(lastWord)
				pendingWordsCount -= 1
				
				let extraSpaces = maxWidth - pendingWordsCount
				var spaceString = ""
				for _ in 0..<extraSpaces {
					spaceString += " "
				}
				return pendingWords.joined(separator: "") + spaceString
			}
			
			if pendingWordsCount + nextWord.characters.count > maxWidth {
				// Cannot process next word, break and start to process this line
				break
			} else {
                // Include next words and continue
                pendingWords.append(nextWord + " ")
                words.removeFirst()
                pendingWordsCount += nextWord.characters.count + 1 // include space
            }
		}

        // Clean trailing space
		pendingWords[pendingWords.count - 1].characters.removeLast()
        pendingWordsCount -= 1
//		var lastWord = pendingWords.removeLast()
//		lastWord.characters.removeLast()
//		pendingWords.append(lastWord)

        // ["a ", "b ", "c"]
        var extraSpaces = maxWidth - pendingWordsCount
        var insertIndex = 0
        while extraSpaces > 0 {
            pendingWords[insertIndex] = pendingWords[insertIndex] + " "
            insertIndex += 1
			if pendingWords.count == 1 {
				insertIndex = 0
			} else {
				insertIndex = insertIndex % (pendingWords.count - 1) // last word has no space
			}
			extraSpaces -= 1
        }

        return pendingWords.joined(separator: "")
    }

	func test() {
		let _ = fullJustify(["This", "is", "an", "example", "of", "text", "justification."], 16)
		let _ = fullJustify(["Listen","to","many,","speak","to","a","few."], 6)
	}
}

