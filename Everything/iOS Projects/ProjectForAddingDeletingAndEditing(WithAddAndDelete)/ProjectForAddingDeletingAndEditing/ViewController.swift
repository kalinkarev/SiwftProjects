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
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == "addItem" {
            print("You are adding item")
            
            let navigationController = segue.destination as? UINavigationController
            let addItemViewController = navigationController?.topViewController as? AddViewController
            
            if let viewController = addItemViewController {
                viewController.delegate = self
            }
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
