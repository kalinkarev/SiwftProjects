//: Playground - noun: a place where people can play

import UIKit

struct Book {
    let id: Int
    var title: String

    init(id: Int, title: String) {
        self.id = id
        self.title = title
    }
}

var arrayBook = [Book]()
let book1 = Book(id: 0, title: "Freeze")
let book2 = Book(id: 1, title: "Hotter")
let book3 = Book(id: 2, title: "Put")
let book4 = Book(id: 3, title: "Play")
arrayBook += [book1, book2, book3]

//arrayBook = arrayBook.map{
//    var mutatingBook = $0
//    if $0.id == 0 {
//        mutatingBook.title = "modified"
//    }
//    return mutatingBook
//}
//
//print("The changed array is: \(arrayBook)")

func changeProperty(arr: [Book]) -> [Book] {
    var newArray = arr
    newArray = newArray.map{
        var mutatingBook = $0

        if $0.id == 1 {
            mutatingBook.title = "Change"
        }
        return mutatingBook
    }
    return newArray
}

var res = changeProperty(arr: arrayBook)
print("The result array is: \(res)")

arrayBook += [book3]

func replaceValue(arr: [Book], identifier: Int) -> [Book] {
    var newArray = arr
    newArray = newArray.map{
        var mutatingBook = $0
        
        if $0.id == identifier {
            mutatingBook.title = "Replace"
        }
        return mutatingBook
    }
    return newArray
}

var r = replaceValue(arr: arrayBook, identifier: 2)
print("The output array is: \(r)")

arrayBook += [book4]

func shift(array: [Book], identifier: Int) -> [Book] {
    var newArray = array

    newArray = newArray.map{
        var mutatingBook = $0

        if $0.id == identifier {
            mutatingBook.title = "SHIFT"
        }
        return mutatingBook
    }
    return newArray
}
var showResult = shift(array: arrayBook, identifier: 3)
print("The array after chnages is: \(showResult)")







struct InboxInterests {

    var title = ""
    var eventID = 0
    var count = ""

    init(title: String, eventID: NSInteger, count: String) {
        self.title = title
        self.eventID = eventID
        self.count = count
    }
    
}

var arrayObj: [InboxInterests] = [InboxInterests]()
let post = InboxInterests(title: "test", eventID: 1, count: "test")
arrayObj.append(post)

let post1 = InboxInterests(title: "test1", eventID: 2, count: "test1")
arrayObj.append(post1)

//func replace(arr: [InboxInterests], id: Int) {
//    arr.filter({ $0.eventID == id }).first?.title = "new"
//}

arrayObj = arrayObj.map {
    var mutableObject = $0
    if $0.eventID == 1 {
        mutableObject.title = "modified"
    }
    return mutableObject
}

print("The array is: \(arrayObj)")

func changeObject(arr: [InboxInterests]) -> [InboxInterests] {
    var newArr = arr
    newArr = newArr.map {
        var mutableObj = $0
        if $0.eventID == 2 {
            mutableObj.title = "free"
        }
        return mutableObj
    }
//    print("The changed array is: \(newArr)")
    return newArr
}


var result = changeObject(arr: arrayObj)
print("The new array is: \(result)")

//changeObject(arr: arrayObj)
//print("The new array is: \(arrayObj)")

var greeting = "Hello there"
print(greeting + "!")
