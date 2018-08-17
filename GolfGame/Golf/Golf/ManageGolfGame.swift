//
//  ManageGolfGame.swift
//  Golf
//
//  Created by Kalin Karev on 8/6/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import Foundation

struct ManageGolfGame {
    var games: [GolfGame] = []
    
    func printGames() {
        print("The array of games is: \(games)")
    }
    
    func countGames() -> Int {
        return games.count
    }
    
    mutating func addGame(_ newGame: GolfGame) {
        if games.isEmpty {
            let newID = 0
            var localNewGame = newGame
            localNewGame.id = newID
            games.append(localNewGame)
        } else {
            let lastGame = games.last
            let lastID = lastGame?.id
            
            if let lastGameID = lastID {
                var localNewGame = newGame
                localNewGame.id = lastGameID + 1
                games.append(localNewGame)
            }
        }
        printGames()
    }

    mutating func deleteGame(_ deleteGame: GolfGame) {
        games.remove(at: deleteGame.id)

        printGames()
    }
}
