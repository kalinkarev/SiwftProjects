//
//  ViewController.swift
//  PassDataBetweenViewControllers
//
//  Created by Kalin Karev on 8/15/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var number: Int = 5
    
    var secondVC = SecondViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Actions
    @IBAction func addBtnPressed(_ sender: UIBarButtonItem) {
        presentDestinationViewController()
    }

    func presentDestinationViewController() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
//        let vc = storyboard.instantiateViewController(withIdentifier: "secondNavigationController")
        
//        present(vc, animated: true, completion: nil)
        
//        secondVC.passedNumber = self.number
        
        let viewController2: SecondViewController = storyboard.instantiateViewController(withIdentifier: "secondVC") as! SecondViewController
        
        present(viewController2, animated: true, completion: nil)
        
//        viewController2.someValue = number
//        self.number = viewController2.someValue!
        viewController2.someValue = self.number
        
        print("The number is: \(self.number)")
        
//        print(viewController2.passedNumber)
        
//        viewController2.passedNumber = number
        
        self.number = viewController2.someValue!
    }
    
}

