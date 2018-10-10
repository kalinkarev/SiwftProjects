//
//  ViewController.swift
//  TextFieldAddedProgramly
//
//  Created by Kalin Karev on 7/30/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var numberTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    @IBAction func testButton(_ sender: UIButton) {
        print("You have pressed the test button")
        
        let input = numberTextField.text
        let number = Int(input!)

        print("The use has entered: \(number!)")
        
        createLabel(number: number!)
//        createTextView(number: number!)
        createTextField(number: number!)
    }
    
    func createLabel( number: Int) {

        let m = 10
        var n = 100
        var i: Int = 0
        
        while i < number {
            
            let myLabel = UILabel(frame: CGRect(x: m, y: n, width: 150, height: 35))
            //        myLabel.center = CGPointMake(160, 284)
            myLabel.textAlignment = NSTextAlignment.center
            myLabel.font = myLabel.font.withSize(15)
            myLabel.text = "I`am a test label \(i + 1)"
            self.view.addSubview(myLabel)
            
            i += 1
            n += 20
        }
    }

    func createTextView( number: Int) {
        let m = 150
        var n = 100
        var j: Int = 0
        
        while j < number {
            let myTextView = UITextView(frame: CGRect(x: m, y: n, width: 150, height: 35))
            myTextView.textAlignment = NSTextAlignment.center
            myTextView.font = .systemFont(ofSize: 13)
            myTextView.text = "The points are: \(j)"
            self.view.addSubview(myTextView)
            
            j += 1
            n += 20
        }
    }
    
    func createTextField( number: Int) {
        let m = 150
        var n = 100
        var j: Int = 0
        
        while j < number {
            let myTextField = UITextField(frame: CGRect(x: m, y: n, width: 150, height: 35))
            myTextField.textAlignment = NSTextAlignment.center
            myTextField.text = "The points are: \(j + 1)"
            self.view.addSubview(myTextField)
            
            j += 1
            n += 20
        }
    }
    
}
