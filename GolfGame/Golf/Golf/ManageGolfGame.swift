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

    mutating func loadGames() {
        guard let game1 = GolfGame(id: 0, name: "Game1", pointsScored: 45, dictHolePoints: [1:1, 2:2, 3:3, 4:4, 5:5, 6:6, 7:7, 8:8, 9:9]) else {
            fatalError("Unable to instantiate game1")
        }
        guard let game2 = GolfGame(id: 1, name: "Game2", pointsScored: 33, dictHolePoints: [1:11, 2: 14, 3: 13]) else {
            fatalError("Unable to instantiate game2")
        }

        games += [game1, game2]
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

//    mutating func editGame(_ selectedGame: GolfGame) {
//        printGames()
//
//        print("The selected game`s id is: \(selectedGame.id)")
//        print("The selected game`s name is: \(selectedGame.name)")
//
//        games.remove(at: selectedGame.id)
//        printGames()
//
//        let newGame = selectedGame
//        games.insert(newGame, at: selectedGame.id)
//        printGames()
//    }
    
    mutating func editGame(_ selectedGame: GolfGame) {
        games = games.map {
            var mutableGame = $0
            
            if $0.id == selectedGame.id {
                mutableGame.name = selectedGame.name
                mutableGame.pointsScored = selectedGame.pointsScored
                mutableGame.dictHolePoints = selectedGame.dictHolePoints
            }
            
            return mutableGame
        }
    }
    
}
