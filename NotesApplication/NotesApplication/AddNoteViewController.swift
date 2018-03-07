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
    
    
    weak var delegate: AddNoteViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Set Title on the navigation bar in the add screen _Add Note_
        title = "Add Note"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: Actions
    
    @IBAction func cancelButton(_ sender: Any) {
        
        delegate?.contollerDidCancel(self)
        
    }
    
    @IBAction func saveButton(_ sender: Any) {
        
        let note = Note(name: textField.text!)
        delegate?.contollerDidSave(self, didSave: note!)
    
    }

}
