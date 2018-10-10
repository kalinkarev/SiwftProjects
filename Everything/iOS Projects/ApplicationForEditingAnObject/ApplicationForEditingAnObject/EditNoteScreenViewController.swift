//
//  EditNoteScreenViewController.swift
//  ApplicationForEditingAnObject
//
//  Created by Kalin Karev on 5/16/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class EditNoteScreenViewController: UIViewController {

    // connection to the elements of the view controller
    // MARK: Properties
    @IBOutlet weak var titleNote: UITextField!
    // this view controller has two buttons (cancel and save) and a text field

    var userNotes = UserNotes()
    
    var passedNote: NoteObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print("The name of the passed note is: \(String(describing: passedNote?.title))")
        print("The id of the passed note is: \(String(describing: passedNote?.id))")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
        userNotes.printTheArray()
        // The user pressed the cancel button. Cancel button is returning back the user to the main screen
    }
    
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        print("You have pressed the save button")
        userNotes.printTheArray()
        userNotes.editNote(passedNote!)
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
