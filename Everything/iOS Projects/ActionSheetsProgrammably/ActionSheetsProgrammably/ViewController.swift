//
//  ViewController.swift
//  ActionSheetsProgrammably
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
    @IBAction func showActinSheetButton(_ sender: UIButton) {
        
//        actionSheet()
        
        showActionSheet()
        
//        addGesture()
//
//        // 1
//        let optionMenu = UIAlertController(title: "Menu", message: "Choose Option", preferredStyle: .actionSheet)
//
//        // 2
//        let deleteAction = UIAlertAction(title: "Delete", style: .default, handler: {
//            (alert: UIAlertAction!) -> Void in
//            print("File Deleted")
//        })
//
//        let saveAction = UIAlertAction(title: "Save", style: .default, handler: {
//            (alert: UIAlertAction!) -> Void in
//            print("File Saved")
//        })
//
//        // 3
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
//            (alert: UIAlertAction!) -> Void in
//            print("Cancelled")
//        })
//
//        // 4
//        optionMenu.addAction(deleteAction)
//        optionMenu.addAction(saveAction)
//        optionMenu.addAction(cancelAction)
//
//        // 5
////        self.presentedViewController(optionMenu, animated: true, completion: nil)
//        self.present(optionMenu, animated: true, completion: nil)
        
//        let alertController = UIAlertController(title: "Action Sheet", message: "What would you like to do?", preferredStyle: .actionSheet)
//
//        let sendButton = UIAlertAction(title: "Send Now", style: .default, handler: { (action) -> Void in
//            print("OK button tapped")
//            number += 1
//            print("The number is: \(number)")
//        })
//
//        let deleteButton = UIAlertAction(title: "Delete Now", style: .destructive, handler: { (action) -> Void in
//            print("DELETE button tapped")
//            number += 2
//            print("The number is: \(number)")
//        })
//
//        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) -> Void in
//            print("Cancel button tapped")
//            number += 3
//            print("The number is: \(number)")
//        })
//
//        alertController.addAction(sendButton)
//        alertController.addAction(deleteButton)
//        alertController.addAction(cancelButton)
//
////        self.navigationController?.present(alertController, animated: true, completion: nil)
//        self.present(alertController, animated: true, completion: nil)
    }
    
    func showActionSheet() {
        let alertController = UIAlertController(title: "Choose what to do?", message: "This are the options", preferredStyle: .actionSheet)
        
        let sendButton = UIAlertAction(title: "Send Now", style: .default, handler: {
            (action) -> Void in
            print("OK button tapped")
        })
        let deleteButton = UIAlertAction(title: "Delete Now", style: .destructive, handler: {
            (action) -> Void in
            print("Delete button tapped")
        })
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (action) -> Void in
            print("Canel buttton tapped")
        })
        
        alertController.addAction(sendButton)
        alertController.addAction(deleteButton)
        alertController.addAction(cancelButton)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func actionSheet() {
        
        let alertController = UIAlertController(title: "Action Sheet", message: "What would you like to do?", preferredStyle: .actionSheet)
        
        let sendButton = UIAlertAction(title: "Send Now", style: .default, handler: { (action) -> Void in
            print("OK button tapped")
        })
        
        let seeButton = UIAlertAction(title: "See Now", style: .default, handler: {
            (action) -> Void in
            print("See button tapped")
        })
        
        let deleteButton = UIAlertAction(title: "Delete Now", style: .destructive, handler: { (action) -> Void in
            print("DELETE button tapped")
        })
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) -> Void in
            print("Cancel button tapped")
        })
        
        alertController.addAction(sendButton)
        alertController.addAction(seeButton)
        alertController.addAction(deleteButton)
        alertController.addAction(cancelButton)
        
        self.present(alertController, animated: true, completion: nil)
        
        if deleteButton.isEnabled {
            print("Delete")
        }
        
    }
    
//    func addGesture() {
//        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.showActionSheet))
//        view.addGestureRecognizer(tap)
//    }
//
//    @objc func showActionSheet() {
//        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
//
//        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//
//        let day = UIAlertAction(title: "Day", style: .default) { action in
//
//        }
//
//        let night = UIAlertAction(title: "Night", style: .default) { action in
//
//        }
//
//        actionSheet.addAction(day)
//        actionSheet.addAction(night)
//        actionSheet.addAction(cancel)
//
//        present(actionSheet, animated: true, completion: nil)
//    }
}
