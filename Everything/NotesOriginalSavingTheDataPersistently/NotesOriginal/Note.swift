//
//  Note.swift
//  NotesOriginal
//
//  Created by Kalin Karev on 2/3/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

//import Foundation
import UIKit
import os.log

class Note: NSObject, NSCoding {
    
    // MARK: Properties
    
    var name: String
    
    
    // MARK: Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("notes")
    // static keyword -> the constants belongs to the class instead of an instance of the class
    
    
    // MARK: Initialization
    // Initializer is a method that prepares an instance of a class for use (setting an initial value for each property and performing any other setup or initialization)
    
    init?(name: String) {
        
//        // Initialization should fail if there is no name
//        if (name.isEmpty) {
//            return nil
//        }

        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        // guard -> declares a condition that must be true in order for the code after the guard statement to be executed.
        
        // Initialize stored properties.
            self.name = name
    }
    
    // Now the initializer returns an optional Note? object
    
    
    // MARK: Types
    struct PropertyKey {
        static let name = "name"
        // the static keyword indicates that this constant belong to the structure itself, not to instances of the structure. To access them: PropertyKey.name
    }
    
    
    // MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        // pass a String argument. Encode the value of each property on the Note class and store it with it's corresponding key.
    }
    // prepare the class's information to be archived
    
    required convenience init?(coder aDecoder: NSCoder) {
        // The name is required. If we cannot decode a name string, the initializer should fail.
        guard let name = aDecoder.decodeObject(forKey:PropertyKey.name) as? String else {
            os_log("Unable to decode the name for a Note object", log: OSLog.default, type: .debug)
            return nil
        }
        
        // Must call designated initializer.
        self.init(name: name)
    }
    // unarchives the data when the class is created
    // required modifier means this initializer must be implemented on every subclass, if the subclass defines its own initializers.
    // convinience modifier means that this is a secondary initializer, and that it must call a designated initializer from the same class.
    
}
