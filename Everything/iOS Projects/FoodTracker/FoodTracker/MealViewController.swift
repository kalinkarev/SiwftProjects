//
//  MealViewController.swift
//  FoodTracker
//
//  Created by Kalin Karev on 1/10/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit
import os.log

class MealViewController: UIViewController, UITextFieldDelegate {

    // MARK: Properties
    // section of the code that lists properties.
    @IBOutlet weak var nameTextField: UITextField!
    
    //@IBOutlet weak var mealNameLabel: UILabel!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    /*
     This value is passed by 'MealTableViewController' in 'prepare(for:sender:)' or constructed as part of adding a new meal.
     */
    
    var meal: Meal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field's user input through delegate callbacks.
        nameTextField.delegate = self
        
        // Set up views if editing an existing Meal.
        if let meal = meal {
            navigationItem.title = meal.name
            nameTextField.text = meal.name
        }
        
        // Enable the Save button only if the text field has a valid Meal name.
        updateSaveButtonState()
    }
    // When a ViewController instance is loaded, it sets ifself as the delegate of its nameTextField property
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // resign the text field's first-responder status
        // Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Disable the Save button while editing.
        saveButton.isEnabled = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // gives you a chance to read the information entered into the text field and do something with it
        //mealNameLabel.text = textField.text
        updateSaveButtonState()
        navigationItem.title = textField.text
    }
    
    // MARK: Navigation
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        // Depending on style of presentation (modal or puch presentation), this view controller needs to be dismissed in two different ways.
        let isPresentingInAddMealMode = presentingViewController is UINavigationController
        
        if (isPresentingInAddMealMode) {
            dismiss(animated: true, completion: nil)
        } else if let owningNavigationController = navigationController {
            owningNavigationController.popViewController(animated: true)
        } else {
            fatalError("The MealViewController is not inside anavigation controller.")
        }
    }
    
    // This method lets you configure aview controller before it's presented.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        // Configure the destination view controller only when the save button is pressed.
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        let name = nameTextField.text ?? ""
        
        // Set the meal to be passed to MealTableViewController after the unwind segue.
        meal = Meal(name: name)
    }
    
//    // MARK: Actions
//    @IBAction func setDefaultLabelText(_ sender: UIButton) {
//        mealNameLabel.text = "Default Text" // sets the label's text property to Default Text
//        /* Target-action is a design pattern where one object sends a message to another object when a specific event occurs */
//    }

    // Delegate is an object that acts on behalf of, or in coordination with, another object.
    
    // MARK: Private Methods
    private func updateSaveButtonState() {
        // Disable the Save button if the text fieldis empty.
        let text = nameTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
    
}
