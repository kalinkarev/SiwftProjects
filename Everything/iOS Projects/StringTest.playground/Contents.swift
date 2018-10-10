////: Playground - noun: a place where people can play
//
//import UIKit
//
//let message = "[img][img][/img][/img]"
//if (message.isEmpty) {
//    print("You haven`t inputted a string")
//} else {
//    print(message.first!)
//}
//
//print(message.last as Any)
//
//var lastCharacter = message.last
//var lastImgTag = lastCharacter
//
//var firstCharacter = message.first
//var fourthCharacter = firstCharacter
//
//var fullInput = message.components(separatedBy: "[")
//
//let firstPart = fullInput[0]
//var secondPart = fullInput[1]
//let thirdPart = fullInput[2]
//var fourthPart = fullInput[3]
//var fifthPart = fullInput[4]
//
//let firstWordToRemove = "/img]"
//if let range = fourthPart.range(of: firstWordToRemove) {
//    fourthPart.removeSubrange(range)
//}
//
//if let range = fifthPart.range(of: firstWordToRemove) {
//    fifthPart.removeSubrange(range)
//}
//
////let firstWordToRemove = "/img]"
////if let range = fullInput.range(of: firstWordToRemove) {
////    fullInput.removeSubrange(range)
////}
//
////let firstWordToRemove = "img]"
////if let range = secondPart.range(of: firstWordToRemove) {
////    secondPart.removeSubrange(range)
////}
//
////let fullInput = s?.components(separatedBy: "[")
////let firstPart = fullInput![0]
////var secondPart = fullInput![1]
////print("The first part of the input is: \(firstPart)")
////print("The second part of the input is: \(secondPart)")


var name = "Svetlin Yordanov"
var firstLetterOfNameValue = name.first
var lastLetterOfNameValue = name.last

var testString = "[img][img][img]hello[/img][/img][/img]"
print(testString)

var searchedStringStart = "[img]"
var searchedStringEnd = "[/img]"

var counter = 0

var firstIndex = testString.first

var numbeOfArrays = testString.split(separator: "/")
print("The number of arrays is: \(numbeOfArrays)")

counter = numbeOfArrays.count
print("The counter is: \(counter)")

var numberOfTimesTagInTag = counter - 2
print("The number of tags in tags is: \(numberOfTimesTagInTag)")
























