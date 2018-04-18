//
//  Note.swift
//  ProjectPassingDataFromOneViewToAnother
//
//  Created by Kalin Karev on 4/18/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import Foundation
import UIKit

struct Note {
    // MARK: Properties
    var name: String
    
    // MARK: Initialization
    init?(name: String) {
        // The name of the note must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        // Initialize stores properties
        self.name = name
    }
}
