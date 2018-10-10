//
//  ViewController.swift
//  AddingSplashScreenOnApplication
//
//  Created by Kalin Karev on 9/19/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: Properties
    @IBOutlet weak var userLabelMainScreen: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        userLabelMainScreen.text = "Hello from the main screen of the application"
        view.backgroundColor = UIColor.yellow
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
