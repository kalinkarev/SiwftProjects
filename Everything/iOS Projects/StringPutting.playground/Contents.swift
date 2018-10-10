//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var searchArr:[String] = ["Hello,", "new", "she", "is"]
var putArr:[String] = ["Goodbye,", "old", "he", "was"]

//for i in 0..<searchArr.count {
//    print("The element id is: \(i) and has value: \(searchArr[i])")
//}
//
//for j in 0..<putArr.count {
//    print("The element id is: \(j) and has value: \(putArr[j])")
//}

let stringOfWords = "Hello, he is the she colleg new he she new"

var stringOfWordsArray = stringOfWords.components(separatedBy: " ")

//for word in stringOfWordsArray {
//    print("The word is: \(word)")
//}

for k in 0..<stringOfWordsArray.count {
    print("The id \(k) has word: \(stringOfWordsArray[k])")
    
    for i in 0..<searchArr.count {
//        for (s1, s2) in zip(searchArr, putArr) {
//            if stringOfWordsArray[k] == searchArr[i] {
//                print("Have found")
//                //            for (s1, s2) in zip(searchArr, putArr) {
//                stringOfWordsArray[k] = putArr[i]
//                //            }
//            }
//        }
        if stringOfWordsArray[k] == searchArr[i] {
            print("Have found")
            print("The id is: \(i)")
            stringOfWordsArray[k] = putArr[i]
        }
    }
    
}
    
//    for i in 0..<searchArr.count {
//        if stringOfWordsArray[k] == searchArr[i] {
//            print("Have found")
//            for j in 0..<putArr.count {
//                stringOfWordsArray[k] = putArr[j]
//            }
//        }
//    }
//}

print("The new array is: \(stringOfWordsArray)")

//for (index, element) in searchArr.enumerated() {
//    print(element)
//    print(putArr[index])
//}

//for (s1, s2) in zip(searchArr, putArr) {
//    print("The id is: \(s1) - \(s2)")
//}









