//
//  StartingViewController.swift
//  TestingUIAndShowingItINSpecificOrder
//
//  Created by Kalin Karev on 9/19/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class StartingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        perform(Selector(("showNewScreen")), with: nil, afterDelay: 3)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        showNextScreen()
    }

    func showNextScreen() {
        performSegue(withIdentifier: "showMainScreen", sender: self)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
