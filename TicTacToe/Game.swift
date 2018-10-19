//
//  Game.swift
//  TicTacToe
//
//  Created by Madison Waters on 10/17/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit
struct Game {
    
    private enum GameState {
        case active(GameBoard.Mark) // Active player
        case cat
        case won(GameBoard.Mark) // Winning player
    }
    
    mutating internal func restart() {
        board = GameBoard()
        gameState = .active(.x)
    }
    
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        guard case let GameState.active(player) = gameState else {
            gameIsOver = true
            NSLog("Game is over")
            return
        }
        
        do {
            try board.place(mark: player, on: coordinate)
            if currentGame(board: board, isWonBy: player) {
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
    private(set) var activePlayer: GameBoard.Mark?
    
    internal var gameIsOver: Bool
    internal var winningPlayer: GameBoard.Mark?
    
    private var gameState = GameState.active(.x)
    var gameViewController = GameViewController() {
        didSet {
            
        }
    }
}
