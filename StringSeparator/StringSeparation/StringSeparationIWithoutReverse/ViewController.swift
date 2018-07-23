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
        
        guard let input = inputTextField.text else {
            fatalError("You have inputted something wrong")
        }
        
        guard let separator = separatorTextField.text else {
            fatalError("You have inputted something wrong")
        }
        
        guard let separatedNumbers = numberSeparated.text else {
            fatalError("You have inputted something wrong")
        }
        
        var result = ""

        result = input.textInput(userInput: input, separator: separator, groupNumber: separatedNumbers)
//        result = (input.textInput(userInput: input, separator: separator!, groupNumber: separatedNumbers!))!
        
        outputLabel.text = result
        self.view.endEditing(true) // hiding the keyboard when the button is pressed
    }
}

extension String {
    
    func textInput( userInput: String, separator: String, groupNumber: String) -> String {
        var input = userInput
        var separator = separator
        var result = ""
        
        if input.count < 3 || input.count > 25 {
            print("You should enter a number between 3 and 25 digits.")
        }
        
        let separatedNumbers = groupNumber
        var number = Int(separatedNumbers)
        
        if number == nil || number == 0 {
            number = 5
        }
        
        if separator.isEmpty {
            separator = " "
        }
        
        result = input.formatString(number: number!, separator: separator)
        return result
    }
    
    mutating func formatString( number: Int, separator: String) -> String {
        let numberOfSeparators = self.count / number
        var numberOfSymbolsBeforeFirstSeparator = self.count % number
        
        for _ in 0..<numberOfSeparators {
            self.insert(contentsOf: separator, at: (self.index(self.startIndex, offsetBy: numberOfSymbolsBeforeFirstSeparator)))
            numberOfSymbolsBeforeFirstSeparator += number + separator.count
        }
        return self
    }
}
