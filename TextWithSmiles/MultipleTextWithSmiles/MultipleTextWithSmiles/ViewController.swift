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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        inputTextView.text = "PlaceHolder"
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
            textView.text = "PlaceHolder"
            textView.textColor = UIColor.lightGray
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Actions
    @IBAction func btnChanged(_ sender: UIButton) {
        print("The change button was pressed")
        
        changedInputText()
    }
    
    func changedInputText() {
        let inputString = inputTextView.text
//        print("The user has inputted: \(String(describing: inputString))")
        
        let numberOfCharactersInString = inputString?.count
        
        var word: String = ""
//        print("The String named word is: \(word)")
        var final: String = ""
//        print("The String named final is: \(final)")

        let spaceValue = 32
        let u = UnicodeScalar(spaceValue)
        let charSpace = Character(u!)
//        print("The character is: \(charSpace)")
        
        let changeSymbol = ":)"
        
        var counter: Int = 0
        
        for index in (inputString?.indices)! {
            print("The characters in the input string is: \(inputString![index])")
            if (inputString![index] > charSpace) { //|| counter == numberOfCharactersInString) {
//                print("Have found a split character")
                word.append(inputString![index])
            } else {
                print("The word is: \(word)")
                if (word == changeSymbol) {
                    word = "!!"
                }
                word.append(inputString![index])
                final.append(word)
                word = ""
            }
            counter += 1
        }
        print("The word is: \(word)")
        if (word == changeSymbol) {
            word = "!!"
        }
        final.append(word)
        
        //        print("The final is: \(final)")
        outputTextView.text = final
    }

}
