//
//  AddItemViewController.swift
//  ProjectForTestingSaveButtonToBeUnavailable
//
//  Created by Kalin Karev on 8/30/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

protocol AddItemViewControllerDelegate: AnyObject {
    func controllerDidCancel(_ controller: AddItemViewController)
    func controllerDidSave(_ controller: AddItemViewController, didSave: Note)
    func controllerDidEdit(_ controller: AddItemViewController, didEdit: Note)
}

class AddItemViewController: UIViewController, UITextFieldDelegate {
    weak var delegate: AddItemViewControllerDelegate?

    var selectedNoteEdit: Note?

    var manageNotes = ManageNotes()

    // MARK: Properties
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var saveBtn: UIBarButtonItem!

    // MARK: Actions
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        let isPresentingInAddNoteMode = presentingViewController is UINavigationController
        
        if isPresentingInAddNoteMode {
            delegate?.controllerDidCancel(self)
        } else if let owningNavigationController = navigationController {
            owningNavigationController.popViewController(animated: true)
        } else {
            fatalError("The AddItemViewController is not inside a navigation controller.")
        }
    }
    
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        let isPresentingInAddNoteMode = presentingViewController is UINavigationController
        
        if isPresentingInAddNoteMode {
            var newID: Int
            if manageNotes.notes.isEmpty {
                newID = 0
            } else {
                newID = (manageNotes.notes.last?.id)!
                newID = newID + 1
            }
            let newNote = Note(id: newID, name: inputTextField.text!)
            delegate?.controllerDidSave(self, didSave: newNote)
        } else if let owningNavigationController = navigationController {
            let noteEditID = selectedNoteEdit?.id
            print("The id of the selected note is: \(String(describing: noteEditID))")
            let noteName = selectedNoteEdit?.name
            print("The name of the selected note is: \(String(describing: noteName))")
            
            let editNote = Note(id: noteEditID!, name: inputTextField.text!)
            print("The edited note has id: \(editNote.id) and name: \(editNote.name)")
            
            delegate?.controllerDidEdit(self, didEdit: editNote)

            owningNavigationController.popViewController(animated: true)
        } else {
            fatalError("The addItemViewController is not inside a navigationController.")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        inputTextField.delegate = self
        
        if let note = selectedNoteEdit {
            inputTextField.text = note.name
        }
        
        saveBtn.isEnabled = false
        
//        updateSaveButtonState()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        saveBtn.isEnabled = false
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
    }

    // MARK: Private Methods
    private func updateSaveButtonState() {
        // Disable the Save button if the text field is empty.
        let text = inputTextField.text ?? ""
        saveBtn.isEnabled = !text.isEmpty
    }
}
