//
//  AddGolfViewController.swift
//  Golf
//
//  Created by Kalin Karev on 7/30/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class AddGolfViewController: UIViewController {

    var sessionNumber: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        showAlert()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        print("You have presed the cancel button")
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        print("You have pressed the save button")
        print("The number is: \(sessionNumber)")
    }
    
    func showAlert() {
        
        let alert = UIAlertController(title: "Choose how many dupki do you want",
                                      message: "Submit something",
                                      preferredStyle: .alert
        )
        
        // Submit button
        let submitAction = UIAlertAction(title: "Submit", style: .default, handler: {
            (action) -> Void in
            // Get 1st TextField`s text
            let textField = alert.textFields![0]
            
            let number = Int(textField.text!)
            
            self.sessionNumber = number!
            
            self.showTexts()
        })
        
        // Cancel button
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: {
            (action) -> Void in
        })
        
        // Add 1 textField and customize it
        alert.addTextField { (textField: UITextField) in
            textField.keyboardAppearance = .dark
            textField.keyboardType = .default
            textField.autocorrectionType = .default
            textField.placeholder = "Type the number of holes you want to have"
            textField.clearButtonMode = .whileEditing
        }
        
        // Add action buttons and present the Alert
        alert.addAction(submitAction)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
    func showTexts() {
        createLabel(number: sessionNumber)
        createTextField(number: sessionNumber)
    }
    
    func createLabel( number: Int) {
        let m: Int = 10
        var n: Int = 100
        var i: Int = 0
        
        while (i < number) {
            let myLabel = UILabel(frame: CGRect(x: m, y: n, width: 150, height: 35))
            myLabel.textAlignment = NSTextAlignment.center
            myLabel.font = myLabel.font.withSize(15)
            myLabel.text = "I am a test label \(i + 1)"
            self.view.addSubview(myLabel)
            
            i += 1
            n += 20
        }
    }
    
    func createTextField( number: Int) {
        let m: Int = 150
        var n: Int = 100
        var j: Int = 0
        
        while (j < number) {
            let myTextField = UITextField(frame: CGRect(x: m, y: n, width: 150, height: 35))
            myTextField.textAlignment = NSTextAlignment.center
            myTextField.text = "The points are: \(j + 1)"
            self.view.addSubview(myTextField)
            
            j += 1
            n += 20
        }
    }
    
    func createTextView( number: Int) {
        let m: Int = 150
        var n: Int = 100
        var j: Int = 0
        
        while (j < number) {
            let myTextView = UITextView(frame: CGRect(x: m, y: n, width: 150, height: 35))
            myTextView.textAlignment = NSTextAlignment.center
            myTextView.font = .systemFont(ofSize: 13)
            myTextView.text = "The points are: \(j + 1)"
            self.view.addSubview(myTextView)

            j += 1
            n += 20
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
