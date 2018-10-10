//
//  AddViewController.swift
//  MakingApplicationThatToWorkWithDelegates
//
//  Created by Kalin Karev on 8/17/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

protocol AddViewControllerDelegate: AnyObject {
    func controllerDidCancel(_ controller: AddViewController)
}

class AddViewController: UIViewController {

    var transferString: String = ""
    
    // MARK: Properties
    weak var delegate: AddViewControllerDelegate?
    
    // MARK: Actions
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        delegate?.controllerDidCancel(self)
    }
    
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("The string is: \(transferString)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
