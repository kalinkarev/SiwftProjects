//
//  ManageBooks.swift
//  ProjectForAddingDeletingAndEditing
//
//  Created by Kalin Karev on 8/24/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import Foundation

struct ManageBooks {
    var books: [Book] = []
    
    func arrayLenght() -> Int {
        return books.count
    }
    
    func printBooks() {
        print("The array of books is: \(books)")
    }
    
    mutating func addBook(_ newBook: Book) {
        if books.isEmpty{
            let newID = 0
            var localNewBook = newBook
            localNewBook.id = newID
            books.append(localNewBook)
        } else {
            let lastBook = books.last
            let lastID = lastBook?.id
            
            if let lastBookID = lastID {
                var localNewBook = newBook
                localNewBook.id = lastBookID + 1
                books.append(localNewBook)
            }
        }
        printBooks()
    }
    
    mutating func deleteBook(_ deleteBook: Book) {
        books.remove(at: deleteBook.id)
        printBooks()
    }
    
    mutating func editBook(_ editBook: Book) {
        books.forEach { book in
            print("\(book.id) - \(book.name)")
        }
        
        books = books.map {
            var mutableBook = $0
            
            if $0.id == editBook.id {
                mutableBook.name = editBook.name
            }
            
            return mutableBook
        }
        
        books.forEach { book in
            print("After change \(book.id) - \(book.name)")
        }
    }
}
