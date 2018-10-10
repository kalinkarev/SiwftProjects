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

    var searchDictionary:[String:String] = ["first":"last", "next":"previous", "new":"old", "last":"this"]

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
        printOutputText()
    }

    func printOutputText() {
        guard let input = inputTextView.text else {
            fatalError("You have inputted something wrong")
        }
        
        guard let searched = searchedString.text else {
            fatalError("Error with inputting a string for change")
        }

        guard let putted = removingString.text else {
            fatalError("Error with inputting a string for putting")
        }

        searchDictionary[searched] = putted

        outputTextView.text = input.changeInput(dictSearch: searchDictionary)
    }
}

extension String {
    func changeInput(dictSearch:[String:String]) -> String {
        var word:String = ""
        var final:String = ""

        let spaceValue = 32
        guard let u = UnicodeScalar(spaceValue) else {
            fatalError("Problems with the space value")
        }
        let charSpace = Character(u)

        for index in self.indices {
            if self[index] > charSpace {
                word.append(self[index])
            } else {
                word = dictSearch[word] ?? word
                word.append(self[index])
                final.append(word)
                word = ""
            }
        }

        word = dictSearch[word] ?? word
        final.append(word)
        return final
    }

}
