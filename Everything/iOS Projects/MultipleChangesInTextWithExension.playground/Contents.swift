////: Playground - noun: a place where people can play
//
//import UIKit
//
//var searchArr:[String] = ["Hello,", "new", "she", "is"]
//var putArr:[String] = ["Goodbye,", "old", "he", "was"]
//
//let stringOfWords = "Hello, he is the she colleg new he she new"
//
//var stringOfWordsArray = stringOfWords.components(separatedBy: " ")
//
//for k in 0..<stringOfWordsArray.count {
//    print("The id \(k) has word: \(stringOfWordsArray[k])")
//
//    for i in 0..<searchArr.count {
//        if stringOfWordsArray[k] == searchArr[i] {
////            print("Have found")
////            print("The id is: \(i)")
//            stringOfWordsArray[k] = putArr[i]
//        }
//    }
//
//}
//
//print("The new array is: \(stringOfWordsArray)")
//
//extension String {
//    func changeInput( searchedWords: [String], puttedWords: [String]) -> [String] {
//
//        let userInput = self
//        var userInputArray = userInput.components(separatedBy: " ")
//
//        for k in 0..<userInputArray.count {
//            for i in 0..<searchedWords.count {
//                if userInputArray[k] == searchedWords[i] {
//                    userInputArray[k] = puttedWords[i]
//                }
//            }
//        }
//
//        return userInputArray
//    }
//}
//
//var userEnter = "Hello, he is the new coleg, she is the best driver"
//var userEnterArray = userEnter.components(separatedBy: " ")
//
//var result = userEnter.changeInput(searchedWords: searchArr, puttedWords: putArr)
//print("The result is: \(result)")
//
//
//
//
//
//

//extension String {
//    func inputTextWithChange( searchArr: [String], putArr: [String]) -> String {
//        let input = self
//        var word: String = ""
//        var final: String = ""
//
//        let spaceValue = 32
//        guard let u = UnicodeScalar(spaceValue) else {
//            fatalError("Error with the space character")
//        }
//        let charSpace = Character(u)
//
//        for index in (input.indices) {
//            if (input[index] > charSpace) {
//                print("The word is: \(word)")
//                word.append(input[index])
//            } else {
//                word = changeSymbol(searching: searchArr , putting: putArr)
//                word.append(input[index])
//                final.append(word)
//                word = ""
//            }
//        }
//        word = changeSymbol(searching: searchArr, putting: putArr)
//        final.append(word)
//        return final
//    }
//
//    func changeSymbol( searching: [String], putting: [String]) -> String {
//        var changeInput = self
//
//        for i in 0..<searching.count {
//            if changeInput == searching[i] {
//                changeInput = putting[i]
//                print("Have found")
//            }
//        }
//        return changeInput
//    }
//}
//
//var searchSymbols: [String] = [":)", "new"]
//var putSymbols: [String] = ["!!", "old"]
//
//var input = "He is new :)"
//var result = input.inputTextWithChange(searchArr: searchSymbols, putArr: putSymbols)

//var searchSymbols: [String] = [":)", "new"]
//var putSymbols: [String] = ["!!", "old"]
//
//func inputTextWithChange(input: String, searching: [String], putting: [String]) -> String {
//    var word: String = ""
//    var final: String = ""
//
//    let spaceValue = 32
//    guard let u = UnicodeScalar(spaceValue) else {
//        fatalError("Error with the space character")
//    }
//    let charSpace = Character(u)
//    for index in (input.indices) {
//        if (input[index] > charSpace) {
//            word.append(input[index])
//        } else {
//            word = changeSymbol(newInput: word, searching: searchSymbols, putting: putSymbols)
//            word.append(input[index])
//            final.append(word)
//            word = ""
//        }
//    }
//    word = changeSymbol(newInput: word, searching: searchSymbols, putting: putSymbols)
//    final.append(word)
//    return final
//}
//
//func changeSymbol( newInput: String, searching: [String], putting: [String]) -> String {
//    var changeInput = newInput
//
//    for i in 0..<searchSymbols.count {
//        if changeInput == searchSymbols[i] {
//            changeInput = putSymbols[i]
//        }
//    }
//    return changeInput
//}
//
//var input = "He is the new guy :)"
//var result = inputTextWithChange(input: input, searching: searchSymbols, putting: putSymbols)

