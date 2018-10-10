//: Playground - noun: a place where people can play

import UIKit

////var someDict = [Int : String]()
////
////var someDict:[Int:String] = [1:"One", 2:"Two", 3:"Three"]
////
////var cities = ["Delhi", "Bangalore", "Hyderabad"]
////var distance = [2000, 10, 620]
////
////let cityDistanceDict = Dictionary(uniqueKeysWithValues: zip(cities, distance))
////
////// Filtering values from a dictionary
////var closeCities = cityDistanceDict.filter { $0.value < 1000 }
//
//// Grouping of Dictionary values
//var cities = ["Delhi", "Banalore", "Hyderabad", "Dehradun", "Bihar"]
//
//var GroupedCities = Dictionary(grouping: cities) { $0.first! }
//print("The grouped cities are: \(GroupedCities)")
//
////var someVar = someDict[key]
//
//
//var someDict:[Int:String] = [1:"One", 2:"Two", 3:"Three"]
////var oldVal = someDict.updateValue("New value of one", forKey: 1)
////var oldVal = someDict[1]
////someDict[1] = "New value of one"
////var someVar = someDict[1]
////var removeValue = someDict.removeValue(forKey: 2)
////someDict[2] = nil
//
//
////print("Old value of key = 1 is \(String(describing: oldVal))")
//
////for i in 1...someDict.count {
////    print("Value of key = \(i) has value \(String(describing: someDict[i]))")
////}
//
//for (key, value) in someDict.enumerated() {
//    print("Dictionary key \(key) - Dictionary value \(value)")
//}
//
//let dictKeys = [Int](someDict.keys)
//let dictValues = [String](someDict.values)
//
//print("Print Dictionary Keys")
//
//for (key) in dictKeys {
//    print("\(key)")
//}
//
//print("Print Dictionary Values")
//
//for (value) in dictValues {
//    print("\(value)")
//}
//
//var someDict1:[Int:String] = [1:"One", 2:"Two", 3:"Three"]
//var someDict2:[Int:String] = [4:"Four", 5:"Five"]
//var someDict3:[Int:String] = [Int:String]()
//
//print("Total items in someDict1 = \(someDict1.count)")
//print("Total items in someDict2 = \(someDict2.count)")
//
//print("someDict1 = \(someDict1.isEmpty)")
//print("someDict2 = \(someDict2.isEmpty)")
//print("someDict3 = \(someDict3.isEmpty)")


var searchWords: [String : String] = [
    "old":"new",
    "he":"she",
    "car":"plane"
]

var input = "he has old car and she is driving the new one"
var inputArray = input.components(separatedBy: " ")



for k in 0..<inputArray.count {
    for (key, value) in searchWords {
        if inputArray[k] == key {
            inputArray[k] = value
        }
    }
}
print("The new array is: \(inputArray)")


//var dict:[String:String] = ["new":"old", "he":"she", "car":"plane"]
//
////componentArray = Array(dict.keys) // for Dictionary
//
//var searchArray = Array(dict.keys)
//
////print("The keys in the dictionary are: \(searchArray)")
//
//var putArray = Array(dict.values)
////print("The values in the dictionary are: \(putArray)")
//
//
//var inputString = "he has new car and she is driving the new one"
////print("The input is: \(inputString)")
//
//var inputArray = inputString.components(separatedBy: " ")
//print("The array of the input is: \(inputArray)")
//
//for k in 0..<inputArray.count {
//    print("The words are: \(inputArray[k])")
//
//    for (key, value) in dict {
//        print("The key is: \(key)")
//        if inputArray[k] == key {
////            print("Have found")
//            inputArray[k] = value
//        }
//    }
//
//}
//
//print("The new array is: \(inputArray)")





























