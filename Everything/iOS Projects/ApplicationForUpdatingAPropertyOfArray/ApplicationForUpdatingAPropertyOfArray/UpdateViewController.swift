//
//  UpdateViewController.swift
//  ApplicationForUpdatingAPropertyOfArray
//
//  Created by Kalin Karev on 8/10/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class UpdateViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var titleTextField: UITextField!

    var item: Items?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let item = item {
            titleTextField.text = item.title
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Actions
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        print("You have pressed the cancel button")
        dismiss(animated: true, completion: nil)
    }

    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        print("You have pressed the save button")
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
