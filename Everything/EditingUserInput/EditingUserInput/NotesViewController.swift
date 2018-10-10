//
//  NotesViewController.swift
//  EditingUserInput
//
//  Created by Kalin Karev on 5/15/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var textViewName: UITextField!
    
    var note: Note?
    
    var userNotes = UserNotes()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Adding a title on the edit screen
        title = "Edit note"
        
//        if let note = note {
//            textViewName.text = note.name
//        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        print("We are here")
    }
    
    // MARK: Actions
    @IBAction func cancelBtn(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
        print(userNotes.notes)
    }
    
    @IBAction func saveBtn(_ sender: UIBarButtonItem) {
        userNotes.editNote(note!)
//        userNotes.editNote(note!)
//        print(userNotes.notes)
        dismiss(animated: true, completion: nil)
        print(userNotes.notes)
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
