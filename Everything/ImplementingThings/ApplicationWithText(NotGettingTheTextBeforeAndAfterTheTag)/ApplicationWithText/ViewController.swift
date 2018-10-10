//
//  ViewController.swift
//  ApplicationWithText
//
//  Created by Kalin Karev on 7/9/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: Properties
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var emojiIcon: UIImageView!
    @IBOutlet weak var locationIcon: UIImageView!
    @IBOutlet weak var labelImage: UILabel!
    @IBOutlet weak var labelLocationLatitude: UILabel!
    @IBOutlet weak var labelLocationLongitude: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        emojiIcon.isHidden = true
        locationIcon.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    @IBAction func checkInput(_ sender: UIButton) {
        print("You have clicked the check button")
        
        imagePressed()
        locationPressed()
    }
    
    func imagePressed() {
        let s = inputTextField.text
        print("The String is \(String(describing: s))")
        
        if s?.range(of: "[img]") != nil {
            if s?.range(of: "[/img]") != nil {
                print("The string \(String(describing: s)) contains [img] tag")
                emojiIcon.isHidden = false
                locationIcon.isHidden = true
                labelLocationLatitude.text = ""
                labelLocationLongitude.text = ""
                
                let fullInput = s?.components(separatedBy: "[")
//                print("The string is: \(fullInput)")
                let firstPart = fullInput![0]
                var secondPart = fullInput![1]
                print("The first part of the input is: \(firstPart)")
                print("The second part of the input is: \(secondPart)")

                let firstWordToRemove = "img]"
                if let range = secondPart.range(of: firstWordToRemove) {
                    secondPart.removeSubrange(range)
                }
                labelImage.text = secondPart
            } else {
                labelImage.text = ""
                emojiIcon.isHidden = true
            }
        } else {
            labelImage.text = ""
            emojiIcon.isHidden = true
        }
    }
    
    func locationPressed() {
        let s = inputTextField.text
        print("The String is: \(String(describing: s))")
        if s?.range(of: "[lng]") != nil {
            if s?.range(of: "[/lng]") != nil {
                print("The String \(String(describing: s)) conatins [lng] tag")
                emojiIcon.isHidden = true
                locationIcon.isHidden = false
                labelImage.text = ""
                
                if (s == "[lng][/lng]") {
                    print("You haven`t inputed any text for latitude and longitude")
                } else {
                    let fullInput = s?.components(separatedBy: "[")
                    let firstPart = fullInput![0]
                    var secondPart = fullInput![1]
                    print("The first part of the location is: \(firstPart)")
                    print("The second part of the location is: \(secondPart)")
                    
                    let firstWordToRemove = "lng]"
                    if let range = secondPart.range(of: firstWordToRemove) {
                        secondPart.removeSubrange(range)
                    }
                    print("The text between the [lng] tags is: \(secondPart)")
                    
                    let fullLocationArray = secondPart.components(separatedBy: ";")
                    let latitude = fullLocationArray[0]
                    let longitude = fullLocationArray[1]
                    
                    labelLocationLatitude.text = latitude
                    labelLocationLongitude.text = longitude
                }
            } else {
                labelLocationLatitude.text = ""
                labelLocationLongitude.text = ""
                locationIcon.isHidden = true
            }
        } else {
            labelLocationLatitude.text = ""
            labelLocationLongitude.text = ""
            locationIcon.isHidden = true
        }
    }
}
