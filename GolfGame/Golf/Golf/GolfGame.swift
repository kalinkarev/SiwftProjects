//
//  GolfGame.swift
//  Golf
//
//  Created by Kalin Karev on 8/2/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import Foundation

struct GolfGame {
    // MARK: Properties
    var id: Int
    var name: String
    var pointsScored: Int
    var dictHolePoints: [Int : Int] = [:]

    // MARK: Initialization
    init?(id: Int, name: String, pointsScored: Int, dictHolePoints: [Int : Int]) {
        //Initialization should fail if there is no name input(if the name field is empty)(there should be an error)
        if name.isEmpty {
            return nil
        }

        // Initialize stored properties.
        self.id = id
        self.name = name
        self.pointsScored = pointsScored
        self.dictHolePoints = dictHolePoints
    }
}
