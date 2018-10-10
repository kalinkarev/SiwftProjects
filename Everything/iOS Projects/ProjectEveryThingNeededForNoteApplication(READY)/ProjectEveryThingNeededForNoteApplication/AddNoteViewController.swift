//
//  AddNoteViewController.swift
//  ProjectEveryThingNeededForNoteApplication
//
//  Created by Kalin Karev on 8/27/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

protocol AddNoteViewControllerDelegate: AnyObject {
    func controllerDidSave(_ controller: AddNoteViewController, didSave: Note)
    func controllerDidCancel(_ controller: AddNoteViewController)
    func controllerDidEdit(_ controller: AddNoteViewController, didEdit: Note)
}

class AddNoteViewController: UIViewController {
    weak var delegate: AddNoteViewControllerDelegate?

    var selectedNote: Note?

    var manageNotes = ManageNote()
    // MARK: Properties
    @IBOutlet weak var inputTextField: UITextField!

    // MARK: Actions
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        let isPresentingInAddNoteMode = presentingViewController is UINavigationController
        
        if isPresentingInAddNoteMode {
            delegate?.controllerDidCancel(self)
            print("Cancel from add screen")
        } else if let owningNavigationController = navigationController {
            owningNavigationController.popViewController(animated: true)
            print("Cancel from edit screen")
        } else {
            fatalError("The AddNoteViewController is not inside a navigationcontroller.")
        }
    }

    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        let isPresentingInAddNoteMode = presentingViewController is UINavigationController
        
        if isPresentingInAddNoteMode {
            print("Save from add screen")
            var newID: Int
            if manageNotes.notes.isEmpty {
                newID = 0
            } else {
                newID = (manageNotes.notes.last?.id)!
                newID = newID + 1
            }
            let newNote = Note(id: newID, title: inputTextField.text!)
            delegate?.controllerDidSave(self, didSave: newNote)
        } else if let owningNavigationController = navigationController {
            print("Save from edit screen")
            
            let noteEditID = selectedNote?.id
            print("The id of the selected note is: \(String(describing: noteEditID))")
            let noteTitle = selectedNote?.title
            print("The title of the selected note is: \(String(describing: noteTitle))")
            
            let editNote = Note(id: noteEditID!, title: inputTextField.text!)
            print("The edited note has id: \(editNote.id) and name: \(editNote.title)")
            
            delegate?.controllerDidEdit(self, didEdit: editNote)
            
            owningNavigationController.popViewController(animated: true)
        } else {
            fatalError("The AddNoteViewController is not inside a navigationcontroller.")
        }
        
        

//        else {
//            print("Save from edit screen")
//            let selectedNoteForEditID = selectedNote?.id
//            print("The selected note item has id: \(String(describing: selectedNoteForEditID))")
//            let selectedNoteForEditName = selectedNote?.title
//            print("The selected note item has name: \(String(describing: selectedNoteForEditName))")

//            let editNote = Note(id: selectedNoteForEditID!, title: inputTextField.text ?? "")
//            print("The edited note has id: \(editNote.id) and name: \(editNote.title)")
//
//            delegate?.controllerDidEdit(self, didEdit: editNote)
//        }
//        } else if let owningNavigationController = navigationController {
//            print("Save from edit screen")
//        } else {
//            fatalError("The AddNoteViewController is not inside a navigationcontroller.")
//        }
        
//        let isPresentingInAddNoteMode = presentingViewController is UINavigationController
//
//        if isPresentingInAddNoteMode {
//            print("Save pressed on add note screen")
//            var newID: Int
//            if manageNotes.notes.isEmpty {
//                newID = 0
//            } else {
//                newID = (manageNotes.notes.last?.id)!
//                newID = newID + 1
//            }
//            let newNote = Note(id: newID, title: inputTextField.text!)
//            delegate?.controllerDidSave(self, didSave: newNote)
//        } else if let owningNavigationController = navigationController {
//            print("Save pressed on edit screen")
//            let selectedNoteForEditID = selectedNote?.id
//            print("The selected note item has id: \(String(describing: selectedNoteForEditID))")
//            let selectedNoteForEditName = selectedNote?.title
//            print("THe selected note item has title: \(String(describing: selectedNoteForEditName))")
//
//            let editedNote = Note(id: selectedNoteForEditID!, title: inputTextField.text!)
//            print("The edited note has id: \(editedNote.id) and name: \(editedNote.title)")
//
//            delegate?.controllerDidEdit(self, didEdit: editedNote)
//        } else {
//            fatalError("The AddNoteViewController is not inside a navigationcontroller")
//        }
        
//        if isPresentingInEditNoteMode {
////            print("You pressed the save button in Add Note Screen")
//            var newID: Int
//            if manageNotes.notes.isEmpty {
//                newID = 0
//            } else {
//                newID = (manageNotes.notes.last?.id)!
//                newID = newID + 1
//            }
//            let newNote = Note(id: newID, title: inputTextField.text!)
//            delegate?.controllerDidSave(self, didSave: newNote)
//        }
//
//        let isPresentingInAddNoteMode = presentingViewController is UINavigationController
//
//        if isPresentingInEditNoteMode {
//            delegate?.controllerDidCancel(self)
//        } else if let owningNavigationController = navigationController {
////            print("You pressed the save button in Edit Note Screen")
//            let selectedNoteForEditID = selectedNote?.id
//            print("The selected note item has id: \(String(describing: selectedNoteForEditID))")
//            let selectedNoteForEditName = selectedNote?.title
//            print("THe selected note item has title: \(String(describing: selectedNoteForEditName))")
//
//            let editedNote = Note(id: selectedNoteForEditID!, title: inputTextField.text!)
//            print("The edited note has id: \(editedNote.id) and name: \(editedNote.title)")
//
//            delegate?.controllerDidEdit(self, didEdit: editedNote)
//
//            owningNavigationController.popViewController(animated: true)
//        } else {
//            fatalError("The Add Note View Controller is not inside navigation controller")
//        }
//
        
//        let isPresentingInAddNoteMode = presentingViewController is UINavigationController
//
//        if isPresentingInAddNoteMode {
//            var newID: Int
//            if manageNotes.notes.isEmpty {
//                newID = 0
//            } else {
//                newID = (manageNotes.notes.last?.id)!
//                newID = newID + 1
//            }
//            let newNote = Note(id: newID, title: inputTextField.text!)
//            delegate?.controllerDidSave(self, didSave: newNote)
//            print("Save pressed on add note screen")
//        } else if let owningNavigationController = navigationController {
//
//            print("Save pressed on edit screen")
//
////            let selectedNoteForEditID = selectedNote?.id
////            print("The selected note item has id: \(String(describing: selectedNoteForEditID))")
////            let selectedNoteForEditName = selectedNote?.title
////            print("The selected note item has title: \(String(describing: selectedNoteForEditName))")
////
////            let editedNote = Note(id: selectedNoteForEditID!, title: inputTextField.text!)
////            print("The edited ntoe has id: \(editedNote.id) and name: \(editedNote.title)")
////
////            delegate?.controllerDidEdit(self, didEdit: editedNote)
////
////            owningNavigationController.popViewController(animated: true)
//        } else {
//            fatalError("The AddNoteViewController is not inside a navigationcontroller")
//        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if let note = selectedNote {
            inputTextField.text = note.title
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
