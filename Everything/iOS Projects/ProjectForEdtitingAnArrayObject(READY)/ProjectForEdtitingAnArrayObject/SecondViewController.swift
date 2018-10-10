//
//  SecondViewController.swift
//  ProjectForEdtitingAnArrayObject
//
//  Created by Kalin Karev on 8/27/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

protocol SecondViewControllerDelegate: AnyObject {
    func controllerDidEdit(_ controller: SecondViewController, didEdit: Car)
    func controllerDidCancel(_ controller: SecondViewController)
}

class SecondViewController: UIViewController {

    @IBOutlet weak var userInputTextField: UITextField!
    
    weak var delegate: SecondViewControllerDelegate?
    
    var selectedCar: Car?
    
    var manageCars = WorkWithCars()
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        delegate?.controllerDidCancel(self)
    }
    
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        let selectedCarForEditID = selectedCar?.id
        print("The selected car item has id: \(String(describing: selectedCarForEditID))")
        let selectedCarForEditName = selectedCar?.title
        print("The selected car item has title: \(String(describing: selectedCarForEditName))")

        let editedCar = Car(id: selectedCarForEditID!, title: userInputTextField.text!)
        print("The edited car has id: \(editedCar.id) and name: \(editedCar.title)")

        delegate?.controllerDidEdit(self, didEdit: editedCar)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        userInputTextField.text = selectedCar?.title
        
//        manageCars.loadCars()
        
        manageCars.showArray()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
