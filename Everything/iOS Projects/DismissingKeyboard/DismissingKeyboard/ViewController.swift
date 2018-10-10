//
//  ViewController.swift
//  DismissingKeyboard
//
//  Created by Kalin Karev on 9/10/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Properties

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var pointsTextField: UITextField! {
        didSet {
            pointsTextField.addDoneCancelToolBar(onDone: (target: self, action: #selector(doneButtonTappedForMyNumericTextField)))
        }
    }

    func doneButtonTappedForMyNumericTextField() {
        print("Done")
        pointsTextField.resignFirstResponder()
    }
}

extension UITextField {
    func addDoneCancelToolBar(onDone: (target: Any, action: Selector)? = nil, onCancel: (target: Any, action: Selector)? = nil) {
        let onCancel = onCancel ?? (target: self, action: #selector(cancelButtonTapped))
        let onDone = onDone ?? (target: self, action: #selector(doneButtonTapped))
        
        let toolbar: UIToolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.items = [
            UIBarButtonItem(title: "Cancel", style: .plain, target: onCancel.target, action: onCancel.action),
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil),
            UIBarButtonItem(title: "Done", style: .done, target: onDone.target, action: onDone.action)
        ]
        toolbar.sizeToFit()
        
        
        
        self.inputAccessoryView = toolbar
    }
    
    // Default actions:
    @objc func doneButtonTapped() {
        self.resignFirstResponder()
    }
    
    @objc func cancelButtonTapped() {
        self.resignFirstResponder()
    }
}
