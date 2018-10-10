//
//  AddingNoteViewController.swift
//  NotesApplicationWithDelegates
//
//  Created by Kalin Karev on 2/20/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class AddingNoteViewController: UIViewController {

    // setup your protocol, need a variable of type NotesManagerDelegate
    var delegate: NotesManagerDelegate? = nil
    
    
    // MARK: Properties
    
    @IBOutlet weak var nametextField: UITextField!
    
    @IBAction func cancelBtnPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveBtnPressed(_ sender: UIBarButtonItem) {
//        print("Save button pressed")
        
        if delegate != nil {
            if nametextField != nil {
                let data = nametextField.text
                delegate?.userDidEnterNote(data!)
                dismiss(animated: true, completion: nil)
            }
        }
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
