//
//  Game.swift
//  TicTacToe
//
//  Created by scott harris on 3/18/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

enum GameState {
    case active(GameBoard.Mark) // Active player
    case cat
    case won(GameBoard.Mark) // Winning player
}

struct Game {
    
    
    private(set) var board: GameBoard
    
    private(set) var gameState = GameState.active(.x)
    
    internal var activePlayer: GameBoard.Mark?
    internal var gameIsOver: Bool
    internal var winningPlayer: GameBoard.Mark?
    
    init() {
        self.board = GameBoard()
        activePlayer = .x
        gameState = .active(.x)
        gameIsOver = false
    }
    
    
    mutating internal func restart() {
        board = GameBoard()
        gameState = .active(.x)
    }
    
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        do {
            if let activePlayer = activePlayer {
                try board.place(mark: activePlayer, on: coordinate)
                if game(board: board, isWonBy: activePlayer) {
                    gameState = .won(activePlayer)
                    gameIsOver = true
                } else if board.isFull {
                    gameState = .cat
                    gameIsOver = true
                } else {
                    let newPlayer = activePlayer == .x ? GameBoard.Mark.o : GameBoard.Mark.x
                    self.activePlayer = newPlayer
                    gameState = .active(newPlayer)
                }
            }
            
        } catch {
            NSLog("Illegal move")
        }
    }
}
