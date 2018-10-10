//
//  ViewController.swift
//  TestApplication
//
//  Created by Kalin Karev on 8/29/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: Properties
    @IBOutlet weak var onLabel: UILabel!
    @IBOutlet weak var offLabel: UILabel!
    @IBOutlet weak var firstSceneLabel: UILabel!
    @IBOutlet weak var secondSceneLabel: UILabel!
    @IBOutlet weak var segementControl: UISegmentedControl!
    @IBOutlet weak var sliderForValue: UISlider!
    @IBOutlet weak var numberSliderLabel: UILabel!

    // MARK: Actions
    @IBAction func chooseSwitch(_ sender: UISwitch) {
        if sender.isOn {
            onLabel.isHidden = false
            offLabel.isHidden = true
        } else {
            offLabel.isHidden = false
            onLabel.isHidden = true
        }
    }

    @IBAction func switchBetweenFirstAndSecond(_ sender: UISegmentedControl) {
        switch segementControl.selectedSegmentIndex {
        case 0:
            firstSceneLabel.isHidden = false
            secondSceneLabel.isHidden = true
        case 1:
            firstSceneLabel.isHidden = true
            secondSceneLabel.isHidden = false
        default:
            break
        }
    }

    @IBAction func sliderAction(_ sender: UISlider) {
        let currentValue = Int(sender.value)

        numberSliderLabel.text = "\(currentValue)"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        onLabel.text = "The switch is set to ON"
        offLabel.text = "The switch is set to OFF"

        onLabel.isHidden = true
        secondSceneLabel.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
