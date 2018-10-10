//
//  ViewController.swift
//  AddingPlaceholderToTextView
//
//  Created by Kalin Karev on 9/14/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {
    // MARK: Properties
    @IBOutlet weak var inputTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        inputTextView.text = "Enter text"
        inputTextView.textColor = UIColor.lightGray
        inputTextView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }

    func textViewDidBeginEditing(_ textView: UITextView) {
        if (textView.text == "Enter text") {
            textView.text = ""
        }
        textView.becomeFirstResponder()
        textView.textColor = UIColor.black
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if (textView.text == "") {
            textView.text = "Enter text"
            textView.textColor = UIColor.lightGray
        }
        textView.resignFirstResponder()
    }
}

//extension ViewController: UITextViewDelegate {
//}

//extension ViewController: UITextViewDelegate {
//    override open var bounds: CGRect {
//        didSet {
//            self.resizePlaceholder()
//        }
//    }
//
//    public var placeholder: String? {
//        get {
//            var placeholderText: String?
//
//            if let placeholderLabel = self.viewWithTag(100) as? UILabel {
//                placeholderText = placeholderLabel.text
//            }
//
//            return placeholderText
//        }
//        set {
//            if let placeholderLabel = self.viewWithTag(100) as! UILabel? {
//                placeholderLabel.text = newValue
//                placeholderLabel.sizeToFit()
//            } else {
//                self.addPlaceholder(newValue!)
//            }
//        }
//
//        public func func textViewDidChange(_ textView: UITextView) {
//            if let placeholderLabel = self.viewWithTag(100) as? UILabel {
//                placeholderLabel.isHidden = self.text.characters.count > 0
//            }
//        }
//
//        private func resizePlaceholder() {
//            if let placeholderLabel = self.viewWithTag(100) as! UILabel? {
//                let labelX = self.textContainer.lineFragmentPadding
//                let labelY = self.textContainerINset.top - 2
//                let labelWidth = self.frame.width - (labelX * 2)
//                let labelHeight = placeholderLabel.frame.height
//
//        placeholderLabel.frame = CGRect(x: labelX, y: labelY, width: labelWidth, height: labelHeight)
//            }
//        }
//
//        private func addPlaceholder(_ placeholderText: String) {
//            let placeholderLabel = UILabel()
//
//            placeholderLabel.text = placeholderText
//            placeholderLabel.sizeToFit()
//
//            placeholderLabel.font = self.font
//            placeholderLabel.textColor = UIColor.lightGray
//            placeholderLabel.tag = 100
//
//            placeholderLabel.isHidden = self.text.characters.count > 0
//
//            self.addSubview(placeholderLabel)
//            self.resizePlaceholder()
//            self.delegate = self
//        }
//    }
//}

