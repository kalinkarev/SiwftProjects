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
    @IBOutlet weak var ouptutLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Actions
    @IBAction func formatButon(_ sender: UIButton) {
        var userInput = inputTextField.text
        
        print("The input is: \(String(describing: userInput))")
        
        let countSymbols = userInput?.count
        print("The number of characters in the string are: \(String(describing: countSymbols))")
        
        if (countSymbols! < 3 || countSymbols! > 25) {
            print("You should enter number between 3 and 25 digits")
            exit(1)
        }
        
        var numberOfSeparators = 0
        
        if (countSymbols! % 5 == 0) {
            numberOfSeparators = (countSymbols! / 5) - 1
        } else {
            numberOfSeparators = countSymbols! / 5
        }
        
        print("The number of spaces should be: \(numberOfSeparators)")
        
        var numberOfSymbolsBeforeFirstSeparator = countSymbols! - (numberOfSeparators * 5)
        
        for _ in 0..<numberOfSeparators {
            userInput!.insert(" ", at: (userInput?.index((userInput?.startIndex)!, offsetBy: numberOfSymbolsBeforeFirstSeparator))!)
            numberOfSymbolsBeforeFirstSeparator += 6
        }
        
        print("The result is: \(String(describing: userInput))")
        ouptutLabel.text = userInput
    }
    
}
