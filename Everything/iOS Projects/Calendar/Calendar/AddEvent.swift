//
//  AddEvent.swift
//  Calendar
//
//  Created by Kalin Karev on 1/4/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import Foundation
import UIKit

class AddEvent: UIViewController {
    
    @IBAction func btnDoneAction(_ sender: UIBarButtonItem) {
        
            dismiss(animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
