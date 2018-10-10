//
//  ShowSplashScreenViewController.swift
//  AddingSplashScreenOnApplication
//
//  Created by Kalin Karev on 9/19/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ShowSplashScreenViewController: UIViewController {
    @IBOutlet weak var textOfWelcomeScreen: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        textOfWelcomeScreen.text = "Welcome to the app"
        perform(#selector(ShowSplashScreenViewController.showMain), with: nil, afterDelay: 5)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @objc func showMain() {
        performSegue(withIdentifier: "showMainScreen", sender: self)
    }
}
