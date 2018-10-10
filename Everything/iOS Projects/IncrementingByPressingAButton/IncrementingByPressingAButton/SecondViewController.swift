//
//  SecondViewController.swift
//  IncrementingByPressingAButton
//
//  Created by Kalin Karev on 3/28/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var counter: Int = 0
    var sendValue: Int = 0
    
    // MARK: Actions
    @IBAction func CancelBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func SaveBtn(_ sender: Any) {
        counter = counter + 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        sendValue = counter + 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueHowMainScreen" {
            if let destinationVC = segue.destination as? ViewController {
                destinationVC.numberToDisplay = sendValue
            }
        }
    }
    
}
