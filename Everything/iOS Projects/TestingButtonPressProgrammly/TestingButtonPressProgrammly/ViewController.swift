//
//  ViewController.swift
//  TestingButtonPressProgrammly
//
//  Created by Kalin Karev on 8/7/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var numberSections = [1, 2, 3, 4]
    var numberOfHolesInGame: Int = 9

    var implementedTextField = UITextField()

    var dictionaryButtonTextField: [Int : String] = [:]
    var dictionarySave: [Int : Int] = [:]

    // MARK: Properties
    @IBOutlet weak var userTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        userTableView.register(MyOwnTableViewCell.self, forCellReuseIdentifier: "mainCell")

        iterateOverTheArray()

        printDictionary()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberSections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath) as! MyOwnTableViewCell

        cell.myTxtField.placeholder = "Enter text"

        cell.myButton.setTitle("Press", for: .normal)
        cell.myButton.setTitleColor(UIColor.blue, for: .normal)

        implementedTextField = cell.myTxtField

        for j in 0...dictionarySave.count {
            dictionaryButtonTextField[j] = cell.myTxtField.text
        }

//        cell.myButton.addTarget(self, action: #selector(self.buttonPressed), for: .touchUpInside)

        return cell
    }

    @IBAction func buttonPressed(_ sender: Any) {
//        print("The input is: \()")
//        print("The input is: \(String(describing: implementedTextField.text))")
        print("You have pressed the button")
        for (key, value) in dictionaryButtonTextField.enumerated() {
            print("The key is: \(key) and has value: \(value)")
        }
    }

    func iterateOverTheArray() {
        var i: Int = 0
        while (i < numberSections.count) {
            print("The i is: \(i) and has value: \(numberSections[i])")
            dictionarySave[i] = numberSections[i]
            i += 1
        }
    }

    func printDictionary() {
        for (key, value) in dictionarySave.sorted(by: <) {
            print("The key is: \(key) and has value: \(value)")
        }
    }
    
    func userDictionary() {
        for (key, value) in dictionaryButtonTextField {
            print("The key is: \(key) and has value: \(value)")
        }
    }
//    @objc private func buttonPressed() {
//        print("You have pressed the button")
//        printInput(input: )
//    }
//
//    func printInput(input: String) {
//        print("The user has entered: \(input)")
//    }

}
