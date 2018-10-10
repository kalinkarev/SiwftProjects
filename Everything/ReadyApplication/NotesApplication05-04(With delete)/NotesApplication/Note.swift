//
//  Note.swift
//  NotesApplication
//
//  Created by Kalin Karev on 3/6/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import Foundation
import UIKit

struct Note {
    // MARK: Properties
    var id: Int
    var name: String
    
    // MARK: Initialization
    init?(id: Int, name: String) {
        
        // Initialization should fail if there is no name input (if the name field is empty) || (There should be an error)
        if name.isEmpty {
            return nil
        }
        
        // Initialize stored properties.
        self.id = id
        self.name = name
    }
}
