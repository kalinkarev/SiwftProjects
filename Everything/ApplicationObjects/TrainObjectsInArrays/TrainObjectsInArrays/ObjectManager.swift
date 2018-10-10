//
//  ObjectManager.swift
//  TrainObjectsInArrays
//
//  Created by Kalin Karev on 7/4/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import Foundation
import UIKit

struct ObjectManager {
    // MARK: Properties
    var objects: [Object] = []
    
    // MARK: Private Methods
    mutating func loadSampleObjects() {
        guard let object1 = Object(id: 0, name: "sleep") else {
            fatalError("Unable to instantiate object")
        }
        guard let object2 = Object(id: 1, name: "train") else {
            fatalError("Unable to instantiate object")
        }
        guard let object3 = Object(id: 2, name: "go to") else {
            fatalError("Unable to instantiate object")
        }
        objects += [object1, object2, object3]
        print("The array is: \(objects)")
    }
 
    func objectNumber() -> Int {
        return objects.count
    }
    
    mutating func addObject(_ newObject: Object) {
        // adding the new object into the array of objects
        if (objects.isEmpty) {
            let newID = 0
            var localNewObject = newObject
            localNewObject.id = newID
            objects += [localNewObject]
            print("The new object has name: \(localNewObject.name) and id: \(localNewObject.id)")
        } else {
            let lastObject = objects.last
            let lastID = lastObject?.id
            var localNewObject = newObject
            localNewObject.id = lastID! + 1
            objects += [localNewObject]
            print("The new note has name: \(localNewObject.name) nad id: \(localNewObject.id)")
        }
        print("The new array AFTER ADDITION is: \(objects)")
    }
 
    mutating func deleteObject(_ deleteObject: Object) {
        // removing the selected object
        objects.remove(at: deleteObject.id)
        print("The new array AFTER DELETING is: \(objects)")
    }
    
    
    
}
