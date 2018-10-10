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
    
    func getTextOfUserInput() -> (stringToSearch: String, stringToRemove: String) {
        let stringSearched = searchedString.text
        let stringRemove = removingString.text
        
        return (stringSearched!, stringRemove!)
    }
    
    func printOutputText(_ inputString: String) {

        let userStrings = getTextOfUserInput()
        let stringSearched = userStrings.stringToSearch
        let stringRemove = userStrings.stringToRemove
        
        outputTextView.text = inputTextWithChange(inputString, stringSearched, stringRemove)
    }
    
}

func inputTextWithChange(_ inputString: String, _ lookingForString: String, _ removingWithString: String) -> String {
    var word: String = ""
    var final: String = ""
    
    let spaceValue = 32
    let u = UnicodeScalar(spaceValue)
    let charSpace = Character(u!)
    for index in (inputString.indices) {
        if (inputString[index] > charSpace) {
            word.append(inputString[index])
        } else {
            word = changeSymbol(word, lookingForString, removingWithString)
            word.append(inputString[index])
            final.append(word)
            word = ""
        }
    }
    word = changeSymbol(word, lookingForString, removingWithString)
    final.append(word)
    return final
}

func changeSymbol(_ newString: String, _ lookingString: String, _ removingString: String) -> String {
    var stringChange = newString
    if (stringChange == lookingString) {
        stringChange = removingString
    }
    return stringChange
}
