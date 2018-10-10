//
//  AddNote.swift
//  Note
//
//  Created by Kalin Karev on 12/28/17.
//  Copyright © 2017 Kalin Karev. All rights reserved.
//

import UIKit

class addNote: UIViewController {
    
    
    @IBAction func buttonSave(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
