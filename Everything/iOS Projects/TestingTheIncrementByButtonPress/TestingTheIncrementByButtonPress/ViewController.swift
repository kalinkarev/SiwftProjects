//
//  ViewController.swift
//  TestingTheIncrementByButtonPress
//
//  Created by Kalin Karev on 3/27/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var counter: Int = 0
    
    // MARK: Actions
    @IBAction func btnIncrement(_ sender: UIButton) {
        counter += 1
        print("The counter is: \(counter)")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("The counter is: \(counter)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

