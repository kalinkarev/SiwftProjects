//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

struct Book {
    let id: Int
    var title = "default"
    
    init(id: Int) {
        self.id = id
    }
}

var arrayBook = [Book]()
arrayBook.append(Book(id: 0))
arrayBook.append(Book(id: 1))

arrayBook.forEach { book in
    print(book.title)
}

arrayBook = arrayBook.map {
    var mutableBook = $0
    
    if $0.id == 1 {
        mutableBook.title = "modified"
    }
    return mutableBook
}

arrayBook.forEach { book in
    print(book.title)
}
