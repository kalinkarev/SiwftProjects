//
//  ViewController.swift
//  ButtonThatToShowActionSheet
//
//  Created by Kalin Karev on 8/16/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var passString: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonShow(_ sender: UIBarButtonItem) {
        print("You have pressed the add button")
        showActionSheet()
        performSegue(withIdentifier: "showSecond", sender: self)
    }

    func showActionSheet() {
        let alertController = UIAlertController(title: "", message: nil, preferredStyle: .actionSheet)
        
        let oneButton = UIAlertAction(title: "One button", style: .default, handler: {
            (action) -> Void in
            print("One")
            
            self.passString = "One button"
            
            self.performSegue(withIdentifier: "showSecond", sender: self)
        })
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (action) -> Void in
            print("Cancel button pressed")
        })
        
        alertController.addAction(oneButton)
        alertController.addAction(cancelButton)
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSecond" {
            if let destinationVC = segue.destination as? SecondViewController {
                destinationVC.newString = passString
            }
        }
    }
    
}

//let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//let vc: UIViewController = storyboard.instantiateViewController(withIdentifier: "") as UIViewController
//self.present(vc, animated: true, completion: nil)

extension ViewController: SecondDelegate {
    func controllerDidCancel(_ controller: SecondViewController) {
        dismiss(animated: true, completion: nil)
    }
}
