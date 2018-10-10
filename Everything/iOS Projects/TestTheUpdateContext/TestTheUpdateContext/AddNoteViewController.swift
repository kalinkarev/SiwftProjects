//
//  AddNoteViewController.swift
//  TestTheUpdateContext
//
//  Created by Kalin Karev on 5/3/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class AddNoteViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var nameTextField: UITextField!
    
    var note: Note?
    
    var notesArray = [Note]()
    
    var vcMain = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nameTextField.text = note?.title
                
//        arrnotes = arrnotes.map {
//            var mutableNote = $0
//            if $0.id == 1 {
//                mutableNote.title = "modified"
//            }
//            return mutableNote
//        }
//
//        arrnotes.forEach { note in
//            print(note.title)
//        }

        print("The array of notes is: \(notesArray)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: Actions
    @IBAction func cancelBtn(_ sender: UIBarButtonItem) {
        let isPresentingInAddNoteMode = presentingViewController is UINavigationController
        if isPresentingInAddNoteMode {
            dismiss(animated: true, completion: nil)
        } else if let owningNavigationController = navigationController{
            owningNavigationController.popViewController(animated: true)
        } else {
            fatalError("The ViewController is not inside a navigation controller.")
        }
    }
    
    @IBAction func saveBtn(_ sender: UIBarButtonItem) {
        
        let isPresentedInAddNoteMode = presentingViewController is UINavigationController
        if isPresentedInAddNoteMode {
            dismiss(animated: true, completion: nil)
        } else if let owningNavigationController = navigationController {
            owningNavigationController.popViewController(animated: true)
        } else {
            fatalError("The ViewController is not inside a navigation controller.")
        }
        
//        arrnotes = arrnotes.map {
//            var mutableNote = $0
//            if $0.id == 1 {
//                mutableNote.title = "modified"
//            }
//            return mutableNote
//        }
        
        notesArray = notesArray.map {
            var mutableN = $0
            if ($0.id == 3) {
                mutableN.title = "greeting"
            }
            return mutableN
        }
        
        print("The title of the note \(String(describing: note?.id)) is changed")
        print("---------------------------------------------------------------------")
        print("The array is: \(vcMain.arrnotes)")
        print("---------------------------------------------------------------------")
        
        dismiss(animated: true, completion: nil)
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
