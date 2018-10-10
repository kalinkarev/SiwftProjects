//
//  ViewController.swift
//  ProjectForAddingDeletingAndEditing
//
//  Created by Kalin Karev on 8/24/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var userTableView: UITableView!

    var manageBooks = ManageBooks()

    // MARK: Actions
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        manageBooks.loadInitialBooks()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch segue.identifier {
        case "addItem"?:
            print("You are adding item")
            
            let navigationController = segue.destination as? UINavigationController
            let addItemViewController = navigationController?.topViewController as? AddViewController
            
            if let viewController = addItemViewController {
                viewController.delegate = self
            }
        case "editItem"?:
            print("You are editing item")
            
            guard let bookDetailViewController = segue.destination as? AddViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            guard let selectedBookCell = sender as? MainScreenTableViewCell else {
                fatalError("Unexpected sender: \(String(describing: sender))")
            }
            guard let indexPath = userTableView.indexPath(for: selectedBookCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let selectedBook = manageBooks.books[indexPath.row]
            bookDetailViewController.selectedBook = selectedBook
            
            manageBooks.printBooks()
            
            let arrayWithBooks = manageBooks.books
            bookDetailViewController.arrayBooks = arrayWithBooks
        default:
            print("There is not such operation that you can do with the item")
        }
    }
}

extension ViewController: AddViewControllerDelegate {
    func controllerDidCancel(_ controller: AddViewController) {
        dismiss(animated: true, completion: nil)
    }
    func controllerDidSave(_ controller: AddViewController, didSave: Book) {
        manageBooks.addBook(didSave)

        userTableView.reloadData()

        dismiss(animated: true, completion: nil)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manageBooks.arrayLenght()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "mainScreenCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MainScreenTableViewCell else {
            fatalError("The dequeued cell is not an instance of MainScreenTableViewCell")
        }

        let book = manageBooks.books[indexPath.row]
        cell.nameLabel.text = book.name
        
        return cell
    }
    
    // Delete book
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let book = Book(id: indexPath.row, name: indexPath.description)
            
            manageBooks.deleteBook(book)
            
            userTableView.deleteRows(at: [indexPath], with: .right)
        }
    }
}
