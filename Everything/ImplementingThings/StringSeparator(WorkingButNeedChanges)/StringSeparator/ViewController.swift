//
//  ViewController.swift
//  StringSeparator
//
//  Created by Kalin Karev on 7/17/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    @IBAction func formatButton(_ sender: UIButton) {
        print("You have pressed the format button")
        
//        let userInput = inputTextField.text
        let userInput  = "1234567890123"
        print("The user has entered: \(String(describing: userInput))")
        
        let reversedInput = String(userInput.reversed())
        print("The reversed string is: \(reversedInput)")

        let newInput = makeFormation(separator: ";", afterEveryXCharacters: 5, intoString: reversedInput)
        let output = String(newInput.reversed())
        print("The output is: \(output)")
        
//        let reversedInput = reverse(userInput)
//        print("The reverse is: \(reversedInput)")
        
//        let reversedInput = String(describing: userInput?.reversed())
//        print("The reversed user input is: \(reversedInput)")
        
        
//        makeFormation(separator: ":", afterEveryXCharacters: 5, intoString: userInput!)
//
//        let reversedInput = String(describing: userInput?.reversed())
//        let newString = makeFormation(separator: ":", afterEveryXCharacters: 5, intoString: reversedInput)
//        let lastString = String(newString.reversed())
//        print("The result is: \(lastString)")
        
    }
    
    func makeFormation(separator: String, afterEveryXCharacters: Int, intoString: String) -> String {
        var ouput = ""
        for (index, c) in intoString.enumerated() {
            if index % afterEveryXCharacters == 0 && index > 0 {
                ouput += separator
            }
            ouput.append(c)
        }
        return ouput
    }
    
    func reverse(_ s: String) -> String {
        var str = ""
        for character in s.characters {
            str = "\(character)" + str
            print(str)
        }
        return str
    }
    
}

