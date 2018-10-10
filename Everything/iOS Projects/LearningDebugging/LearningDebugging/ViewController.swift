//
//  ViewController.swift
//  LearningDebugging
//
//  Created by Kalin Karev on 7/16/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Actions
    @IBAction func button1(_ sender: UIButton) {
        print("You have clicked the first button")
    }
    
    @IBAction func button2(_ sender: UIButton) {
        print("You have clicked the scond button")
    }
    
    @IBAction func button3(_ sender: UIButton) {
        print("You have clicked the third button")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let numbers = [1, 3, 7]
        var sum = 0
        let numberOfValuesInTheArray = numbers.count
        for n in 0..<numberOfValuesInTheArray {
            sum += numbers[n]
        }
        print(sum)
        
        someFuntion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func someFuntion(){
        A()
    }
    
    func A() {
        print("Hi there! I am function A")
        let a = B(5)
        print("The final number is \(a)")
        
        let b = C(number: 15)
        print("The final number is: \(b)")
    }
    
    func B(_ number: Int) -> Int {
        print("Hi there! I am function B")
        var b = 4 + 5
        b = b - number
        return b
    }
    
    func C( number: Int) -> Int {
        print("Hi there! I am function C")
        var c = 2 * 5
        c = c - number
        return c
    }

}

