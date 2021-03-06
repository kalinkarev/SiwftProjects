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
    
    var dict:[String:String] = ["new":"old", ":)":"!!"]
    
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
        let entered = getInputText()
        printOutputText(input: entered)
    }
    
    func getInputText() -> String {
        let input = inputTextView.text
        return input!
    }
    
    func getTextOfUserInput() -> (searched: String, putted: String) {
        let searched = searchedString.text
        let putted = removingString.text

        dict[searched!] = putted
        print("The dictionary for searched symbols is: \(dict)")
        
        return (searched!, putted!)
    }
    
    func printOutputText(input: String) {

        let userInput = getTextOfUserInput()
        _ = userInput.searched
        _ = userInput.putted

        outputTextView.text = inputTextWithChange(input: input, searching: dict.keys, putting: dict.values)
    }

    func inputTextWithChange(input: String, searching: NSDictionary.Key, putting: NSDictionary.Value) -> String {
        var word: String = ""
        var final: String = ""
        
        let spaceValue = 32
        let u = UnicodeScalar(spaceValue)
        let charSpace = Character(u!)
        for index in (input.indices) {
            if (input[index] > charSpace) {
                word.append(input[index])
            } else {
                word = changeSymbol(newInput: word, searching: dict.keys, putting: dict.values)
                word.append(input[index])
                final.append(word)
                word = ""
            }
        }
        word = changeSymbol(newInput: word, searching: dict.keys, putting: dict.values)
        final.append(word)
        return final
    }
    
    func changeSymbol(newInput: String, searching: NSDictionary.Key, putting: NSDictionary.Value) -> String {
        var changeInput = newInput

        for (key, value) in dict {
            if changeInput == key {
                changeInput = value
            }
        }
        
        return changeInput
    }
    
}
