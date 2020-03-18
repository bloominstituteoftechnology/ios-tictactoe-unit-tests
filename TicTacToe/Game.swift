//
//  Game.swift
//  TicTacToe
//
//  Created by Chris Gonzales on 3/18/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    
    private(set) var board: GameBoard

    internal var activePlayer: GameBoard.Mark?
    internal var gameIsOver: Bool
    internal var winningPlayer: GameBoard.Mark?
    internal var gameState = GameState.active(.x)
    
    internal enum GameState {
        case active(GameBoard.Mark) // Active player
        case cat
        case won(GameBoard.Mark) // Winning player
    }
    
    mutating internal func restart() {
      
               board = GameBoard()
               gameState = .active(.x)
        
        
           
    }
    
//    guard case let GameState.active(player) = gameState else {
//        NSLog("Game is over")
//        return
//    }
//
//    do {
//        try board.place(mark: player, on: coordinate)
//        if game(board: board, isWonBy: player) {
//            gameState = .won(player)
//        } else if board.isFull {
//            gameState = .cat
//        } else {
//            let newPlayer = player == .x ? GameBoard.Mark.o : GameBoard.Mark.x
//            gameState = .active(newPlayer)
//        }
//    } catch {
//        NSLog("Illegal move")
//    }
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        
    }

    
}
