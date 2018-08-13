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
        print("The array is: \(games)")
    }

    func countGames() -> Int {
        return games.count
    }

    mutating func addGame(_ newGame: GolfGame) {
        if (games.isEmpty) {
            let newID = 0
            var localNewGame = newGame
            localNewGame.id = newID
            games.append(localNewGame)
            print("The new game has name: \(localNewGame.name) and id: \(localNewGame.id)")
        } else {
            let lastGame = games.last
            print("The last game is: \(String(describing: lastGame))")
            let lastID = lastGame?.id
            print("The last id: \(String(describing: lastID))")
            var localNewGame = newGame
            localNewGame.id = lastID! + 1
            games.append(localNewGame)
            print("The new game has name: \(localNewGame.name) and id: \(localNewGame.id) NOT EMPTY")
        }
        printGames()
    }

    mutating func deleteGame(_ deleteGame: GolfGame) {
        games.remove(at: deleteGame.id)

        printGames()
    }
}
