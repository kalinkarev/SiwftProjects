//
//  ViewController.swift
//  ToastMessageInSwift
//
//  Created by Kalin Karev on 7/10/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        nameLabel.isUserInteractionEnabled = true
//        if (nameLabel.isUserInteractionEnabled) {
//            print("You have clicked the label")
//            toastView(message: "Lable pressed")
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Actions
    @IBAction func btnShowToast(_ sender: UIButton) {
        toastView(message: "Pressed button")
    }
    
    @IBAction func btnTest(_ sender: UIButton) {
        toastView(message: "You have pressed the testing button")
    }
    
    func toastView(message: String) {
        let toastLabel = UILabel(frame: CGRect(x: view.frame.size.width/2 - 150,
                                               y: view.frame.size.height-100,
                                               width: 300,
                                               height: 35))
        toastLabel.backgroundColor = UIColor.black
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = NSTextAlignment.center
        view.addSubview(toastLabel)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds = true
        UIView.animate(withDuration: 5.0, delay: 0.3, options: UIViewAnimationOptions.curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        })
    }
}
