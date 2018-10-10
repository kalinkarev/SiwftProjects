//: Playground - noun: a place where people can play

import UIKit

let array: [String?] = ["11", "43", "26", "11", "45", "50", nil, "hello"]

var arrayWitoutOptionals: [String] = array.map { $0 ?? "" }
print(arrayWitoutOptionals)

var intArray = arrayWitoutOptionals.map { Int($0) ?? 0 }

print(intArray)

var sum: Int = 0

for j in 0..<intArray.count {
//    print("The j is: \(j)")
    print("The position j: \(j) has value: \(intArray[j])")
    sum += intArray[j]
}

print("The sum of the array is: \(sum)")

//var arrayOfStrings: [String] = []

for i in 0..<array.count {
    print("The i is: \(i+1) and has value: \(String(describing: array[i]))")
}

//let newArray = array.flatMap { $0 }

//print(newArray)

//let intArray = newArray.map { Int($0) ?? 0 }

//
//print(intArray)
//
//var dictionaryIntString:[Int:String] = [:]
//
////for i in 0..<intArray.count {
//////    print("The position: \(i + 1) has value: \(intArray[i])")
////    dictionaryIntString[i] = array[i]
////}
//
//for j in 0..<array.count {
////    print("The position: \(j + 1) has value: \(array[j])")
//    dictionaryIntString[j] = array[j]
//}
//
//for (key, value) in dictionaryIntString.sorted(by: <) {
//    print("The key: \(key) has value: \(value)")
//}
//
//var numberOfValuesInArray: Int = 4
//
//var newArray: [Int] = []
//
//print("The new array has: \(newArray.count)")
//
//for i in 0..<numberOfValuesInArray {
//    print("The i is: \(i)")
//    newArray.append(i)
//    print("\(i) has value: \(newArray[i])")
//}
//
//print("The new array has: \(newArray.count)")
//
//var c: Int = 5
//
//var n: [Int] = []
//
//var j = 0
//var number = 10
//
//repeat {
//    j  = j + 1
//    print("The j variable is: \(j)")
//} while (j < number)
//
//var number: Int = 5
//
//var arr = [Int](number)
//
//print(arr)

let text: String = "12345"
var digits = [Int]()

for element in text.characters {
    digits.append(Int(String(element))!)
}

print(digits)
