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
        // Initialize stores properties
        self.name = name
        
        // Initialization should fail if there is no name
        if name.isEmpty {
            return nil
        }
    }
}
