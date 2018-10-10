//: Playground - noun: a place where people can play

import UIKit
//
//extension String {
//    func valueDictionary(dict:[String:String]) -> String {
//        if dict.keys.contains(self) {
//            print("Have found")
//            return dict[self]!
//        } else {
//            print("No matches found")
//            return ""
//        }
//    }
//}
//
//var testDictionary:[String:String] = ["new":"old", "next":"previous"]
//
//var test = "new".valueDictionary(dict: testDictionary)

extension String {
    func changeInput(dictionarySearch:[String:String]) -> String {
        var word:String = ""
        var final:String = ""
        
        let spaceValue = 32
        guard let u = UnicodeScalar(spaceValue) else {
            fatalError("Problems with the unwrapping of space value")
        }
        let charSpace = Character(u)
        
        for index in (self.indices) {
            if (self[index] > charSpace) {
                word.append(self[index])
            } else {
                word = changeWord(dictionarySearch: dictionarySearch)
                word.append(self[index])
                final.append(word)
                word = ""
            }
        }
        word = changeWord(dictionarySearch: dictionarySearch)
        final.append(word)
        return final
    }
    
    func changeWord(dictionarySearch:[String:String]) -> String {
        if dictionarySearch.keys.contains(self) {
            return dictionarySearch[self]!
        } else {
            return self
        }
    }
}

//func changeWord(dictionarySearch:[String:String]) -> String {
//    if dictionarySearch.keys.contains(self) {
//        return dictionarySearch[self]!
//    }
//    return self
//}


//extension String {
//    func changeInput(dictSearch:[String:String]) -> String {
//        var word = ""
//        var final = ""
//
//        let spaceValue = 32
//        guard let u = UnicodeScalar(spaceValue) else {
//            fatalError("Problems with the space value")
//        }
//        let charSpace = Character(u)
//
//        for index in self.indices {
//            if self[index] > charSpace {
//                word.append(self[index])
//            } else {
//                word = changeWord(dictionarySearch: dictSearch)
//                word.append(self[index])
//                final.append(word)
//                word = ""
//            }
//        }
//
//        word = changeWord(dictionarySearch: dictSearch)
//        final.append(word)
//        return final
//    }
//
////    func changeWord(dictionarySearch:[String:String]) -> String {
////        var changeWord = self
////
////        if dictionarySearch.keys.contains(changeWord) {
////            changeWord = dictionarySearch[changeWord]!
////        }
////
////        return changeWord
////    }
//
//    func changeWord(dictionarySearch:[String:String]) -> String {
//        if dictionarySearch.keys.contains(self) {
//            return dictionarySearch[self]!
//        }
//
//        return self
//    }
//
//}

//func changeWord(dictionarySearch:[String:String]) -> String {
//    if dictionarySearch.keys.contains(self) {
//        return dictionarySearch[self]!
//    }
//    return self
//}


var dictTest:[String:String] = ["new":"old", "first":"last", "next":"previous"]

var input = """
                he took the first place on the competition last one
                she is the next new
            """

//var result = input.changeInput(dictSearch: dictTest)
var result = input.changeInput(dictionarySearch: dictTest)
print(result)


var arrTest:[String] = ["New", "Old", "Free", "Busy", "Play", "Pause"]

func printAnArray(newArr:[String]) {
    print("The array is: \(newArr)")
}
printAnArray(newArr: arrTest)

func iterateOverArray(newArr:[String]) {
    for i in 0..<newArr.count {
        print("The \(i + 1) element has value \(newArr[i])")
    }
}
iterateOverArray(newArr: arrTest)


print("")
var testDictionary:[String:String] = ["New":"Old", "Free":"Busy", "Play":"Pause"]

func printADictionary(newDict:[String:String]) {
    print("The dictionary is: \(newDict)")
}
printADictionary(newDict: testDictionary)

func iterateOverDictionary(newDict:[String:String]) {
    for (key, value) in newDict.sorted(by: >) {
        print("The key: \(key) has value: \(value)")
    }
}
iterateOverDictionary(newDict: testDictionary)

