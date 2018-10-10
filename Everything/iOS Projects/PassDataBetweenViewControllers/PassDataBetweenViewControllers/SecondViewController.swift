//
//  SecondViewController.swift
//  PassDataBetweenViewControllers
//
//  Created by Kalin Karev on 8/15/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var numberLabel: UILabel!

    var someValue: Int?
    
//    var passedNumber: Int! {
//        didSet {
//            self.someValue = passedNumber
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        numberLabel.text = String(describing: someValue)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    @IBAction func cancelBtnPressed(_ sender: UIBarButtonItem) {
        print("The number is: \(String(describing: someValue))")
    }
    
    @IBAction func saveBtnPressed(_ sender: UIBarButtonItem) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
