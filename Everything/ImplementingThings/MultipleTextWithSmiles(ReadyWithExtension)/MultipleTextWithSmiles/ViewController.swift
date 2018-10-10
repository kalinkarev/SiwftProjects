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
    
    var searchSymbols: [String] = [":)", "new"]
    var putSymbols: [String] = ["!!", "old"]
    
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
            fatalError("You have inputted something wrong")
        }
        
        return input
    }
    
    func printOutputText(input: String) {
        
        guard let searched = searchedString.text else {
            fatalError("Error with inputting a string for change")
        }
        
        guard let putted = removingString.text else {
            fatalError("Error with inputting a string for putting")
        }
        
        searchSymbols.append(searched)
//        print("The array for search symbols is: \(searchSymbols)")
        putSymbols.append(putted)
//        print("The array for putting symbols is: \(putSymbols)")
        
        outputTextView.text = input.inputTextWithChange(searching: searchSymbols, putting: putSymbols)
    }
}

extension String {
    func inputTextWithChange(searching: [String], putting: [String]) -> String {
        let input = self
        var word: String = ""
        var final: String = ""
        
        let spaceValue = 32
        guard let u = UnicodeScalar(spaceValue) else {
            fatalError("Error with the space character")
        }
        let charSpace = Character(u)
        
        for index in (input.indices) {
            if (input[index] > charSpace) {
                word.append(input[index])
            } else {
                word = changeSymbol(newInput: word, searching: searching, putting: putting)
                word.append(input[index])
                final.append(word)
                word = ""
            }
        }
        word = changeSymbol(newInput: word, searching: searching, putting: putting)
        final.append(word)
        return final
    }
    
    func changeSymbol( newInput: String, searching: [String], putting: [String]) -> String {
        var changeInput = newInput
        
        for i in 0..<searching.count {
            if changeInput == searching[i] {
                changeInput = putting[i]
            }
        }
        return changeInput
    }
}
