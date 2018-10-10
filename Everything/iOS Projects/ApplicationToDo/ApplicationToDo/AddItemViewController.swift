//
//  AddItemViewController.swift
//  ApplicationToDo
//
//  Created by Kalin Karev on 8/28/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

protocol AddItemViewControllerDelegate {
    func controller(_ controller: AddItemViewController, didAddItem: String)
}

class AddItemViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!

    var delegate: AddItemViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true)
    }

    @IBAction func createButton(_ sender: Any) {
        if let item = textField.text {
            delegate?.controller(self, didAddItem: item)
        }
    }
}
