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
        
//        pressedButton()
        imagePressed()
        locationPressed()
    }
    
    func imagePressed() {
        var s = inputTextField.text
        print("The String is \(String(describing: s))")
        
        if s?.range(of: "[img]") != nil {
            if s?.range(of: "[/img]") != nil {
                print("The string \(String(describing: s)) contains [img] tag")
                emojiIcon.isHidden = false
                locationIcon.isHidden = true
                
                let firstWordToRemove = "[img]"
                if let range = s?.range(of: firstWordToRemove) {
                    s?.removeSubrange(range)
                }
                let lastWordToRemove = "[/img]"
                if let range = s?.range(of: lastWordToRemove) {
                    s?.removeSubrange(range)
                }
                labelImage.text = s
            } else {
                labelImage.text = ""
                emojiIcon.isHidden = true
            }
        }
    }
    
    func pressedButton() {
        var s = inputTextField.text
        print("The String is: \(String(describing: s))")
        
        if s?.range(of: "[img]") != nil {
            if s?.range(of: "[/img]") != nil {
                print("The string \(String(describing: s)) contains [img] tag")
                emojiIcon.isHidden = false
                locationIcon.isHidden = true
                
                let firstWordToRemove = "[img]"
                if let range = s?.range(of: firstWordToRemove) {
                    s?.removeSubrange(range)
                }
                let lastWordToRemove = "[/img]"
                if let range = s?.range(of: lastWordToRemove) {
                    s?.removeSubrange(range)
                }
                
                labelImage.text = s
            }
        }
        
        if s?.range(of: "[lng]") != nil {
            if s?.range(of: "[/lng]") != nil {
                print("The string \(String(describing: s)) contains [lng] tag")
                emojiIcon.isHidden = true
                locationIcon.isHidden = false
                let fullLocationArr = s?.components(separatedBy: ";")
                var latitude = fullLocationArr![0]
                var longitude = fullLocationArr![1]
                
                let firstWordToRemove = "[lng]"
                if let range = latitude.range(of: firstWordToRemove) {
                    latitude.removeSubrange(range)
                }
                
                let lastWordToRemove = "[/lng]"
                if let range = longitude.range(of: lastWordToRemove) {
                    longitude.removeSubrange(range)
                }
                
                labelLocationLatitude.text = latitude
                labelLocationLongitude.text = longitude
            }
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
                
                if (s == "[lng][/lng]") {
                    print("You haven`t inputed any text for latitude and longitude")
                } else {
                    let fullLocationArr = s?.components(separatedBy: ";")
                    var latitude = fullLocationArr![0]
                    var longitude = fullLocationArr![1]
                
                    let firstWordToRemove = "[lng]"
                    if let range = latitude.range(of: firstWordToRemove) {
                        latitude.removeSubrange(range)
                    }
                
                    let lastWordToRemove = "[/lng]"
                    if let range = longitude.range(of: lastWordToRemove) {
                        longitude.removeSubrange(range)
                    }
                
                    labelLocationLatitude.text = latitude
                    labelLocationLongitude.text = longitude
                }
            } else {
                labelLocationLatitude.text = ""
                labelLocationLongitude.text = ""
                locationIcon.isHidden = true
            }
        }
    }
    
}



