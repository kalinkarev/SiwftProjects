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
        var result = ""
        
        let separatedNumbers = numberSeparated.text
        var number = Int(separatedNumbers!)
        
        if number == nil || number == 0 {
            number = 5
        }
        
        result = formatString(input: input!, number: number!)
        
        outputLabel.text = result
        
        self.view.endEditing(true) // hiding the keyboard when the button is pressed
    }
}
    
func formatString( input: String, number: Int) -> String {
    var userInput = input
//    print("The input is: \(userInput)")
    let countSymbols = userInput.count
//    print("The number of characters in the string are: \(countSymbols)")
    if (countSymbols < 3 || countSymbols > 25) {
        print("You should enter number between 3 and 25 digits.")
    }
    
    let numberOfSeparators = countSymbols / number
    
    var numberOfSymbolsBeforeFirstSeparator = countSymbols % number
//    print("The number of symbols before the first separator is: \(numberOfSymbolsBeforeFirstSeparator)")
    for _ in 0..<numberOfSeparators {
        userInput.insert(" ", at: (userInput.index((userInput.startIndex), offsetBy: numberOfSymbolsBeforeFirstSeparator)))
        numberOfSymbolsBeforeFirstSeparator += number + 1
    }
    
//    print("The result is: \(userInput)")
    return userInput
}
