//
//  AddNoteViewController.swift
//  NotesApplication
//
//  Created by Kalin Karev on 3/6/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import Foundation
import UIKit

protocol AddNoteViewControllerDelegate: AnyObject {
    
    func contollerDidCancel(_ controller: AddNoteViewController)
    func contollerDidSave(_ controller: AddNoteViewController, didSave: Note)
    
}

class AddNoteViewController: UIViewController {

    // MARK: Properties
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var saveBtn: UIBarButtonItem!
    
    weak var delegate: AddNoteViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Set Title on the navigation bar in the add screen _Add Note_
        title = "Add Note"
        
        saveBtn.isEnabled = false
        textField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Actions
    
    /*
        Adding the button (functionality) for cancelling an event.
        It uses the delegate method 'controllerDidCancel' to skip the action of saving an event and get the user to the main screen with his/her all events.
     */
    
    @IBAction func cancelButton(_ sender: Any) {
        delegate?.contollerDidCancel(self)
    }
    
    /*
        Adding the button (functionality) for saving an event.
        It uses the delegate method 'controllerDidSave' to pass data from the AddNoteViewController to the MainScreenViewController
     */
    
    @IBAction func saveButton(_ sender: Any) {
        if let note = Note(name: textField.text ?? "") {
            delegate?.contollerDidSave(self, didSave: note)
        } else {
            print("There is a problem with unwrapping the note's information")
        }
    }
}


// MARK: Private Methods
extension AddNoteViewController {
    @objc func editingChanged(_ textField: UITextField) {
        if textField.text?.count == 1 {
            if textField.text?.first == " " {
                textField.text = ""
                return
            }
        }
        
        guard let name = textField.text, !name.isEmpty else {
            saveBtn.isEnabled = false
            return
        }
        saveBtn.isEnabled = true
    }
}