let ingredients: Set = ["cocoa beans", "sugar", "cocoa butter", "salt"]
if ingredients.contains("sugar") {
    print("No thanks, too sweet.")
}

var primes: Set = [2, 3, 5, 7]

// Tests whether primes is a subset of a Range<Int>
print(primes.isSubset(of: 0..<10))

// Performs an intersection with an Array<Int>
let favoriteNumbers = [5, 7, 15, 21]
print(primes.intersection(favoriteNumbers))

if primes.isEmpty {
    print("No primes!")
} else {
    print("We have \(primes.count) primes.")
}

let primeSum = primes.reduce(0, +)

let primeStrings = primes.sorted(by: <)

for number in primes {
    print(number)
}

let morePrimes = primes.union([11, 13, 17, 19])

let laterPrimes = morePrimes.filter( {$0 > 10} )

func printASet(newSet:Set<Int> = []) {
    print("The set is: \(newSet)")
}
printASet(newSet: primes)

func iterateOverSet(newSet:Set<Int> = []) {
    for i in 0..<newSet.count {
        print("The element: \(i + 1) has value: \(newSet)")
    }
}
iterateOverSet(newSet: primes)

func findSetElement(newSet:Set<Int> = []) {
//    for ind in newSet.indices {
//        let element = newSet[ind]
//        print("The id: \(ind) has value: \(element)")
//    }
    for ind in newSet.indices {
        let element = newSet[ind]
        for i in 0..<newSet.count{
            print("The element is: \(element) and has id: \(i)")
        }
    }
}
findSetElement(newSet: primes)

print("")
// create a set
var mySet: Set = ["one", "two", "three", "four"]

// iterate over all items in the set
for item in mySet {
    print(item)
}

let testSet: Set = ["a", "b", "c", "d"]
testSet[testSet.index(testSet.startIndex, offsetBy: 2)]


var foodSet:Set = ["Salad", "Chips", "Sandwiches"]
var otherFoodsSet:Set = ["Quiche", "Donuts"]
var entreeSet:Set = ["Salad", "Sandwiches"]
var dessertsSet:Set = ["Chips", "Ice Cream", "Donuts"]

var moreFoods = foodSet.union(otherFoodsSet)

otherFoodsSet.formUnion(foodSet)

otherFoodsSet.subtract(entreeSet)
otherFoodsSet.intersection(dessertsSet)
foodSet.symmetricDifference(dessertsSet)

var dict:[String:String] = ["NEW":"OLD", "BEST":"WORST", "FIRST":"LAST"]

printADictionary(newDict: dict)
iterateOverDictionary(newDict: dict)


print("\n")
var dictionaryF:[Int:String] = [1:"ONE", 2:"TWO", 3:"THREE", 4:"FOUR", 5:"FIVE"]

//func iterateOverDictionary(newDict:[String:String]) {
//    for (key, value) in newDict.sorted(by: >) {
//        print("The key: \(key) has value: \(value)")
//    }
//}

func iterateOverSpecificDictionaryDescending(inputDictionary:[Int:String]) {
    for (key, value) in inputDictionary.sorted(by: >) {
        print("The key: \(key) has value: \(value)")
    }
}
iterateOverSpecificDictionaryDescending(inputDictionary: dictionaryF)

func iterateOverSpecificDictionaryAscending(inputDictionary:[Int:String]) {
    for (key, value) in inputDictionary.sorted(by: <) {
        print("The key: \(key) is with value: \(value)")
    }
}
iterateOverSpecificDictionaryAscending(inputDictionary: dictionaryF)

func printASpecificDictionary(inputDictionary:[Int:String]) {
    for (key, value) in inputDictionary {
        print("The key: \(key) has value: \(value)")
    }
}
printASpecificDictionary(inputDictionary: dictionaryF)

//var res = printASpecificDictionary(inputDictionary: dictionaryF)
//print(res)

//var output = printASpecificDictionary(inputDictionary: dictionaryF)
//print("The result is: \n \(printASpecificDictionary(inputDictionary: dictionaryF))")
