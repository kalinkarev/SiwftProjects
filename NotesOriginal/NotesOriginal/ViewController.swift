//
//  ViewController.swift
//  NotesOriginal
//
//  Created by Kalin Karev on 2/1/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Properties
    
    @IBOutlet weak var nameTextField: UITextField!
    // attribute tells that we can connect to the nameTextField property from Interface Bulder
    // weak -> indicates that the reference does not prevent the system from deallocating the referenced object
    // ! -> indicates that the type is an implicitly unwrapped optional, which is an optional type that will always have a value after it is first set. When you access an implicitly unwrapped optional, the system assumes it has a valid and automatically unwraps it for you. Note that this causes the app to terminate if the variable's value has not yet been set.
    
    @IBOutlet weak var noteNameLabel: UILabel!
    // You only need an outlet to an interface object if you plan to either access a value from the interface object or modify the interface object in your code.
    
    // OUTLETS are used only for modifying
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

}

