//
//  ViewController.swift
//  MakingApplicationThatToWorkWithDelegates
//
//  Created by Kalin Karev on 8/17/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Actions
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        print("You have pressed the ADD button")

        showActionSheet()

//        performSegue(withIdentifier: "goToNextScreen", sender: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToNextScreen" {
            print("Hello from the tranfer")
            let navigationController = segue.destination as? UINavigationController
            let nextScreen = navigationController?.topViewController as? AddViewController
            
            if let viewController = nextScreen {
                viewController.delegate = self

                viewController.transferString = "Success"
            }
        }
    }
    
    func showActionSheet() {
        let alertController = UIAlertController(title: "Choose", message: "Options", preferredStyle: .actionSheet)
        
        let oneButton = UIAlertAction(title: "Play", style: .default, handler: {
            (action) -> Void in
            print("You have pressed the first button |Play|")
            
            self.performSegue(withIdentifier: "goToNextScreen", sender: self)
        })
        let twoButton = UIAlertAction(title: "Pause", style: .default, handler: {
            (action) -> Void in
            print("You have pressed the second button |Pause|")
            
            self.performSegue(withIdentifier: "goToNextScreen", sender: self)
        })
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (action) -> Void in
            print("You have pressed the third button |Cancel|")
        })
        alertController.addAction(oneButton)
        alertController.addAction(twoButton)
        alertController.addAction(cancelButton)
        self.present(alertController, animated: true, completion: nil)
    }
}

extension ViewController: AddViewControllerDelegate {
    func controllerDidCancel(_ controller: AddViewController) {
        dismiss(animated: true, completion: nil)
    }
}
