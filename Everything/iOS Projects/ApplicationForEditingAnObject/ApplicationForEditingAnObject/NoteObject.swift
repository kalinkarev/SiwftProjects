//
//  NoteObject.swift
//  ApplicationForEditingAnObject
//
//  Created by Kalin Karev on 5/16/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import Foundation

struct NoteObject {
    var id: Int
    var title: String
    
    // Initializer for the note object
    init?(id: Int, title: String) {
        // Making the initializer to be failable
        if (title.isEmpty) {
            return nil
        }
        self.id = id
        self.title = title
    }
}
