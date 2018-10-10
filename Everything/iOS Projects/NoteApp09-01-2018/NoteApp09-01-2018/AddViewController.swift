//
//  AddViewController.swift
//  NoteApp09-01-2018
//
//  Created by Kalin Karev on 1/9/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var userInput: UITextField!

    @IBAction func btnCancelRequestNote(_ sender: UIButton) {
        _ = navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func btnSaveRequestNote(_ sender: UIButton) {
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
