//
//  SecondViewController.swift
//  ButtonThatToShowActionSheet
//
//  Created by Kalin Karev on 8/16/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

protocol SecondDelegate: AnyObject {
    func controllerDidCancel(_ controller: SecondViewController)
}

class SecondViewController: UIViewController {

    var newString: String = ""
    
    weak var delegate: SecondDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("The string is: \(newString)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelBtn(_ sender: Any) {
        print("Cancel button pressed")
        delegate?.controllerDidCancel(self)
    }
    
    @IBAction func saveBtn(_ sender: Any) {
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
