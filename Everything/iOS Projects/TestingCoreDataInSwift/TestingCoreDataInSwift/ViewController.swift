//
//  ViewController.swift
//  TestingCoreDataInSwift
//
//  Created by Kalin Karev on 5/18/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let userEntity = NSEntityDescription.entity(forEntityName: "User", in: managedContext)!
        
        let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
        
        user.setValue("John", forKeyPath: "name")
        user.setPrimitiveValue("john@test.com", forKey: "email")
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let date = formatter.date(from: "1990/10/08")
        user.setValue(date, forKey: "date_of_birth")
        
        user.setValue(0, forKey: "number_of_children")
        
        let user2 = NSManagedObject(entity: userEntity, insertInto: managedContext)

        user2.setValue("Girl", forKeyPath: "name")
        user2.setPrimitiveValue("v@gmail.com", forKey: "email")
        let date2 = formatter.date(from: "2001/10/10")
        user2.setValue(date2, forKeyPath: "date_of_birth")
        user2.setValue(0, forKey: "number_of_children")
        
        let user3 = NSManagedObject(entity: userEntity, insertInto: managedContext)
        user3.setValue("friend", forKeyPath: "name")
        user3.setPrimitiveValue("freind@abv.bg", forKey: "email")
        let date3 = formatter.date(from: "2005/03/21")
        user3.setValue(date3, forKey: "date_of_birth")
        user3.setValue(0, forKey: "number_of_children")
        
        // <--------------------- Creating car entities for different users --------------------->
        let carEntity = NSEntityDescription.entity(forEntityName: "Car", in: managedContext)!
        let car1 = NSManagedObject(entity: carEntity, insertInto: managedContext)
        car1.setValue("Audi TT", forKey: "model")
        car1.setValue(2010, forKey: "year")
        car1.setValue(user, forKey: "user")
        
        let car2 = NSManagedObject(entity: carEntity, insertInto: managedContext)
        car2.setValue("BMW X6", forKey: "model")
        car2.setValue(2014, forKey: "year")
        car2.setValue(user, forKey: "user")
        
        let carUser2 = NSManagedObject(entity: carEntity, insertInto: managedContext)
        carUser2.setValue("BMW 740Li", forKey: "model")
        carUser2.setValue(2015, forKey: "year")
        carUser2.setValue(user2, forKeyPath: "user")
        
        let carUser3 = NSManagedObject(entity: carEntity, insertInto: managedContext)
        carUser3.setValue("Toyota RAV4", forKey: "model")
        carUser3.setValue(2003, forKey: "year")
        carUser3.setValue(user3, forKeyPath: "user")
        
        let carUser31 = NSManagedObject(entity: carEntity, insertInto: managedContext)
        carUser31.setValue("BMW 523i", forKey: "model")
        carUser31.setValue(2008, forKey: "year")
        carUser31.setValue(user3, forKeyPath: "user")
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
        // Reading the data
        let userFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        userFetch.fetchLimit = 1
        userFetch.predicate = NSPredicate(format: "name = %@", "John")
        
        let userFetch2 = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        userFetch2.predicate = NSPredicate(format: "name = %@", "Girl")
        
        let userFetch3 = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        userFetch3.predicate = NSPredicate(format: "name = %@", "Friend")
        
        // sort by an email address with ascending order:
        userFetch.sortDescriptors = [NSSortDescriptor.init(key: "email", ascending: true)]
        userFetch2.sortDescriptors = [NSSortDescriptor.init(key: "email", ascending: true)]
        userFetch3.sortDescriptors = [NSSortDescriptor.init(key: "email", ascending: true)]
        
        // executing the query
        let users = try! managedContext.fetch(userFetch)
        let users2 = try! managedContext.fetch(userFetch2)
//        let users3 = try! managedContext.fetch(userFetch3)
        
        // pucking up the first result and printing how many cars he has
        let john: User = users.first as! User
        print("Email: \(john.email!)")
        let johnCars = john.cars?.allObjects as! [Car]
        print("has \(johnCars.count) cars")
        
        let girl: User = users2.last as! User
        print("Email: \(girl.email!)")
        let girlCars = girl.cars?.allObjects as! [Car]
        print("has \(girlCars.count) cars")
        
//        let friend: User = users3.first as! User
//        print("Email: \(friend.email!)")
//        let friendCars = friend.cars?.allObjects as! [Car]
//        print("has \(friendCars.count) cars")
//
//        let friend: User = users3.first as! User
//        print("Email: \(friend.email!)")
//        let friendCars = friend.cars?.allObjects as! [Car]
//        print("has \(friendCars.count) cars")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
