//
//  AddNoteViewController.swift
//  NoteApplication
//
//  Created by Kalin Karev on 1/4/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class AddNoteViewController: UIViewController {

    @IBOutlet weak var input: UITextField!
    
//    @IBAction func addNote(_ sender: UIButton) {
//
//        // add the new note
//        if (input.text != "") {
//            list.append(input.text!)
//            input.text = ""
//        }
//
//        dismiss(animated: true, completion: nil)
//    }
    
    @IBAction func btnSave(_ sender: UIBarButtonItem) {
        if (input.text != "") {
            list.append(input.text!)
            input.text = ""
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnCancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    // Built in method
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
//    @IBAction func btnDoneAction(_ sender: UIBarButtonItem) {
//        dismiss(animated: true, completion: nil)
//    }
    
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
