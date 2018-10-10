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

    mutating func loadInitialBooks() {
        let book1 = Book(id: 0, name: "book1")
        let book2 = Book(id: 1, name: "book2")

        books += [book1, book2]
    }
    
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

    mutating func editBook(_ editBook: Book, userInput: String) {
        let idOfBookForEdit = editBook.id
        print("The selected books id is: \(idOfBookForEdit)")
        let nameOfBookForEdit = editBook.name
        print("The selected books name is: \(nameOfBookForEdit)")

        books.remove(at: idOfBookForEdit)
        printBooks()

        let bookAfterEdit = Book(id: idOfBookForEdit, name: userInput)

        books.insert(bookAfterEdit, at: idOfBookForEdit)
        printBooks()
    }
}
