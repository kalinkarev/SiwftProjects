//
//  Task.swift
//  ToDoApp
//
//  Created by Kalin Karev on 8/3/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import Foundation

class Task: NSObject, NSCoding {

    var name: String
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "name") as! String
    }
    
    convenience override init() {
        self.init(name: "New Task")
    }
    
    init(name: String) {
        self.name = name
    }
}
