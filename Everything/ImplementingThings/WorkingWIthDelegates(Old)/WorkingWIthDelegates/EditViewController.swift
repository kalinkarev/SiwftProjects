//
//  EditViewController.swift
//  WorkingWIthDelegates
//
//  Created by Kalin Karev on 8/2/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class EditViewController: UIViewController, AddViewControllerDelegate {
    
    // MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    @IBAction func cancelBtn(_ sender: UIBarButtonItem) {
        print("You have pressed the cancel button on the edit screen")
    }
    
    @IBAction func saveBtn(_ sender: UIBarButtonItem) {
        print("You have pressed the save button on the edit screen")
    }

    func controller(_ controller: AddViewController, didAddItem: String) {
    }

    func dismissSave(_ controller: AddViewController) {
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
