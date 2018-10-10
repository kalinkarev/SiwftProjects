//
//  ViewController.swift
//  TestingTextViewWithSpecificNumberOfCharacters
//
//  Created by Kalin Karev on 9/17/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: Properties
    @IBOutlet weak var userTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        userTextView.textContainer.maximumNumberOfLines = 1

        userTextView.delegate = self
        userTextView.text = "Enter"
        userTextView.textColor = UIColor.lightGray

        self.hideKeyboardWhenTappedAround()

        if userTextView.text == "Enter" {
            userTextView.selectedTextRange = userTextView.textRange(from: userTextView.beginningOfDocument, to: userTextView.beginningOfDocument)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {

        if text == "\n" {
            textView.resignFirstResponder()
        }

        let currentText: String = textView.text
        let updatedText = (currentText as NSString).replacingCharacters(in: range, with: text)

        if updatedText.isEmpty {
            textView.text = "Enter"
            textView.textColor = UIColor.lightGray

            textView.selectedTextRange = textView.textRange(from: textView.beginningOfDocument, to: textView.beginningOfDocument)
        } else if textView.textColor == UIColor.lightGray && !text.isEmpty {
            textView.textColor = UIColor.black
            textView.text = text
            print("The currentText is: \(currentText)")
        } else {
            print("The text of currentText is: \(currentText)")

            print("The text of updatedText is: \(updatedText)")
            let lenghtOfUserInput = updatedText.count
            print("The number of character of updatedText is: \(lenghtOfUserInput)")

            if (lenghtOfUserInput > 21) {
                print("Please summarize the input with up to 20 characters")
                return false
            }

            return true
        }

        return false
    }

    func textViewDidChangeSelection(_ textView: UITextView) {
        if self.view.window != nil {
            if textView.textColor == UIColor.lightGray {
                textView.selectedTextRange = textView.textRange(from: textView.beginningOfDocument, to: textView.beginningOfDocument)
            }
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        print("The user has entered: \(userTextView.text)")
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
