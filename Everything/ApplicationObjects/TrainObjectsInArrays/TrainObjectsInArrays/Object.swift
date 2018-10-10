//
//  Object.swift
//  TrainObjectsInArrays
//
//  Created by Kalin Karev on 7/4/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import Foundation
import UIKit

struct Object {
    // MARK: Properties
    var id: Int
    var name: String
    
    // MARK: Initializer
    init?(id: Int, name: String) {
        // Initialization should fail if there is no name
        if name.isEmpty {
            return nil
        }
        
        // Initialize stored properties
        self.id = id
        self.name = name
    }
    
}
