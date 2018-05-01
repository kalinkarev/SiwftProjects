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
}

class AddNoteViewController: UIViewController {
    
    var userNote = UserNotes()
    
    // MARK: Properties
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var saveBtn: UIBarButtonItem!
    
//    var note = Note(id: 0, name: "")
    var note: Note?
    
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
        
        let isPressentingInEditNoteMode = presentingViewController is UINavigationController
        
        if isPressentingInEditNoteMode {
            delegate?.contollerDidCancel(self)
            print("You pressed the Cancel button in Add Note screen")
        }
        
        // Depending on style of presentation (modal or push presentation), this view controller needs to be dismissed in two different ways.
        let isPresentingInAddNoteMode = presentingViewController is UINavigationController
        
        if isPresentingInAddNoteMode {
            delegate?.contollerDidCancel(self)
        } else if let owningNavigationController = navigationController{
            owningNavigationController.popViewController(animated: true)
            print("You pressed the Cancel button in Edit Note screen")
        } else {
            fatalError("The NoteViewController is not inside a navigation controller.")
        }
    }
    
    /*
        Adding the button (functionality) for saving a note.
        It uses the delegate method 'controllerDidSave' to pass data from the AddNoteViewController to the MainScreenViewController
     */
    
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        /* use the delegate method for saving user note */
        
//        let notes = userNote.notes
        
        let isPressentingInEditNoteMode = presentingViewController is UINavigationController
        
        if isPressentingInEditNoteMode {
            if let note = Note(id: userNote.incrementIdentifierByOne(), name: textField.text ?? "") {
                delegate?.contollerDidSave(self, didSave: note)
            }
            print("You pressed the save button in Add Note screen")
        }
        
        // Depending on style of presentation (modal or push presentation), this view controller needs to be dismissed in two different ways.
        let isPresentingInAddNoteMode = presentingViewController is UINavigationController
        
        if isPresentingInAddNoteMode {
            delegate?.contollerDidCancel(self)
        } else if let owningNavigationController = navigationController{
            owningNavigationController.popViewController(animated: true)
            
//            if let noteEdit = Note(id: userNote.editNote(note!), name: textField.text ?? "") {
////                userNote.editNote(noteEdit)
//                print("The new name of the edited note is: \(noteEdit.name)")
//                print("The id of the edited note is: \(noteEdit.id)")
//
//                userNote.notes[noteEdit.id].name = noteEdit.name
//                print("The arrays changed element has name: \(userNote.notes[noteEdit.id].name)")
//            }
//
//            print("The notes are: \(notes)")
            
            if let noteEdit = Note(id: userNote.editNote(note!), name: textField.text ?? "") {
                print("The new name of the edited note is: \(noteEdit.name)")
                print("The id of the edited note is: \(noteEdit.id)")
                
//                var idOfTheSelectedNote = noteEdit.id
//                print("The id of the selected note is: \(idOfTheSelectedNote)")
//                var nameOfTheSelectedNote = noteEdit.name
//                print("The name of the selected note is: \(nameOfTheSelectedNote)")

//                let name = userNote.notes[noteEdit.id]
//                print("The seleceted element has name: \(name)")
                
//                if let i = userNote.notes.index(of: name) {
//                    userNote.notes[i] = noteEdit.name
//                }
                
            }
            
            print("You pressed the Save button in Edit Note screen")
            // We have to save the new context of the element without changing the id of the element in the array.
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
