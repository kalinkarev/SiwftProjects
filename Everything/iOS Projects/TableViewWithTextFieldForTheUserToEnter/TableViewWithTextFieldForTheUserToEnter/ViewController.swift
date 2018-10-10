//
//  ViewController.swift
//  TableViewWithTextFieldForTheUserToEnter
//
//  Created by Kalin Karev on 8/20/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: Properties
    var numberHoles: Int = 0

    // MARK: Actions
    @IBAction func addGame(_ sender: UIBarButtonItem) {
        print("You have pressed the add button")

        showActionSheet()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addItem" {
            let navigationController = segue.destination as? UINavigationController
            let addItemViewController = navigationController?.topViewController as? SecondViewController

            if let viewController = addItemViewController {
                viewController.delegate = self

                viewController.numberOfHoles = numberHoles
            }
        }
    }

    func showActionSheet() {
        let alertController = UIAlertController(title: "Choose", message: nil, preferredStyle: .actionSheet)

        let nineButton = UIAlertAction(title: "Nine holes", style: .default, handler: {
            (action) -> Void in
            print("You have pressed the nine button")

            self.numberHoles = 9
            self.performSegue(withIdentifier: "addItem", sender: self)
        })
        let eighteenButton = UIAlertAction(title: "Eighteen holes", style: .default, handler: {
            (action) -> Void in
            print("You have pressed the eighteen button")

            self.numberHoles = 18
            self.performSegue(withIdentifier: "addItem", sender: self)
        })
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (action) -> Void in
            print("You have pressed the cancel button")
        })
        alertController.addAction(nineButton)
        alertController.addAction(eighteenButton)
        alertController.addAction(cancelButton)

        self.present(alertController, animated: true, completion: nil)
    }
}

extension ViewController: SecondViewControllerDelegate {
    func controllerDidCancel(_ controller: SecondViewController) {
        dismiss(animated: true, completion: nil)
    }
    func controllerDidSave(_ controller: SecondViewController) {
        dismiss(animated: true, completion: nil)
    }
}
