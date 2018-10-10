//
//  Game.swift
//  GolfGame
//
//  Created by Kalin Karev on 8/22/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import Foundation

struct Game {
    var name: String
    var pointsScored: Int
    var dictionaryHolePoints: [Int : Int] = [:]

    init?(name: String, pointsScored: Int, dictHolePoints: [Int : Int]) {
        guard !name.isEmpty else {
            return nil
        }

        self.name = name
        self.pointsScored = pointsScored
        self.dictionaryHolePoints = dictHolePoints
    }
}
