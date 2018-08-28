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
    // function used for editing selected by the user note
    func controllerDidEdit(_ controller: AddNoteViewController, didEdit: Note)
}

class AddNoteViewController: UIViewController {
    var userNote = UserNotes()

    // MARK: Properties
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var saveBtn: UIBarButtonItem!

    var note: Note?

    weak var delegate: AddNoteViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        // Set Title on the navigation bar in the add screen _Add Note_
        title = "Adding Note"

        // Set up views if editing an existing Note.
        if let note = note {
            textField.text = note.name
            title = "Editing Note"
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
        let isPresentingInAddNoteMode = presentingViewController is UINavigationController

        if isPresentingInAddNoteMode {
            print("Save from add screen")

            var newID: Int
            if userNote.notes.isEmpty {
                newID = 0
            } else {
                newID = (userNote.notes.last?.id)!
                newID = newID + 1
            }
            let newNote = Note(id: newID, name: textField.text ?? "")

            delegate?.contollerDidSave(self, didSave: newNote!)
        } else if let owningNavigationController = navigationController {
            print("Save from edit screen")

            let noteEditID = note?.id
            print("The id of the selected note is: \(String(describing: noteEditID))")
            let noteEditName = note?.name
            print("The name of the selected note is: \(String(describing: noteEditName))")

            let noteEdit = Note(id: noteEditID!, name: textField.text!)

            delegate?.controllerDidEdit(self, didEdit: noteEdit!)

            owningNavigationController.popViewController(animated: true)
        } else {
            fatalError("The AddNoteViewController.swift is not inside a navigationcontroller.")
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
