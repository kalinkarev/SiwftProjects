//
//  Note.swift
//  NoteTracker
//
//  Created by Kalin Karev on 1/12/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

//import Foundation
import UIKit

class Note {
    
    // MARK: Properties
    var name: String
    
    // MARK: Initialization
    init?(name: String) {
        
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        // Initialize stored properties
        self.name = name
    }
    
}
