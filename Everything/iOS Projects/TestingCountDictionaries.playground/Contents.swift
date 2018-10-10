//: Playground - noun: a place where people can play

import UIKit

var dictionaryTest: [Int : Int] = [:]

var number: Int = 10

var arrayWithTheKeys: [Int] = []
print("The array is: \(arrayWithTheKeys)")

for i in 0..<number {
    print("The i is: \(i)")
    arrayWithTheKeys.append(i)
}

print("The array is: \(arrayWithTheKeys)")

for j in 0..<arrayWithTheKeys.count {
    print("The value of j is: \(j)")
    dictionaryTest[j] = j
}

for (key, value) in dictionaryTest {
    print("The key: \(key) has value: \(value)")
}

print("The enumerated function on sicitonary is: \(dictionaryTest.enumerated())")

var arrayWithKeysDictionaries = Array(dictionaryTest.keys)
print("The array of keys is: \(arrayWithKeysDictionaries)")

//let sortedKeys = Array(dictionaryTest.keys).sorted(by: <)

//let sortedDictionary = dictionaryTest.keys.sorted(by: <)

let sortedKeysDict = dictionaryTest.sorted(by: { $0.key > $1.key }).flatMap({ $0.value })

print("The new dictionary is: \(sortedKeysDict)")

let myDictionary = ["name1":"Loy", "name3":"Ray", "name4":"Valq", "name2":"Bibi"]
let sorted = myDictionary.sorted {$0.key < $1.key}

print(sorted)

let dictionaryIntInt : [Int:Int] = [8:3, 2:4, 4:2, 5:1, 6:1, 7:2, 0:6, 1:5, 3:3]
print("The dictionary is: \(dictionaryIntInt)")

let sortedDictionary = dictionaryIntInt.sorted { $0.key < $1.key }
print("The sorted dictionary is: \(sortedDictionary)")

var arrayKeys: [Int] = []
var arrayValues: [Int] = []

for (k, v) in sortedDictionary {
    print("The keys are: \(k)")
    arrayKeys.append(k)
    print("The values are: \(v)")
    arrayValues.append(v)
}

print("The array of keys is: \(arrayKeys)")
print("The array of values is: \(arrayValues)")


print("New TEST")


struct Book {
    var id: Int
    var name: String
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

func printTheArray() {
    print("The array is: \(arrayBooks)")
}

var arrayBooks: [Book] = []
printTheArray()

var book1 = Book(id: 0, name: "Book1")
arrayBooks.append(book1)
printTheArray()
var book2 = Book(id: 1, name: "Book2")
arrayBooks.append(book2)
printTheArray()
var book3 = Book(id: 2, name: "Book3")
arrayBooks.append(book3)
printTheArray()

arrayBooks = arrayBooks.map {
    var mutatingBook = $0

    if $0.id == 1 {
        mutatingBook.name = "NewBook2"
    }
    return mutatingBook
}

printTheArray()
