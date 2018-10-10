//
//  ViewController.swift
//  ProjectForTestingTextFieldAndButtonToBeActiveAndNot
//
//  Created by Kalin Karev on 10/2/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var flag: Bool = false

    // MARK: Properties
    @IBOutlet weak var holeLabel: UILabel!
    @IBOutlet weak var pointsTextField: UITextField!
    @IBOutlet weak var btnX: UIButton!

    // MARK: Actions
    @IBAction func xButton(_ sender: UIButton) {
        print("You have pressed the X button")
        flag = true
        print("The flag is: \(flag)")
        pointsTextField.text = "X"
        btnX.isHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        holeLabel.text = "Hole 18"
        pointsTextField.placeholder = "Points for hole 18"

        pointsTextField.delegate = self

        print("The flag is: \(flag)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("You have end editing the textfield")
        textField.resignFirstResponder()
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        btnX.isHidden = false
    }
}
