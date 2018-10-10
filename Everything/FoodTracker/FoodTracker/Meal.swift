//
//  Meal.swift
//  FoodTracker
//
//  Created by Kalin Karev on 1/10/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

//import Foundation

import UIKit

class Meal {
    // MARK: Properties
    
    var name: String
    
    // MARK: Initialization
    
    init?(name: String) {
        
        // Initialization should fail if there is no name
        
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        // Initiailize stored properties.
        self.name = name
    }
}
