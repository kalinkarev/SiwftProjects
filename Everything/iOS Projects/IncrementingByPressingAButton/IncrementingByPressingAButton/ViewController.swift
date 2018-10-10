//
//  ViewController.swift
//  IncrementingByPressingAButton
//
//  Created by Kalin Karev on 3/28/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var numberToDisplay: Int = 0
    
    // MARK: Properties
    @IBOutlet weak var counterLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        counterLabel.text = "The counter was tapped \(numberToDisplay) times."
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }

}

