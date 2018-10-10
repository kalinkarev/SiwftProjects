//
//  SecondViewController.swift
//  WokingOnEditOfAnObject
//
//  Created by Kalin Karev on 8/24/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var selectedGame: Game?
    var arrayOfGames: [Game] = []
    
    // MARK: Properties
    @IBOutlet weak var inputTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let game = selectedGame {
            let idOfSelectedGame = game.id
            print("The id of the selected game is: \(idOfSelectedGame)")
            
            let nameOfSelectedGame = game.name
            print("THe name of the selected game is: \(nameOfSelectedGame)")
            
            inputTextField.text = nameOfSelectedGame
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        
        let isPresentingInAddGameMode = presentingViewController is UINavigationController
        
        if isPresentingInAddGameMode {
            dismiss(animated: true, completion: nil)
        } else if let owningNavigationController = navigationController {
            owningNavigationController.popViewController(animated: true)
        } else {
            fatalError("The SecondViewController is not inside navigation controller.")
        }
    }

    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        let isPresentingInAddGameMode = presentingViewController is UINavigationController
        if isPresentingInAddGameMode {
            dismiss(animated: true, completion: nil)
        } else if let owningNavigationController = navigationController {
            let idOfGameForEdit = selectedGame?.id
            print("The id of the selected game is: \(String(describing: idOfGameForEdit))")

            let nameOfGameForEdit = selectedGame?.name
            print("The name of the selected game is: \(String(describing: nameOfGameForEdit))")

            let userInput = inputTextField.text
            print("The new name of the edited game is: \(String(describing: userInput))")

            print("The array is: \(arrayOfGames)")

            arrayOfGames.forEach { game in
                print("\(game.id) - \(game.name)")
            }

            arrayOfGames = arrayOfGames.map {
                var mutableGame = $0

                if $0.id == idOfGameForEdit {
                    mutableGame.name = userInput!
                }
                return mutableGame
            }

            arrayOfGames.forEach { game in
                print("\(game.id) - \(game.name)")
            }

            print("You have pressed the SAVE button on edit screen")
            owningNavigationController.popViewController(animated: true)
        } else {
            fatalError("The SecondViewController is not inside navigation controller")
        }
    }
}
