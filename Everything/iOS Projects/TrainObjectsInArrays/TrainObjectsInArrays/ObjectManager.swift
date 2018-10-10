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
    
    
}
