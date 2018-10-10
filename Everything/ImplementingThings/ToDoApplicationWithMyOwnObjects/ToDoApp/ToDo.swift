//
//  ToDo.swift
//  ToDoApp
//
//  Created by Kalin Karev on 8/3/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import Foundation

class ToDo: Task {
    
    var done: Bool
    
    required init?(coder aDecoder: NSCoder) {
        self.done = aDecoder.decodeBool(forKey: "done")
        super.init(coder: aDecoder)
    }
    
    override func encode(with aCoder: NSCoder) {
        aCoder.encode(done, forKey: "done")
        super.encode(with: aCoder)
    }
    
    init(name: String, done: Bool) {
        self.done = done
        super.init(name: name)
    }
    
}
