//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

extension String {
    func changeInput(dict:[String:String]) -> String {
        var word = ""
        var final = ""
        
        let spaceValue = 32
        guard let u = UnicodeScalar(spaceValue) else {
            fatalError("Problems with the space value")
        }
        let charSpace = Character(u)
        
        for index in self.indices {
            if self[index] > charSpace {
                word.append(self[index])
            } else {
//                word = word.changeWord(dictionarySearch: dict)
                word.append(self[index])
                final.append(word)
                word = ""
            }
        }
//        word = word.changeWord(dictionarySearch: dict)
        final.append(word)
        return final
    }
    
    func changeWord(dictionarySearch:[String:String]) -> String {
        var changeWord = self

        if dictionarySearch.keys.contains(changeWord) {
             changeWord = dictionarySearch[changeWord]!
        }
        return changeWord
    }
    
//    func changeWord(dictionarySearch:[String:String]) -> String {
//        var changeWord = self
//
//        if dictionarySearch.keys.contains(changeWord) {
//            changeWord = dictionarySearch[changeWord]!
//        }
//        return changeWord
//    }
}

var dictSearch:[String:String] = ["first":"last", "next":"previous", "new":"old", "last":"this"]
var userInput = """
he took the first place on the competition last one
she is the next new
"""
var result = userInput.changeInput(dict: dictSearch)
print("")
print("The output is:")
print(result)

