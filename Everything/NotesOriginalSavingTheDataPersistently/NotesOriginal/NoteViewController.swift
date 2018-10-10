//
//  NoteViewController.swift
//  NotesOriginal
//
//  Created by Kalin Karev on 2/1/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit
import os.log

class NoteViewController: UIViewController, UITextFieldDelegate {

    // MARK: Properties
    
    @IBOutlet weak var nameTextField: UITextField!
    // attribute tells that we can connect to the nameTextField property from Interface Bulder
    // weak -> indicates that the reference does not prevent the system from deallocating the referenced object
    // ! -> indicates that the type is an implicitly unwrapped optional, which is an optional type that will always have a value after it is first set. When you access an implicitly unwrapped optional, the system assumes it has a valid and automatically unwraps it for you. Note that this causes the app to terminate if the variable's value has not yet been set.
    
    //@IBOutlet weak var noteNameLabel: UILabel!
    // You only need an outlet to an interface object if you plan to either access a value from the interface object or modify the interface object in your code.
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    // OUTLETS are used only for modifying
    
    /*
     This value is either passed by 'NoteTableViewController' in 'prepare(for:sender:)' or
     constructed as part of adding a new note.
     */
    // Add a Note property to NoteViewController
    var note: Note?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field's user input through delegate callbacks.
        nameTextField.delegate = self
        
        // Enable the Save button only if the text field has a valid Note name.
        updateSaveButtonState()// to make sure that the Save button is disabled until a user enters a valid name
    }

    // Creating a simple action that sets the label to Default Text whenever the user taps the Set Deafult Text button
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    // get the entered in the field
    func textFieldDidEndEditing(_ textField: UITextField) {
        //noteNameLabel.text = textField.text -> From before
        updateSaveButtonState()
        navigationItem.title = textField.text // sets the title of the scene to that text
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Disable the Save button while editing.
        saveButton.isEnabled = false
    }
    // this method gets called when an editing session begins, or when the keyboard gets displayed. It disables the Save button while the user is edidting the text field.
    
    // MARK: Navigation
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    /*
     the dismiss method dismisses the modal scene and animates the transition
     back to the previous scene(to note list). The app does not store any data
     when the note detail scene is dismissed, and neither the
     prepare(for:sender:) method nor the unwind action method are called.
    */
 
    // This method lets you configure a view controller before it's presented.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        // Configure the destination view controller only when the save button is pressed.
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type:.debug)
            return
        }
        // Verifies that the sender is a button, and then uses the === to check that the objects referenced by the sender and the saveButton outlet are the same.
        
        let name = nameTextField.text ?? ""
        
        // Set the note to be passed to NoteTableViewController after the unwind segue.
        note = Note(name: name)
        
    }
    
    // MARK: Actions
//    @IBAction func setDefaultLabelText(_ sender: UIButton) {
//        noteNameLabel.text = "Default Text"
//    }
    
    // target-action pattern in iOS app design. The target-action is a design pattern where one object sends a messageto another object when a specific event occurs.
    
    // when you work with accepting user input from atext field, you need some help from a text field delegate. A delegate is an object that acts on behalf of, or in coordination with, another object. 
    
    // MARK: Private Methods
    private func updateSaveButtonState() {
        // Disable the Save button if the text field is empty.
        let text = nameTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
    // This is the helper method to disable the Save button if the text field is empty.
    
}

