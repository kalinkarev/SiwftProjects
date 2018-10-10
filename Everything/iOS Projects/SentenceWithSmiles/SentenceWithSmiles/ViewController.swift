//
//  ViewController.swift
//  SentenceWithSmiles
//
//  Created by Kalin Karev on 7/11/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Properties
//    @IBOutlet weak var sentenceTextField: UITextField!
    @IBOutlet weak var sentenceTextView: UITextView!
//    @IBOutlet weak var newSentenceLabel: UILabel!
    @IBOutlet weak var newSentenceTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        newSentenceLabel.text = ""
//        sentenceTextField.placeholder = "Enter a sentence"
//        sentenceTextView.text = ""
        if (sentenceTextView.text == "") {
            sentenceTextView.text = "enter a sentence"
        }
        sentenceTextView.becomeFirstResponder()
        newSentenceTextView.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Actions
    @IBAction func transferTheSentence(_ sender: UIButton) {
        print("You have pressed the transfer button")
        transferTheSentence()
//        changeSentence()
    }
  
    func changeSentence() {
//        let input = sentenceTextView.text
        
//        let changedString = input?.replacingOccurrences(of: " :)", with: " !!")
        
//        newSentenceTextView.text = changedString
    }
    
    func transferTheSentence() {
//        let input = sentenceTextField.text
        let input = sentenceTextView.text
        print("The user has entered the sentence: \(String(describing: input))")

        let inputSeparatedByEnter = input?.components(separatedBy: "\n")
        print("The input is separated to: \(String(describing: inputSeparatedByEnter))")
        
        let changeSymbol = ":)"
        
        let numberOfLinesUserEnter = inputSeparatedByEnter?.count
//        print("The number of lines the use has entered is: \(String(describing: numberOfLinesUserEnter))")
        for i in 0..<numberOfLinesUserEnter! {
//            print("The lines are: \(inputSeparatedByEnter![i])")
            var linesInput = inputSeparatedByEnter![i].components(separatedBy: " ")
//            print("The lines are separated to: \(linesInput)")
            let count = linesInput.count
//            print("The number of words in a line is: \(count)")
            for j in 0..<count {
//                print("The elments in the lines are: \(linesInput[j])")
                if (linesInput[j] == changeSymbol) {
//                    print("There are found")
                    linesInput[j] = "!!"
                }
            }
            print("The changed sentence is: \(linesInput)")
            let numberOfLines = linesInput.count
            print("The number of line after change is: \(numberOfLines)")
            
            for k in 0..<numberOfLines {
                newSentenceTextView.text = linesInput[k]
            }
            
//            for k in 0..<numberOfLines {
            
                
                
//                let newSentence: [String] = linesInput
//                let joinedString = newSentence.joined(separator: " ")
//                newSentenceTextView.text = joinedString
//            }
        }
//        print("The sentence after changes is: \(String(describing: inputSeparatedByEnter))")
//
//        let newSentence: [String] = inputSeparatedByEnter!
//
//        let joinedString = newSentence.joined(separator: "\n")
//        print("The new sentence, after change is: \(joinedString)")
        
//        print("The new sentence is: \()")
        
//        let changeSymbol = ":)"
//        let count = fullInput?.count
////        print("The number of words in the sentence is: \(String(describing: count))")
//
//        for i in 0..<count! {
////            print("The elements are: \(fullInput![i])")
//            if (fullInput![i] == changeSymbol) {
////                print("There are found")
//                fullInput![i] = "!!"
//            }
//        }
//        print("The sentence is: \(String(describing: fullInput))")
//
//        let newSentence: [String] = fullInput!
//        print("The new sentence is: \(String(describing: newSentence))")
//
//        let joinedString = newSentence.joined(separator: " ")
//        print("The new sentence, after changes is: \(joinedString)")
//
////        newSentenceLabel.text = joinedString
//        newSentenceTextView.text = joinedString
    }
    
}
