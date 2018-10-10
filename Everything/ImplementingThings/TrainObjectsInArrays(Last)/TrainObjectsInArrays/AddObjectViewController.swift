//
//  AddObjectViewController.swift
//  TrainObjectsInArrays
//
//  Created by Kalin Karev on 7/4/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

protocol AddObjectViewControllerDelegate: AnyObject {
    // function used for cancelling the saving of a new object
    func controllerDidCancel(_ controller: AddObjectViewController)
    // function used for saving the new object
    func controllerDidSave(_ controller: AddObjectViewController, didSave: Object)
}

class AddObjectViewController: UIViewController {

    var objectManager = ObjectManager()
    
    // MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    
    weak var delegate: AddObjectViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Add note"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    @IBAction func cancelBtn(_ sender: UIBarButtonItem) {
        let isPresentingInAddObjectMode = presentingViewController is UINavigationController
        
        if (isPresentingInAddObjectMode) {
            delegate?.controllerDidCancel(self)
        } else {
            fatalError("The ObjectViewController is not inside a navigation controller.")
        }
    }
    
    @IBAction func saveBtn(_ sender: UIBarButtonItem) {
        let isPresentingInAddObjectMode = presentingViewController is UINavigationController
        
        if (isPresentingInAddObjectMode) {
            if let newObject = Object(id: 0, name: nameTextField.text ?? "") {
                delegate?.controllerDidSave(self, didSave: newObject)
            }
        } else {
            fatalError("The ObjectViewController is not inside a navigation controller.")
        }
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
