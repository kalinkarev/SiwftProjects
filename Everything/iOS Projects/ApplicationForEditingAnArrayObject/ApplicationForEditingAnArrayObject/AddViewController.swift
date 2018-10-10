//
//  AddViewController.swift
//  ApplicationForEditingAnArrayObject
//
//  Created by Kalin Karev on 8/24/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

protocol AddViewControllerDelegate: AnyObject {
    func controllerDidCancel(_ controller: AddViewController)
    func controllerDidSave(_ controller: AddViewController, didSave: [Game])
}

class AddViewController: UIViewController {

    // MARK: Properties
//    @IBOutlet weak var nameTextField: UITextField!
    
    weak var delegate: AddViewControllerDelegate?
    
    var selectedGame: Game?
    
    var mainScreen = ViewController()
    
    var arrayGames: [Game] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print("The array of games is: \(arrayGames)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        delegate?.controllerDidCancel(self)
    }

    @IBAction func saveButton(_ sender: UIBarButtonItem) {
//        var localNewGame: Game?
//
//        if mainScreen.games.isEmpty {
//            let newID = 0
//            localNewGame = Game(id: newID, name: nameTextField.text!)
//        } else {
//            let lastGame = mainScreen.games.last
//            let lastID = lastGame?.id
//
//            if let lastGameID = lastID {
//                localNewGame = Game(id: lastGameID + 1, name: nameTextField.text!)
//            }
//        }
//        arrayGames.append(localNewGame!)
//
//        delegate?.controllerDidSave(self, didSave: arrayGames)
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
