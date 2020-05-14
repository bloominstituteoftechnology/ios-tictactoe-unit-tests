//
//  Game.swift
//  TicTacToe
//
//  Created by Bradley Diroff on 5/13/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct Games {
    
    enum GameState {
        case active(GameBoard.Mark) // Active player
        case cat
        case won(GameBoard.Mark) // Winning player
    }
    
    private(set) var board: GameBoard = GameBoard()

    internal var activePlayer: GameBoard.Mark? = .x
    internal var gameIsOver: Bool = false
    internal var winningPlayer: GameBoard.Mark? = nil
    
    var gameState = GameState.active(.x) {
        didSet {
            
        }
    }

    mutating internal func restart() {
        board = GameBoard()
        activePlayer = .x
        gameIsOver = false
        winningPlayer = nil
        gameState = .active(.x)
    }
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        
        guard let activePlayer = activePlayer else { return }
        try board.place(mark: activePlayer, on: coordinate)
        
        if game(board: board, isWonBy: activePlayer) {
            gameIsOver = true
            self.activePlayer = nil
            winningPlayer = activePlayer
        } else if board.isFull {
            gameIsOver = true
            self.activePlayer = nil
        } else {
            if self.activePlayer == .x {
                self.activePlayer = .o
            } else {
                self.activePlayer = .x
            }
        }
        
    }
}
