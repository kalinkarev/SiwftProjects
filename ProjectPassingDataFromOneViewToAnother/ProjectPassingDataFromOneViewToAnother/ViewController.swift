//
//  ViewController.swift
//  ProjectPassingDataFromOneViewToAnother
//
//  Created by Kalin Karev on 4/18/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit
import os.log

class ViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var saveBtn: UIBarButtonItem!
    
    /*
     This value is either passed by 'NoteTableViewController' in 'prepare(for:sender:)'
     or constructed as part of adding a new note.
     */
    var note: Note?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Set title to the navigation bar
        navigationItem.title = "New Note"
        
        // Handle the text field`s user input through delegate callbacks.
        nameTextField.delegate = self
        
        // Set up views if editing an existing Note.
        if let note = note {
            navigationItem.title = note.name
            nameTextField.text = note.name
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Navigation
    // This method lets you configure a view controller before it`s presented.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        // Configure the destination view controller only when the save button is pressed.
        guard let button = sender as? UIBarButtonItem, button === saveBtn else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        let name = nameTextField.text ?? ""
        
        // Set the note to be passed to NoteTableViewController after the unwind segue.
        note = Note(name: name)
    }
    
    // MARK: Actions
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        // Depending on style of presentation (modal or push presentation), this view controller needs to be dismissed in two different ways.
        let isPresentingInAddNoteMode = presentingViewController is UINavigationController
        if isPresentingInAddNoteMode {
            dismiss(animated: true, completion: nil)
        } else if let owningNavigationController = navigationController { // it is called when the user is editing  an existing note
            owningNavigationController.popViewController(animated: true)
        } else {
            fatalError("The ViewController is not inside a navigation controller.")
        }
    }
}

// MARK: UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }

}

