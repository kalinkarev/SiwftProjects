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
        print("The change button was pressed")
        
        let enteredString = inputTextView.text
//        print("The user has entered: \(String(describing: enteredString))")

        if (inputTextView.text == "") {
            toastView(message: "You don`t have text")
        } else if (searchedString.text == "") {
            toastView(message: "You don`t have search")
        } else if (removingString.text == "") {
            toastView(message: "You don`t have remove")
        }
                
        changedInputText(inputString: enteredString!)
    }
    
    func symbolChange( newString: String) -> String {
        var stringChange = newString
        if (stringChange == searchedString.text) {
            stringChange = removingString.text!
        }
        return stringChange
    }
    
    func changedInputText( inputString: String) {
        var word: String = ""
//        print("The String named word is: \(word)")
        var final: String = ""
//        print("The String named final is: \(final)")

        let spaceValue = 32
        let u = UnicodeScalar(spaceValue)
        let charSpace = Character(u!)
//        print("The character is: \(charSpace)")
        
        var counter: Int = 0
        
        for index in (inputString.indices) {
            print("The characters in the input string is: \(inputString[index])")
            if (inputString[index] > charSpace) {
//                print("Have found a split character")
                word.append(inputString[index])
            } else {
                word = symbolChange(newString: word)
                word.append(inputString[index])
                final.append(word)
                word = ""
            }
            counter += 1
        }
        word = symbolChange(newString: word)
        final.append(word)
        
//        print("The final is: \(final)")
        outputTextView.text = final
    }
    
    func toastView(message: String) {
        let toastLabel = UILabel(frame: CGRect(x: view.frame.size.width/2 - 150,
                                               y: view.frame.size.height - 100,
                                               width: 300,
                                               height: 35))
        toastLabel.backgroundColor = UIColor.black
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = NSTextAlignment.center
        view.addSubview(toastLabel)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds = true
        UIView.animate(withDuration: 5.0, delay: 0.3, options: UIViewAnimationOptions.curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        })
    }
}
