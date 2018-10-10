//
//  AddViewController.swift
//  ProjectForAddingDeletingAndEditing
//
//  Created by Kalin Karev on 8/24/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

protocol AddViewControllerDelegate: AnyObject {
    func controllerDidCancel(_ controller: AddViewController)
    func controllerDidSave(_ controller: AddViewController, didSave: Book)
}

class AddViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!

    weak var delegate: AddViewControllerDelegate?

    var manageBooks = ManageBooks()

    var selectedBook: Book?
    var arrayBooks: [Book] = []

    // MARK: Actions
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        let isPresentingInAddBookMode = presentingViewController is UINavigationController

        if isPresentingInAddBookMode {
            delegate?.controllerDidCancel(self)
        } else if let owningNavigationController = navigationController {
            owningNavigationController.popViewController(animated: true)
        } else {
            fatalError("The AddViewController is not inside navigationController.")
        }
    }

    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        let isPresentingInAddBookMode = presentingViewController is UINavigationController

        if isPresentingInAddBookMode {
            var newID: Int
            if manageBooks.books.isEmpty {
                newID = 0
            } else {
                newID = (manageBooks.books.last?.id)!
                newID = newID + 1
            }

            let newBook = Book(id: newID, name: nameTextField.text ?? "")
            print("The new book has id: \(newBook.id), name: \(newBook.name)")

            delegate?.controllerDidSave(self, didSave: newBook)
        } else if let owningNavigationController = navigationController {
            let userInput = nameTextField.text
            print("The user input is: \(String(describing: userInput))")

//            manageBooks.editBook(selectedBook!, userInput: userInput!)
            
            let idOfBookForChange = selectedBook?.id
            print("The id of the book for edit is: \(String(describing: idOfBookForChange))")

            arrayBooks.remove(at: idOfBookForChange!)

            print("The changed array is: \(arrayBooks)")

            let bookAfterEdit = Book(id: idOfBookForChange!, name: userInput!)

            arrayBooks.insert(bookAfterEdit, at: idOfBookForChange!)

            print("The array after addition is: \(arrayBooks)")

            manageBooks.books = arrayBooks
            
            print("After change the ManageBooks array is: ")
            
            manageBooks.printBooks()
            
            print("You are clicking the save button in edit screen")
            owningNavigationController.popViewController(animated: true)
        } else {
            fatalError("The AddViewController is not inside navigationController.")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("The array with books is: \(arrayBooks)")
        
        if let book = selectedBook {
            let idOfSelectedBook = book.id
            print("The id of the selected book is: \(idOfSelectedBook)")
            
            let nameOfSelectedBook = book.name
            print("The name of the selected book is: \(nameOfSelectedBook)")
            
            nameTextField.text = nameOfSelectedBook
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
