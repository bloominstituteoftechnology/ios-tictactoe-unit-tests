//
//  Game.swift
//  TicTacToe
//
//  Created by Thomas Cacciatore on 6/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    
    private enum GameState {
        case active(GameBoard.Mark) // Active player
        case cat
        case won(GameBoard.Mark) // Winning player
    }
    
    
    mutating func restart() {
        board = GameBoard()
        gameState = .active(.x)
    }
    
    mutating func makeMark(at coordinate: Coordinate) throws {
        guard case let GameState.active(player) = gameState else {
            NSLog("Game is over")
            return
        }
        
        do {
            try board.place(mark: player, on: coordinate)
            if game(board: board, isWonBy: player) {
                gameState = .won(player)
            } else if board.isFull {
                gameState = .cat
            } else {
                let newPlayer = player == .x ? GameBoard.Mark.o : GameBoard.Mark.x
                gameState = .active(newPlayer)
            }
        } catch {
            NSLog("Illegal move")
        }
    }
    
    private(set) var board: GameBoard
    
    var activePlayer: GameBoard.Mark?
    var gameIsOver: Bool
    var winningPlayer: GameBoard.Mark?
    private var gameState = GameState.active(.x) //{
//        didSet {
//            switch GameState.self {
//
//            case won:
//            winningPlayer = .x
//            gameIsOver = true
//            activePlayer = nil
//
//            case active:
//            activePlayer = .x
//            gameIsOver = false
//            winningPlayer = nil
//
//            case cat:
//            activePlayer = nil
//            gameIsOver = true
//            winningPlayer = nil
//            }
//    }
//    }
}
