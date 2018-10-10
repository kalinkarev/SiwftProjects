//
//  SecondViewController.swift
//  ShowingSecondScreenProgrammly
//
//  Created by Kalin Karev on 8/15/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var testLabel: UILabel!
    
    var someValue: Int? = nil
    
    var passedValue: Int! {
        didSet {
            self.someValue = passedValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("The number THAT IS PASSED is: \(passedValue!)")
        
        testLabel.text = String(passedValue)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    @IBAction func cancelBtn(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func saveBtn(_ sender: UIBarButtonItem) {
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

//extension SecondViewController: MainViewControllerDelegate {
//    func passNumberOfHoles(_ controller: ViewController, passInt: Int) {
//        self.number = passInt
//    }
//}
