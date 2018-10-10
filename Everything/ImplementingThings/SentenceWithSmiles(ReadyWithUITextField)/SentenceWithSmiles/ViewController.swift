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
    @IBOutlet weak var sentenceTextField: UITextField!
    @IBOutlet weak var newSentenceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        newSentenceLabel.text = ""
        sentenceTextField.placeholder = "Enter a sentence"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Actions
    @IBAction func transferTheSentence(_ sender: UIButton) {
        print("You have pressed the transfer button")
        if sentenceTextField.text == "" {
            toastView(message: "You haven`t inputted any text")
        }
        transferTheSentence()
    }
    
    func transferTheSentence() {
        let input = sentenceTextField.text
//        print("The use has entered the sentence: \(String(describing: input))")
        
        var fullInput = input?.components(separatedBy: " ")
//        print("The sentence is separated to: \(String(describing: fullInput))")
        
        let changeSymbol = ":)"
        let count = fullInput?.count
//        print("The number of words in the sentence is: \(String(describing: count))")
        
        for i in 0..<count! {
//            print("The elements are: \(fullInput![i])")
            if (fullInput![i] == changeSymbol) {
//                print("There are found")
                fullInput![i] = "!!"
            }
        }
        print("The sentence is: \(String(describing: fullInput))")
        
        let newSentence: [String] = fullInput!
        print("The new sentence is: \(String(describing: newSentence))")
        
        let joinedString = newSentence.joined(separator: " ")
        print("The new sentence, after changes is: \(joinedString)")
        
        newSentenceLabel.text = joinedString
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
