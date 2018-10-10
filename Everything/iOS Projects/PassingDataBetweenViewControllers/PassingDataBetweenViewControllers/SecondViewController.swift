//
//  SecondViewController.swift
//  PassingDataBetweenViewControllers
//
//  Created by Kalin Karev on 8/16/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var text: String = ""

    var number: Int = 0
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print("The text variable is: \(text)")
        print("The number is: \(number)")
        nameLabel.text = text + " " + String(number)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButton(_ sender: Any) {
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
