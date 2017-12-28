//
//  ViewControllerAddingNote.swift
//  ProjectNotes
//
//  Created by Kalin Karev on 12/28/17.
//  Copyright © 2017 Kalin Karev. All rights reserved.
//

import UIKit

class ViewControllerAddingNote: UIViewController {

    // refrence for the default label
    @IBOutlet weak var labelForTest: UILabel!
    // reference for the textfield for inputing notes
    @IBOutlet weak var note: UITextField!
    // reference to the 'Cancel' button
    @IBAction func buttonCancelPressed(_ sender: UIButton) {
    
        let title = sender.title(for: .normal)!
        
        labelForTest.text = "You cliked the \(title) button"
        
        // hiding the keyboard when clicked this button
        self.note.resignFirstResponder()
    }
    // rference to the 'Save' button
    @IBAction func buttonSavePressed(_ sender: UIButton) {
        let title = sender.title(for: .normal)!
        
        labelForTest.text = "You cliked the \(title) button"
    
        // hiding the keyboard when ckicked this button
        self.note.resignFirstResponder()
    }
    
    // Method for stopping input (hiding the keyboard) by clicking in the background
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