//var searchSymbols: [String] = [":)", "new"]
//var putSymbols: [String] = ["!!", "old"]
//
//extension String {
//    func inputTextWithChange(searching: [String], putting: [String]) -> String {
//        let input = self
//        var word: String = ""
//        var final: String = ""
//
//        let spaceValue = 32
//        guard let u = UnicodeScalar(spaceValue) else {
//            fatalError("Error with the space character")
//        }
//        let charSpace = Character(u)
//        for index in (input.indices) {
//            if (input[index] > charSpace) {
//                word.append(input[index])
//            } else {
//                word = changeSymbol(newInput: word, searching: searching, putting: putting)
//                word.append(input[index])
//                final.append(word)
//                word = ""
//            }
//        }
//        word = changeSymbol(newInput: word, searching: searching, putting: putting)
//        final.append(word)
//        return final
//    }
//
//    func changeSymbol( newInput: String, searching: [String], putting: [String]) -> String {
//        var changeInput = newInput
//
//        for i in 0..<searching.count {
//            if changeInput == searching[i] {
//                changeInput = putting[i]
//            }
//        }
//        return changeInput
//    }
//}
//
//var input = "He is the new guy :)"
//var result = input.inputTextWithChange(searching: searchSymbols, putting: putSymbols)



//var searchDictionary: [String:String] = ["new":"old", ":)":"!!"]
//
//extension String {
//    func inputTextWithChange( dictionarySearch:[String:String]) -> String {
//        let input = self
//        var dictionaryKeys = dictionarySearch.keys
//        var dictionaryValues = dictionarySearch.values
//
//        var word: String = ""
//        var final: String = ""
//
//        let spaceValue = 32
//
//        guard let u = UnicodeScalar(spaceValue) else {
//            fatalError("There is a problem with the space value")
//        }
//
//        let charSpace = Character(u)
//
//        for index in (input.indices) {
//            if (input[index] > charSpace) {
//                word.append(input[index])
//            } else {
//                //                word = changeSymbol(newInput: word, searching: searching, putting: putting)
//                //                word = changeSymbol(newInput: word, dictionarySearch: [searching as! String:putting as! String])
//                word = changeSymbol(newInput: word, dictionarySearch: [dictionaryKeys:dictionaryValues])
//                word.append(input[index])
//                final.append(word)
//                word = ""
//            }
//        }
//        //        word = changeSymbol(newInput: word, searching: searching, putting: putting)
//        //        word = changeSymbol(newInput: word, dictionarySearch: [searching as! String:putting as! String])
//        final.append(word)
//        return final
//    }
//
//    func changeSymbol(newInput: String, dictionarySearch: [String:String]) -> String {
//        var changeInput = newInput
//
//        for (key, value) in dictionarySearch {
//            if changeInput == key {
//                changeInput = value
//            }
//        }
//
//        return changeInput
//    }
//}
//
//var user = "He is the new one :)"
//var result = user.inputTextWithChange(dictionarySearch: searchDictionary)

//var testDictionary: [String:String] = ["new":"old", "last":"first"]
//
//func printDictionary(input:[String:String]) {
//    print("The dictionary is: \(input)")
//}
//
//print(testDictionary)

extension String {
    func inputTextWithChange( dict:[String:String]) -> String {
        let input = self
        
        var word: String = ""
        var final: String = ""
        
        let spaceValue = 32
        
        guard let u = UnicodeScalar(spaceValue) else {
            fatalError("Problem with the space value")
        }
        
        let charSpace = Character(u)
        
        for index in (input.indices) {
            if (input[index] > charSpace) {
                word.append(input[index])
            } else {
                word = changeSymbol(newInput: word, dictionarySearch: dict)
                word.append(input[index])
                final.append(word)
                word = ""
            }
        }
        
        word = changeSymbol(newInput: word, dictionarySearch: dict)
        final.append(word)
        return final
    }
    
    func changeSymbol(newInput: String, dictionarySearch: [String:String]) -> String {
        var changeInput = newInput
        
        for (key, value) in dictionarySearch {
            if changeInput == key {
                changeInput = value
            }
        }
        
        return changeInput
    }
}

var searchDictionary: [String:String] = ["new":"old", "last":"first"]

var userInput = "He has new car, which is why this car will be the last of this type"
var result = userInput.inputTextWithChange(dict: searchDictionary)
