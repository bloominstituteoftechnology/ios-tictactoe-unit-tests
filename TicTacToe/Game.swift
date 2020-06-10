//
//  Game.swift
//  TicTacToe
//
//  Created by Nonye on 6/10/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

enum GameError: Error, Equatable {
    case noActivePlayer
}

struct Game {
    
    private(set) var board: GameBoard
    
    internal var activePlayer: GameBoard.Mark?
    internal var gameIsOver: Bool
    internal var winningPlayer: GameBoard.Mark?
    
    mutating internal func restart() {
        board = GameBoard()
        
        activePlayer = .x
        gameIsOver = false
        winningPlayer = nil
        
    }
    
    
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        guard let activePlayer = activePlayer else {
            throw(GameError.noActivePlayer)
        }
        
        try board.place(mark: activePlayer, on: coordinate)
        try checkGameOver()
        if gameIsOver {
            self.activePlayer = nil
        } else if activePlayer == .x {
            self.activePlayer = .o
        } else {
            self.activePlayer = .x
        }
        
    }
    mutating func checkGameOver() throws {
        guard let activePlayer = activePlayer else {
            throw(GameError.noActivePlayer)
        }
        if game(board: board, isWonBy: activePlayer) {
            winningPlayer = activePlayer
            gameIsOver = true
        } else if board.isFull {
            gameIsOver = true
        }
    }
}
