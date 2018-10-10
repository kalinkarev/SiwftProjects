//
//  ViewController.swift
//  ShowingActionSheet
//
//  Created by Kalin Karev on 8/15/18.
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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "secondScreen" {
            showActionSheet()
            print("You are going to the second screen")
//            showActionSheet()
            
            let navigationController = segue.destination as? UINavigationController
            let secondViewController = navigationController?.topViewController as? SecondViewController
            
            if let viewController = secondViewController {
                viewController.delegate = self
            }
            
//            if let viewController = secondViewController {
////                viewController.delegate = self
//            }
        }
    }
    
    // MARK: Actions
    @IBAction func addButton(_ sender: UIBarButtonItem) {
//        print("Add button pressed")
//        showActionSheet()
    }
    
    func showActionSheet() {
        let alertController = UIAlertController(title: "Choose holes", message: nil, preferredStyle: .actionSheet)
        
        let nineButton = UIAlertAction(title: "Nine holes", style: .default, handler: {
            (action) -> Void in
            print("Nine holes")
            
            
            
        })
        let eighteenButton = UIAlertAction(title: "Eighteen holes", style: .default, handler: {
            (action) -> Void in
            print("Eighteen holes")
        })
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (action) -> Void in
            print("Cancel button tapped")
        })
        
        alertController.addAction(nineButton)
        alertController.addAction(eighteenButton)
        alertController.addAction(cancelButton)
        
        self.present(alertController, animated: true, completion: nil)
    }
}

extension ViewController: SecondViewControllerDelegate {
    func controllerDidAdd(_ controller: SecondViewController) {
//        showActionSheet()
    }
}
