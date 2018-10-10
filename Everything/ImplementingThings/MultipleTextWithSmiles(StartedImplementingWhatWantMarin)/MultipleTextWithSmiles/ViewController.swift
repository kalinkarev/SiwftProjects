//
//  ViewController.swift
//  MultipleTextWithSmiles
//
//  Created by Kalin Karev on 7/12/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    // MARK: Properties
    @IBOutlet weak var inputTextView: UITextView!
    @IBOutlet weak var outputTextView: UITextView!
    @IBOutlet weak var searchedString: UITextField!
    @IBOutlet weak var removingString: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Actions
    @IBAction func btnChanged(_ sender: UIButton) {
        let enteredString = getInputText()
        printOutputText(enteredString)
    }
    
    func getInputText() -> String {
        let inputString = inputTextView.text
        return inputString!
    }
    
    func printOutputText(_ inputString: String) {
//        outputTextView.text = changedInputText(inputString)
        outputTextView.text = inputTextWithChange(inputString)
    }
    
    func lookingForString() -> String {
        let searchString = searchedString.text
        return searchString!
    }
    
    func removingWithString() -> String {
        let removeString = removingString.text
        return removeString!
    }

    // function for changing a string
    func symbolChange(_ newString: String) -> String {
        let searchStringTheUserIsLooking = lookingForString()
        let removingStringTheUserIsEntering = removingWithString()
        var stringChange = newString
        if (stringChange == searchStringTheUserIsLooking) {
            stringChange = removingStringTheUserIsEntering
        }
        return stringChange
    }

    // function for changing the input text of the user
    func changedInputText(_ inputString: String) -> String {
        var word: String = ""
        var final: String = ""

        let spaceValue = 32
        let u = UnicodeScalar(spaceValue)
        let charSpace = Character(u!)
        
        for index in (inputString.indices) {
//            print("The characters in the input string is: \(inputString[index])")
            if (inputString[index] > charSpace) {
//                print("Have found a split character")
                word.append(inputString[index])
            } else {
                word = symbolChange(word)
                word.append(inputString[index])
                final.append(word)
                word = ""
            }
        }
        word = symbolChange(word)
        final.append(word)
        
        let outputString = final
        print("The output string is: \(outputString)")
        
        return final
    }
}
func inputTextWithChange(_ inputString: String) -> String {
    var word: String = ""
    var final: String = ""
    
    let spaceValue = 32
    let u = UnicodeScalar(spaceValue)
    let charSpace = Character(u!)
    for index in (inputString.indices) {
        if (inputString[index] > charSpace) {
            word.append(inputString[index])
        } else {
            word = changeSymbol(word, "he", "she")
            word.append(inputString[index])
            final.append(word)
            word = ""
        }
    }
    word = changeSymbol(word, "he", "she")
    final.append(word)
    return final
}

// function for changing a string
func changeSymbol(_ newString: String, _ lookingString: String, _ removingString: String) -> String {
    let searchStringTheUserIsLooking = lookingString
    let removingStringTheUserIsEntering = removingString
    var stringChange = newString
    if (stringChange == searchStringTheUserIsLooking) {
        stringChange = removingStringTheUserIsEntering
    }
    return stringChange
}
