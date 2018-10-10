//
//  ViewController.swift
//  ShowingSecondScreenProgrammly
//
//  Created by Kalin Karev on 8/15/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

protocol MainViewControllerDelegate: AnyObject {
    func passNumberOfHoles(_ controller: ViewController, passInt: Int)
}

class ViewController: UIViewController {

    var numberHoles: Int = 0

    weak var delegate: MainViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Actions
    @IBAction func addBtn(_ sender: UIBarButtonItem) {
        print("You have pressed the button")
        
        showActionSheet()
    }
    
    func showActionSheet() {
        let alertController = UIAlertController(title: "Choose", message: nil, preferredStyle: .actionSheet)
        
        let nineButton = UIAlertAction(title: "Nine holes", style: .default, handler: {
            (action) -> Void in
            print("Nine holes")
            self.numberHoles = 9
            self.goToTheNextScreen()
        })
        let eighteenButton = UIAlertAction(title: "Eighteen holes", style: .default, handler: {
            (action) -> Void in
            print("Eighteen")
            self.numberHoles = 18
            self.goToTheNextScreen()
        })
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (action) -> Void in
            print("Cancel button pressed")
        })
        
        alertController.addAction(nineButton)
        alertController.addAction(eighteenButton)
        alertController.addAction(cancelButton)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func numberOfHoles() {
        print("The number of holes is: \(numberHoles)")
    }

    func goToTheNextScreen() {
        print("Function")
    }
    
//    func goToTheNextScreen() {
//        if let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NavigationControllerSecondScreen") as! UINavigationController {
//            let yourViewController: SecondViewController = (self as? SecondViewController)! {
//                yourViewController.someValue = 10
//                self.window?.rootViewController = controller
//            }
//        }
//    }
    
//    func goToTheNextScreen() {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
////        let vc = storyboard.instantiateViewController(withIdentifier: "NavigationControllerSecondScreen")
////        let secondVC: SecondViewController = storyboard.instantiateViewController(withIdentifier: "MySecondScreen") as! SecondViewController
////        let secondVC: SecondViewController = storyboard.instantiateViewController(withIdentifier: "MySecondScreen") as! SecondViewController
////        storyboard.instantiateViewController(withIdentifier: "NavigationControllerSecondScreen")
//
//        let secondVC = storyboard.instantiateViewController(withIdentifier: "NavigationControllerSecondScreen")
//
//        let vc: SecondViewController = storyboard.instantiateViewController(withIdentifier: "MySecondScreen") as! SecondViewController
//
//        vc.passedValue = numberHoles
//
//        print("The passed value is: \(vc.passedValue!)")
//
////        secondVC.passedValue = numberHoles
//
//        self.present(vc, animated: true, completion: nil)
//    }
}
