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
    // function used for cancelling the saving of new note
    func contollerDidCancel(_ controller: AddNoteViewController)
    // function used for saving the new note, entered by the user
    func contollerDidSave(_ controller: AddNoteViewController, didSave: Note)
    
    // function used for editing an existing note
    func controllerDidEdit(_ controller: AddNoteViewController, didEdit: Note)
}

class AddNoteViewController: UIViewController {
    
    var userNote = UserNotes()
    
    // MARK: Properties
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var saveBtn: UIBarButtonItem!
    
    var note = Note(id: 0, name: "")
    
    weak var delegate: AddNoteViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Set Title on the navigation bar in the add screen _Add Note_
        title = "Add Note"
        
        // Set up views if editing an existing Note.
        if let note = note {
            textField.text = note.name
        }
        
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
        /* use the delegate method for cencelling the save of a note */
        delegate?.contollerDidCancel(self)
        
        // Depending on style of presentation (modal or push presentation), this view controller needs to be dismissed in two different ways.
        let isPresentingInAddNoteMode = presentingViewController is UINavigationController
        
        if isPresentingInAddNoteMode {
            delegate?.contollerDidCancel(self)
        }
        else if let owningNavigationController = navigationController{
            owningNavigationController.popViewController(animated: true)
        }
        else {
            fatalError("The NoteViewController is not inside a navigation controller.")
        }
        
    }
    
    /*
        Adding the button (functionality) for saving an event.
        It uses the delegate method 'controllerDidSave' to pass data from the AddNoteViewController to the MainScreenViewController
     */
    
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        /* use the delegate method for saving user note */
        if let note = Note(id: userNote.incrementIdentifierByOne(), name: textField.text ?? "") {
            delegate?.contollerDidSave(self, didSave: note)
        }
        
        // Depending on the style of presentation (modal or push presentation), this view controller needs to be dismissed in two different ways.
        let isPresentingInAddNoteMode = presentingViewController is UINavigationController
        
        if isPresentingInAddNoteMode {
//            delegate?.contollerDidCancel(self)
//            print("You are in edit mode")
        } else if let owningNavigationController = navigationController {
            
            if let editedNote = Note(id: userNote.incrementIdentifierByOne(), name: textField.text!) {
                delegate?.controllerDidEdit(self, didEdit: editedNote)
                print("The name of the editted note is: \(editedNote.name)")
            }
            
            print("You are in edit mode(saving the editted note)")
            
            owningNavigationController.popViewController(animated: true)
        } else {
            fatalError("The NoteViewController is not inside a navigation controller.")
        }
    }
}


// MARK: Private Methods
extension AddNoteViewController {
    // checking if the label for inputting the name of the note is empty (if it is empty the user is not allowed to save the note) / (the save button is unabled)
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
        // Enabling the save button. It can be used.
        saveBtn.isEnabled = true
    }
}
