//
//  SendingViewController.swift
//  DelegateTestExample
//
//  Created by Kalin Karev on 2/14/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class SendingViewController: UIViewController {

    // MARK: Properties
    
    @IBOutlet weak var dataEntryTextField: UITextField!
    
    
    // setup our protocol, need a variable of type DataSentDelegate
    var delegate: DataSentDelegate? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // MARK: Actions
    
    @IBAction func sendBtnWasPressed(_ sender: Any) {
        if delegate != nil {
            if dataEntryTextField != nil {
                let data = dataEntryTextField.text
                delegate?.userDidEnterData(data: data!)
                dismiss(animated: true, completion: nil)
            }
        }
    }
    
}
