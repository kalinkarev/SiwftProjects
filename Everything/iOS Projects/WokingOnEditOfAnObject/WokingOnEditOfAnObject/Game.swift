//
//  Game.swift
//  WokingOnEditOfAnObject
//
//  Created by Kalin Karev on 8/24/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import Foundation

struct Game {
    // MARK: Properties
    var id: Int
    var name: String
    
    // MARK: Initialization
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}
