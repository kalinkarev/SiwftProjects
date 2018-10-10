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
        
        inputTextView.text = "Enter text"
        inputTextView.textColor = UIColor.lightGray
    }

    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Enter text"
            textView.textColor = UIColor.lightGray
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Actions
    @IBAction func btnChanged(_ sender: UIButton) {
//        print("The change button was pressed")
        
        let enteredString = getInputText()
//        print("The user has entered: \(String(describing: enteredString))")
        
        printOutputText(inputString: enteredString)
    }
    
    func getInputText() -> String {
        let inputString = inputTextView.text
        return inputString!
    }
    
    func printOutputText( inputString: String) {
        outputTextView.text = changedInputText(inputString: inputString)
    }
    
    func symbolChange( newString: String) -> String {
        let searchStringTheUserIsLooking = looking()
        let removingStringTheUserIsEntering = removing()
        var stringChange = newString
        if (stringChange == searchStringTheUserIsLooking) {
            stringChange = removingStringTheUserIsEntering
        }
        return stringChange
    }
    
    func looking() -> String {
        let searchString = searchedString.text
        return searchString!
    }
    
    func removing() -> String {
        let removeString = removingString.text
        return removeString!
    }
    
    func changedInputText( inputString: String) -> String {
        var word: String = ""
//        print("The String named word is: \(word)")
        var final: String = ""
//        print("The String named final is: \(final)")

        let spaceValue = 32
        let u = UnicodeScalar(spaceValue)
        let charSpace = Character(u!)
//        print("The character is: \(charSpace)")
        
        for index in (inputString.indices) {
//            print("The characters in the input string is: \(inputString[index])")
            if (inputString[index] > charSpace) {
//                print("Have found a split character")
                word.append(inputString[index])
            } else {
                word = symbolChange(newString: word)
                word.append(inputString[index])
                final.append(word)
                word = ""
            }
        }
        word = symbolChange(newString: word)
        final.append(word)
        
        let outputString = final
        print("The output string is: \(outputString)")
        
        return final
    }
}
