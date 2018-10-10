//
//  AddViewController.swift
//  MakingApplicationThatToWorkWithDelegates
//
//  Created by Kalin Karev on 8/17/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

protocol AddViewControllerDelegate: AnyObject {
    func controllerDidCancel(_ controller: AddViewController)
}

class AddViewController: UIViewController {

    var transferString: String = ""
    var numberTransfer: Int = 0
    
    // MARK: Properties
    weak var delegate: AddViewControllerDelegate?
    
    // MARK: Actions
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        delegate?.controllerDidCancel(self)
    }
    
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("The string is: \(transferString)")
        print("The number is: \(numberTransfer)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
