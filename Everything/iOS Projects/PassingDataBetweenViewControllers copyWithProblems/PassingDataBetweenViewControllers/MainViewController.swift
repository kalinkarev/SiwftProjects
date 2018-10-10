//
//  MainViewController.swift
//  PassingDataBetweenViewControllers
//
//  Created by Kalin Karev on 8/16/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var numberToPass: String = ""
    var num: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    func goToNextScreen(segue: UIStoryboardSegue, passString: String) {
//        let navVC = segue.destination as! UINavigationController
//        let tableVC = navVC.viewControllers.first as! SecondViewController
//
//        tableVC.text = passString
//        tableVC.number = num
//        self.present(navVC, animated: true, completion: nil)
//    }
//
//    func showActionSheet(segue: UIStoryboardSegue) {
//        let alertController = UIAlertController(title: "Choose", message: nil, preferredStyle: .actionSheet)
//
//        let buttonOne = UIAlertAction(title: "One button", style: .default, handler: {
//            (action) -> Void in
//            print("One button tapped")
//
//            self.numberToPass = "One"
//            self.num = 1
//
//            self.goToNextScreen(segue: segue, passString: self.numberToPass)
//        })
//        let buttonTwo = UIAlertAction(title: "Two button", style: .default, handler: {
//            (action) -> Void in
//            print("Two button tapped")
//
//            self.numberToPass = "Two"
//            self.num = 2
//
//            self.goToNextScreen(segue: segue, passString: self.numberToPass)
//        })
//        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: {
//            (action) -> Void in
//            print("Cancel button tapped")
//        })
//
//        alertController.addAction(buttonOne)
//        alertController.addAction(buttonTwo)
//        alertController.addAction(cancelButton)
//
//        self.present(alertController, animated: true, completion: nil)
//    }

    
    @IBAction func showAction(_ sender: UIBarButtonItem) {
        print("Pressed button")
        performSegue(withIdentifier: "showSecond", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSecond" {
//            showActionSheet(segue: segue)
//            goToNextScreen(segue: segue, passString: "Hello")
//            showActionSheet(segue: segue)

            let alertController = UIAlertController(title: "Choose holes", message: nil, preferredStyle: .actionSheet)

            let oneButton = UIAlertAction(title: "One button", style: .default, handler: {
                (action) -> Void in
                print("One")
            })
            let twoButton = UIAlertAction(title: "Two buton", style: .default, handler: {
                (action) -> Void in
                print("Two")
            })

            alertController.addAction(oneButton)
            alertController.addAction(twoButton)

            self.present(alertController, animated: true, completion: nil)

            let destintionNavVC: UINavigationController = segue.destination as! UINavigationController

            let tableVC = destintionNavVC.viewControllers.first as! SecondViewController

            tableVC.text = "Hello"
            tableVC.number = 5

        }
    }
}

extension MainViewController: SecondViewControllerDelegate {
    func controllerDidCancel(_ controller: SecondViewController) {
        dismiss(animated: true, completion: nil)
    }
}
