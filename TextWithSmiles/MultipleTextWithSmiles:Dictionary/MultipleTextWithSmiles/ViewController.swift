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
        guard let input = inputTextView.text else {
            fatalError("You haven`t inputted a text")
        }
        return input
    }
    
    func getTextOfUserInput() -> (searched: String, putted: String) {
        guard let searched = searchedString.text else {
            fatalError("You inputted something wrong")
        }

        guard let putted = removingString.text else {
            fatalError("You inpuuted something wrong")
        }
        
        dict[searched] = putted
        print("The dictionary for searched symbols is: \(dict)")
        
        return (searched, putted)
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
        
        guard let u = UnicodeScalar(spaceValue) else {
            fatalError("There is a problem with the space value")
        }
        
        let charSpace = Character(u)
        
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
