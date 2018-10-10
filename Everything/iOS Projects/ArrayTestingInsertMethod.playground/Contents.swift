//: Playground - noun: a place where people can play

import UIKit

var flags : [Bool] = Array(repeating: false, count: 5)
print("The array named flags is: \(flags)")

flags.insert(true, at: 2)
print("The array named flags is: \(flags)")


var myArray = [String?]()

func insertElementAtIndex(element: String?, index: Int) {
    while myArray.count <= index {
        myArray.append("")
    }
    
    myArray.insert(element, at: index)
}
print("The array is: \(myArray)")

insertElementAtIndex(element: "new", index: 5)
print("The array is: \(myArray)")

func arrayInsertElementAtIndex(element: Bool, index: Int) {
    
    while newBooleanArray.count <= index {
        newBooleanArray.append(false)
    }

    newBooleanArray.insert(element, at: index)
}

//var newBooleanArray : [Bool] = Array(repeating: false, count: 3)
var newBooleanArray: [Bool] = []
//newBooleanArray = Array(repeating: true, count: 4)
print("The newBooleanArray is: \(newBooleanArray)")

arrayInsertElementAtIndex(element: true, index: 3)
print("The newBooleanArray after change is: \(newBooleanArray)")


var arrayBooleanTest : [Bool] = Array(repeating: false, count: 5)
print("The array is: \(arrayBooleanTest)")

arrayBooleanTest.remove(at: 2)
print("The array is: \(arrayBooleanTest)")

arrayBooleanTest.insert(true, at: 2)
print("The array is: \(arrayBooleanTest)")

extension Array {
    mutating func addElementAtSpecificPosition(array: [Bool], position: Int){
        var arr = array
        print("The array is: \(arr)")
        
        arr.remove(at: position)
        print("The array is: \(arr)")
        
        arr.insert(true, at: position)
        print("The array is: \(arr)")
    }
}

var arrayTest : [Bool] = Array(repeating: false, count: 6)
arrayTest.addElementAtSpecificPosition(array: arrayTest, position: 2)

extension Array {
    mutating func insertElementAtPosition(element: Bool, position: Int) {
        print("The new array is: \(self)")
        
        if position >= self.count {
            print("There is a problem")
        } else {
            self.remove(at: position)
        }
        print("The new array after changes is: \(self)")
    }
}

var newArray: [Bool] = Array(repeating: false, count: 5)
//newArray.insertElementAtPosition(position: 5)
newArray.insertElementAtPosition(element: true, position: 3)

func changeAnArraysElement(arr: [Bool], element: Bool, position: Int) {
    var array = arr

    print("The array is: \(array)")

    array.remove(at: position)
    print("The array is: \(array)")

    array.insert(element, at: position)
    print("The array is: \(array)")
}

var arrBool: [Bool] = Array(repeating: false, count: 5)
changeAnArraysElement(arr: arrBool, element: true, position: 2)





