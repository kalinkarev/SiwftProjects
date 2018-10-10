//: Playground - noun: a place where people can play

import UIKit

//var searchDictionary:[String:String] = ["new":"old", ":)":"!!"]
//
//extension String {
//    func changeInput(dictionarySearch:[String:String]) -> String {
//        var word: String = ""
//        var final: String = ""
//
//        let spaceValue = 32
//        guard let u = UnicodeScalar(spaceValue) else {
//            fatalError("There is a problem with the space value")
//        }
//        let charSpace = Character(u)
//
//        for index in (self.indices) {
//            if (self[index] > charSpace) {
//                word.append(self[index])
//            } else {
//                word = changeSymbol(input: word, dictionarySearch: dictionarySearch)
//                word.append(self[index])
//                final.append(word)
//                word = ""
//            }
//        }
//        word = changeSymbol(input: word, dictionarySearch: dictionarySearch)
//        final.append(word)
//        return final
//    }
//
//    func changeSymbol(input: String, dictionarySearch:[String:String]) -> String {
//        var changeInput = input
//
//        for (key, value) in dictionarySearch {
//            if (changeInput == key) {
//                changeInput = value
//            }
//        }
//
//        return changeInput
//    }
//}
//
//var test = """
//            He has new car. He is very :)
//            She is new college to the office :)
//            """
//
//var result = test.changeInput(dictionarySearch: searchDictionary)
//
//var dict:[Int:String] = [1:"hello", 2:".", 3:"how", 4:"how", 5:"are", 6:"you", 7:"?"]
//
//func printDictionary(inputDict:[Int:String]) {
//    print("The dictionary is: \(inputDict)")
//}
//
//printDictionary(inputDict: dict)
//
//func iterateOverADictionary(inputDict:[Int:String]) {
//    for (key, value) in inputDict.sorted(by: <) {
//        print("The key is: \(key) and has value: \(value)")
//    }
//}
//
//iterateOverADictionary(inputDict: dict)

//// Array
//var arr: [Int] = [5, 3, 4, 6, 8, 7, 10]
//
//func printAnArray(inputArr: [Int]) {
//    print("The array is: \(inputArr)")
//}
//
//printAnArray(inputArr: arr)
//
//func printSortedArrayAscending(inputArr: [Int]) {
//    printAnArray(inputArr: inputArr.sorted(by: <))
//}
//
//func printSortedArrayDescending(inputArr: [Int]) {
//    printAnArray(inputArr: inputArr.sorted(by: >))
//}
//
//printSortedArrayAscending(inputArr: arr)
//printSortedArrayDescending(inputArr: arr)

//extension String {
//    func changeInput(dictionarySearch:[String:String]) -> String {
//        var word: String = ""
//        var final: String = ""
//
//        let spaceValue = 32
//        guard let u = UnicodeScalar(spaceValue) else {
//            fatalError("There is a problem with the space value")
//        }
//        let charSpace = Character(u)
//
//        for index in (self.indices) {
//            if (self[index] > charSpace) {
//                word.append(self[index])
//            } else {
//                word = changeSymbol(input: word, dictionarySearch: dictionarySearch)
//                word.append(self[index])
//                final.append(word)
//                word = ""
//            }
//        }
//        word = changeSymbol(input: word, dictionarySearch: dictionarySearch)
//        final.append(word)
//        return final
//    }
//
//    func changeSymbol(input: String, dictionarySearch: [String:String]) -> String {
//        var changeInput = input
//
//        for (key, value) in dictionarySearch {
//            if (changeInput == key) {
//                changeInput = value
//            }
//        }
//
//        return changeInput
//    }
//}
//
//var input = """
//            He is the best player
//            She is very happy :)
//            """
//
//var dict:[String:String] = ["best":"one of the best", "very":"awesome"]
//
//var change = input.changeInput(dictionarySearch: dict)
//print("The changed text is: \(change)")
//
//print("The ouput is: \(change)")
//
//print("")
//
//let endOfLine = 10
//guard let u = UnicodeScalar(endOfLine) else {
//    fatalError("There is a problem with the enter value")
//}
//let enterSpace = Character(u)
//
//var inputSeparatedByEnter = input.split(separator: enterSpace)
//
//for i in 0..<inputSeparatedByEnter.count {
//    print("The line \(i + 1) is: \(inputSeparatedByEnter[i])")
//}

extension String {
    func changeInput(dictionarySearch:[String:String]) -> String {
        var word: String = ""
        var final: String = ""
        
        let spaceValue = 32
        guard let u = UnicodeScalar(spaceValue) else {
            fatalError("There is a problem with the space value")
        }
        let charSpace = Character(u)
        
        for index in self.indices {
            if self[index] > charSpace {
                word.append(self[index])
            } else {
                word = changeSymbol(input: word, dictionarySearch: dictionarySearch)
                word.append(self[index])
                final.append(word)
                word = ""
            }
        }
        word = changeSymbol(input: word, dictionarySearch: dictionarySearch)
        final.append(word)
        return final
    }
    
    func changeSymbol(input: String, dictionarySearch: [String:String]) -> String {
        var changeInput = input
        
        for (key, value) in dictionarySearch {
            if (changeInput == key) {
                changeInput = value
            }
        }
        
        return changeInput
    }
}

var userInput = """
                    He is the best
                    She has new car
                    """

var searchDictionary:[String:String] = ["best":"one of the best", "car":"plane"]
var result = userInput.changeInput(dictionarySearch: searchDictionary)

print("The user has inputted:")
print(userInput)

print("The result after changes is:")
print(result)
