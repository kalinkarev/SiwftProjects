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

    // MARK: Actions
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        print("You have pressed the cancel button")
        delegate?.controllerDidCancel(self)
    }
    
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
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
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
