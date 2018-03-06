//
//  AddItemViewController.swift
//  ToDoApplication
//
//  Created by Kalin Karev on 3/5/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    var delegate: AddItemControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func create(_ sender: Any) {
        if let item = textField.text {
            delegate?.controller(self, didAddItem: item)
        }
    }
    
}
