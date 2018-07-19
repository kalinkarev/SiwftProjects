//
//  ViewController.swift
//  StringSeparationIWithoutReverse
//
//  Created by Kalin Karev on 7/17/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: Properties
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var numberSeparated: UITextField!
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var separatorTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        outputLabel.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Actions
    @IBAction func formatButon(_ sender: UIButton) {
        let input = inputTextField.text
        var separator = separatorTextField.text
        var result = ""
        
        if (input?.count)! < 3 || (input?.count)! > 25 {
            print("You should enter a number between 3 and 25 digits.")
        }
        
        let separatedNumbers = numberSeparated.text
        var number = Int(separatedNumbers!)
        
        if number == nil || number == 0 {
            number = 5
        }

        if (separator?.isEmpty)! {
            separator = " "
        }
        
        result = (input?.formatString(number: number!, separator: separator!))!
        
        outputLabel.text = result
        
        self.view.endEditing(true) // hiding the keyboard when the button is pressed
    }
}

extension String {
    func formatString( number: Int, separator: String) -> String {
        var userInput = self
        let numberOfSeparators = userInput.count / number
        var numberOfSymbolsBeforeFirstSeparator = userInput.count % number
        
        for _ in 0..<numberOfSeparators {
            userInput.insert(contentsOf: separator, at: (userInput.index(userInput.startIndex, offsetBy: numberOfSymbolsBeforeFirstSeparator)))
            numberOfSymbolsBeforeFirstSeparator += number + separator.count
        }
        return userInput
    }
}
