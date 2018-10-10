//
//  AddViewController.swift
//  WorkingWIthDelegates
//
//  Created by Kalin Karev on 8/2/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

protocol AddViewControllerDelegate {
    func controller(_ controller: AddViewController, didAddItem: String)
    func dismissSave(_ controller: AddViewController)
}

class AddViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var inputTextField: UITextField!

    var delegate: AddViewControllerDelegate?

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
        print("You have pressed the cancel button")
        delegate?.dismissSave(self)
    }

    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        print("You have pressed the save button")
        
        if let item = inputTextField.text {
            delegate?.controller(self, didAddItem: item)
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
