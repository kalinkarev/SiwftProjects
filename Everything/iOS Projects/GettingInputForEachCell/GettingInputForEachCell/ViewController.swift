//
//  ViewController.swift
//  GettingInputForEachCell
//
//  Created by Kalin Karev on 8/7/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

var numberOfCell = 0

class ViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var numberOfCellsTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Actions
    @IBAction func created(_ sender: UIButton) {
        numberOfCell = Int(numberOfCellsTextField.text!)!
        
        let tableviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "TableViewController") as! TableViewController
        
        DispatchQueue.main.async {
            self.present(tableviewcontroller, animated: true, completion: nil)
        }
    }

}

