//
//  ReceivingViewController.swift
//  TestingTheDelegations
//
//  Created by Kalin Karev on 2/11/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ReceivingViewController: UIViewController, DataSentDelegate {

    // MARK: Properties
    
    @IBOutlet weak var receivingTextField: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func userDidEnterData(data: String) {
        receivingTextField.text = data
    }
    // set the receiving label to pull the data from the SendingViewController
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSendingViewController" {
            let sendingViewController: SendingViewController = segue.destination as! SendingViewController
            sendingViewController.delegate = self
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

