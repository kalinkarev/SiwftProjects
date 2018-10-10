//
//  ManageObjects.swift
//  MakingApplicaionThatToChangeAPropertyOfObject
//
//  Created by Kalin Karev on 8/17/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import Foundation

struct ManageObjects {
    var objects: [Object] = []

    func printObjects() {
        print("The array of objects is: \(objects)")
    }

    func countObjects() -> Int {
        return objects.count
    }

    mutating func addObject(_ newObject: Object) {
        if objects.isEmpty {
            let newID = 0
            var localNewObject = newObject
            localNewObject.id = newID
            objects.append(localNewObject)
        } else {
            let lastObject = objects.last
            let lastID = lastObject?.id
            
            if let lastObjectID = lastID {
                var localNewObject = newObject
                localNewObject.id = lastObjectID + 1
                objects.append(localNewObject)
            }
        }
        printObjects()
    }

    mutating func deleteObject(_ deleteObject: Object) {
        objects.remove(at: deleteObject.id)

        printObjects()
    }

    mutating func editObject(_ editObject: Object) {
        objects = objects.map {
            var mutableObject = $0
            if $0.id == editObject.id {
                mutableObject.title = editObject.title
            }
            return mutableObject
        }
        printObjects()
    }
}
