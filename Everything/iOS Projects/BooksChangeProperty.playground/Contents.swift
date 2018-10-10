//: Playground - noun: a place where people can play

import UIKit

struct Object {
    var id: Int
    var title: String

    init(id: Int, title: String) {
        self.id = id
        self.title = title
    }
}

var arrayObjects = [Object]()
var object1 = Object(id: 0, title: "Hello")
arrayObjects.append(object1)
var object2 = Object(id: 1, title: "Nice")
arrayObjects.append(object2)
var object3 = Object(id: 2, title: "To")
arrayObjects.append(object3)
var object4 = Object(id: 3, title: "Meet")
arrayObjects.append(object4)
var object5 = Object(id: 4, title: "You")
arrayObjects.append(object5)

arrayObjects = arrayObjects.map {
    var mutableObject = $0
    if $0.id == 3 {
        mutableObject.title = "Meeting"
    }
    return mutableObject
}

print("The array is: \(arrayObjects)")

struct Rocket {
    var id: Int
    var name: String

    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

var arrayRockets = [Rocket]()
var rocket1 = Rocket(id: 0, name: "rocket1")
arrayRockets.append(rocket1)
var rocket2 = Rocket(id: 1, name: "rocket2")
arrayRockets.append(rocket2)

for i in 0..<arrayRockets.count {
    print("The position: \(i) has value: \(arrayRockets[i].name)")
}

arrayRockets = arrayRockets.map {
    var mutableRocket = $0

    if $0.id == 1 {
        mutableRocket.name = "second rocket"
    }
    return mutableRocket
}

for i in 0..<arrayRockets.count {
    print("The position: \(i) has value: \(arrayRockets[i].name)")
}

func editArray(arr: [Rocket]) -> [Rocket] {
    var array = arr
    array = array.map {
        var mutableRocket = $0

        if $0.id == 1 {
            mutableRocket.name = "rocket second"
        }
        return mutableRocket
    }
    return array
}

arrayRockets = editArray(arr: arrayRockets)
print("The array of rockets is: \(arrayRockets)")

struct Book {
    let id: Int
    var title: String

    init(id: Int, title: String) {
        self.id = id
        self.title = title
    }
}

var arrayBook = [Book]()
var book1 = Book(id: 0, title: "Castle on the hill")
arrayBook.append(book1)
var book2 = Book(id: 1, title: "New plan")
arrayBook.append(book2)

arrayBook.forEach { book in
    print(book.title)
}

arrayBook = arrayBook.map {
    var mutableBook = $0
    if $0.id == 1 {
        mutableBook.title = "New plan B"
    }
    return mutableBook
}

arrayBook.forEach { book in
    print(book.title)
}
