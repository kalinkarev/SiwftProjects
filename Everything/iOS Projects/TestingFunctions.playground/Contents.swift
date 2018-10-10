//: Playground - noun: a place where people can play

import UIKit

func changeString(_ newString: String) -> String {
    var changeString = newString
    changeString = "Hello, nice to meet you!"
    return changeString
}

var seeString = "Free, "
//var watchString = changeString(seeString)
var watchString = changeString(seeString)

func newChangeString( newString: String) -> String {
    var changeString = newString
    changeString = "New try"
    return changeString
}

var newString = "Nice to meet you"
var changeOfNewString = newChangeString(newString: newString)
