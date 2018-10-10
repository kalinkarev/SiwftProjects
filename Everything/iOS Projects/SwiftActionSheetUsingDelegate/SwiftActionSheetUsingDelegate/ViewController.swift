//
//  ViewController.swift
//  SwiftActionSheetUsingDelegate
//
//  Created by Kalin Karev on 8/15/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIActionSheetDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        showAlert()
//        self.showAlert()
    }
    
    
    func showAlert() {
        // Create the Alert
        let alert = UIAlertController(title: "Notice", message: "Lauching this missile will destroy the entire universe. Is this what you intended to do?", preferredStyle: UIAlertControllerStyle.alert)
        
        // Add a textfield for user input
        var userInput = UITextField()
        
        // Add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Remind Me Tomorrow", style: UIAlertActionStyle.default, handler: {
            (action) -> Void in
            print("Remind me tommorow pressed")
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: {
            (action) -> Void in
            print("Cancel button tapped")
        }))
        alert.addAction(UIAlertAction(title: "Launch the Missile", style: UIAlertActionStyle.destructive, handler: {
            (action) -> Void in
            print("Launch the missle pressed")
        }))
        
        // Show the Alert
        self.present(alert, animated: true, completion: nil)
    }
    
}
