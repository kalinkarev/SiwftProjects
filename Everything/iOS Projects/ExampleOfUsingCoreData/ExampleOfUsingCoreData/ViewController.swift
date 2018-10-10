//
//  ViewController.swift
//  ExampleOfUsingCoreData
//
//  Created by Kalin Karev on 2/6/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var usernameArray:[String] = []
    var passwordArray:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Storing core data
        
        // to access the methods from AppDelegate.swift
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        // enables us to work with core data
        // lets us to access the core data and interact with it
        let context = appDelegate.persistentContainer.viewContext
        
//        // Creating a new entity
//        let newUser1 = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
//
//        let newUser2 = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
//
//        let newUser3 = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
//
//        let newUser4 = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
//
//        // Create the new user
//        newUser1.setValue("Peter", forKey: "username")
//        newUser1.setValue("Peter123", forKey: "password")
//
//        newUser2.setValue("Svetlin", forKey: "username")
//        newUser2.setValue("Svetlin123", forKey: "password")
//
//        newUser3.setValue("Ivan", forKey: "username")
//        newUser3.setValue("Ivan123", forKey: "password")
//
//        newUser4.setValue("Filip", forKey: "username")
//        newUser4.setValue("Filip123", forKey: "password")
//
//        // Store the new user, which is created
//
//        do {
//            try context.save()
//            print("SAVED")
//        } catch {
//            // Process error
//        }

        
        // where is going ti search
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")

        // in order to see the String values you have entered
        request.returnsObjectsAsFaults = false

        do {
            // try to put all the results from the fetch request into the cariable results
            let results  = try context.fetch(request)

            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    if let username = result.value(forKey: "username") as? String {
                        //print(username)
                        usernameArray.append(username)
                    }

                    if let password = result.value(forKey: "password") as? String {
                        //print(password)
                        passwordArray.append(password)
                    }
                }

                print(usernameArray)
                print(passwordArray)
            }

        } catch {
            // Process error
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

