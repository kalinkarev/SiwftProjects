//
//  Note.swift
//  NotesOriginal
//
//  Created by Kalin Karev on 2/3/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

//import Foundation
import UIKit

class Note {
    
    // MARK: Properties
    
    var name: String
    
    
    // MARK: Initialization
    // Initializer is a method that prepares an instance of a class for use (setting an initial value for each property and performing any other setup or initialization)
    
    init?(name: String) {
        
        // Initialization should fail if there is no name
        if (name.isEmpty) {
            return nil
        }
        
        // Initialize stored properties.
            self.name = name
    }
    
    // Now the initializer returns an optional Note? object
}
