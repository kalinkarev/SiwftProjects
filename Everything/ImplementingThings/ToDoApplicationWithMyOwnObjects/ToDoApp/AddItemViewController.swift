//
//  AddItemViewController.swift
//  ToDoApp
//
//  Created by Kalin Karev on 8/3/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

protocol AddItemViewControllerDelegate {
    func saveItem(_ controller: AddItemViewController, didAddItem: ToDo)
    func cancelItem(_ controller: AddItemViewController)
}

class AddItemViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!

    var delegate: AddItemViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Actions
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        delegate?.cancelItem(self)
    }

    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        if let name = nameTextField.text {
            // Create Item
            let item = ToDo(name: name, done: false)
            
            // Notify Delegate
            delegate?.saveItem(self, didAddItem: item)
        }
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
