//
//  Note.swift
//  NoteApp09-01-2018
//
//  Created by Kalin Karev on 1/9/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

//import Foundation
import UIKit

class Note {
    
    var name: String
    
    init?(name: String) {
        // Initializer should fail if there is no name inputed
        if (name.isEmpty) {
            return nil
        }
        
        // Initalize store property.
        self.name = name
    }
    
    // 
    
}
