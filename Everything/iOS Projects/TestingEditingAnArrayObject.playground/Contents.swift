//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

struct Book {
    var id: Int
    var title: String
    
    init (id: Int, title: String) {
        self.id = id
        self.title = title
    }
}

var arrayBook = [Book]()
let book1 = Book(id: 0, title: "Book1")
arrayBook.append(book1)
let book2 = Book(id: 1, title: "Book2")
arrayBook.append(book2)

//arrayBook.forEach { book in
//    print("\(book.id) - \(book.title)")
//}
//
//arrayBook = arrayBook.map {
//    var mutableBook = $0
//
//    if $0.id == 1 {
//        mutableBook.title = "New title |AFTER CHANGE|"
//    }
//
//    return mutableBook
//}
//
//arrayBook.forEach { book in
//    print("\(book.id) - \(book.title)")
//}

func editBook(_ editBook: Book) {
    arrayBook.forEach { book in
        print("\(book.id) - \(book.title)")
    }
    
    arrayBook = arrayBook.map {
        var mutableBook = $0
        if $0.id == editBook.id {
            mutableBook.title = "New title |AFTER CHANGE|"
        }
        return mutableBook
    }
    
    arrayBook.forEach { book in
        print("\(book.id) - \(book.title)")
    }
}

editBook(book2)



var arrString: [String] = ["Hello", "Nice", "To", "Meet", "You"]

var newName = "Nice It"

arrString.remove(at: 1)

arrString.insert(newName, at: 1)

print("The array is: \(arrString)")







