//
//  ViewController.swift
//  AlertsProgrammably
//
//  Created by Kalin Karev on 7/31/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Actions
    @IBAction func showButton(_ sender: UIButton) {
        print("Button pressed")
        customAlert()
    }
    
    func showAlert() {
//        let alert = UIAlertController(title: "What`s your name?", message: nil, preferredStyle: .alert)
//
//        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//
//        alert.addTextField(configurationHandler: {
//            textField in textField.placeholder = "Input yourname here..."
//        })
//        
//        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {
//            action in
//            
//            if let name = alert.textFields?.first?.text {
//                print("Your name: \(name)")
//            }
//        }))
//        
//        self.present(alert, animated: true)
//    }
    
    }
    
    func customAlert() {
        let alert = UIAlertController(title: "AlertController Tutorial",
                                      message: "Submit something",
                                      preferredStyle: .alert
        )
        
        // Submit button
        let submitAction = UIAlertAction(title: "Submit", style: .default, handler: {
            (action) -> Void in
            // Get 1st TextField`s text
            let textField = alert.textFields![0]
            print(textField.text!)
        })
        
        // Cancel button
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: {
            (action) -> Void in
        })
        
        // Add 1 textField and customize it
        alert.addTextField { (textField: UITextField) in
            textField.keyboardAppearance = .dark
            textField.keyboardType = .default
            textField.autocorrectionType = .default
            textField.placeholder = "Type something here"
            textField.clearButtonMode = .whileEditing
        }
        
        // Add action buttons and present the Alert
        alert.addAction(submitAction)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
    
}

