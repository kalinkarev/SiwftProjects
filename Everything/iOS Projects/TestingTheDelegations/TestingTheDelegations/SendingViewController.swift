//
//  SendingViewController.swift
//  TestingTheDelegations
//
//  Created by Kalin Karev on 2/11/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class SendingViewController: UIViewController {

    var delegate: DataSentDelegate? = nil
    
    // MARK: Properties
    
    @IBOutlet weak var dataEntryTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: Actions
    
    @IBAction func sendBtnWasPressed(_ sender: UIButton) {
        if delegate != nil {
            if dataEntryTextField.text != nil {
                let data = dataEntryTextField.text // setting the data
                delegate?.userDidEnterData(data: data!)
                dismiss(animated: true, completion: nil)
            }
        }
    }
    
}
