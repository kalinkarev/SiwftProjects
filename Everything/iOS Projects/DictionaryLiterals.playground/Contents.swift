//: Playground - noun: a place where people can play

import UIKit

let recordTimes: DictionaryLiteral = [
    "Florence Griffith-Joyner" : 10.49,
    "Evelyn Ashford" : 10.76,
    "Evelyn Ashford" : 10.79,
    "Marlies Gohr" : 10.81
]

print(recordTimes.first!)

//let runner = "Marlies Gohr"
//if let index = recordTimes.first(where: { $0.0 == runner }) {
//    let time = recordTimes[index].1
//    print("\(runner) set a 100m record of \(time) seconds.")
//} else {
//    print("\(runner) couldn`t be found in the records.")
//}

struct IntPairs {
    var elements: [(Int, Int)]
    
    init(_ elements: DictionaryLiteral<Int, Int>) {
        self.elements = Array(elements)
    }
}

let pairs = IntPairs([1: 2, 1: 1, 3: 4, 2: 1])
print(pairs.elements)

//var dictionary: [String:Int]

var dictionary: [String:Int] = [
    "one" : 1,
    "two" : 2,
    "three" : 3
]

var emptyDictionary: [Int : Int] = [:]

//var stringsAsInts: [String : Int] = [
//    "zero": 0,
//    "one": 1,
//    "two": 2,
//    "three": 3,
//    "four": 4,
//    "five": 5,
//    "six": 6,
//    "seven": 7,
//    "eight": 8,
//    "nine": 9
//]

//stringsAsInts["zero"]
//stringsAsInts["three"]
//stringsAsInts["ten"]
//
//// Unwraping the optional using optional binding
//if let twoAsInt = stringsAsInts["two"] {
//    print(twoAsInt)
//}
//
//// Unwraping the optional using the forced value operator (!)
//stringsAsInts["one"]!

//var userInfo: [String: String] = [
//    "first_name": "Andrei",
//    "last_name": "Puni",
//    "job_title": "Mad scientist"
//]
//
//for (key, value) in userInfo {
//    print("The key is \(key) nad has value: \(value)")
//}
//
//print(userInfo.count)

var stringsAsInts: [String:Int] = [
    "zero": 0,
    "one": 1,
    "two": 2
]

stringsAsInts["three"] = 3

stringsAsInts["three"] = 10


stringsAsInts.updateValue(3, forKey: "three")
stringsAsInts.updateValue(10, forKey: "three")

stringsAsInts.updateValue(4, forKey: "two")

for (key, value) in stringsAsInts {
    print("The key is \(key) nad has value: \(value)")
}

print("----------------------------------")

stringsAsInts["three"] = nil
for (key, value) in stringsAsInts {
    print("The key is \(key) and has value: \(value)")
}

print("------------------------------------------")

stringsAsInts.removeValue(forKey: "one")

for (key, value) in stringsAsInts {
    print("The key is \(key) and has value: \(value)")
}

var powersOfTwo = [
    1: 2,
    2: 4,
    3: 8,
    4: 16
]

print("New test: ")

var userInfo = [
    "first_name": "Silviu",
    "last_name": "Pop",
    "job_title": "evil genius"
]

for (key, value) in userInfo {
    print("The key is: \(key) and has value: \(value)")
}

var justACopy = stringsAsInts

justACopy["zero"] = 100

print(stringsAsInts)
print(justACopy)





var newDictionary: [Int: String] = [
    1: "One",
    2: "Two",
    3: "Three",
    4: "Four",
    5: "Five"
]

//print("The dictionary is: \(newDictionary)")

for (key, value) in newDictionary {
    print("The key is \(key) and has value \(value)")
}

newDictionary[2] = "Two times"

print("")
print("The new dictionary is: ")

for (key, value) in newDictionary {
    print("The key is \(key) and has value \(value)")
}

newDictionary[3] = "Three times"
print("")

for (key, value) in newDictionary {
    print("The key is \(key) and has value \(value)")
}

print("The number of elements in the dictionary is: \(newDictionary.count)")


//if let twoAsInt = stringsAsInts["two"] {
//    print(twoAsInt)
//}

if let firstElement = newDictionary.first {
    print("The first element is: \(firstElement)")
}

//print("The first element is: \(String(describing: newDictionary.first))")

print("Hello World")












