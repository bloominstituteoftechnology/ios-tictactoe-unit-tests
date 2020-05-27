//
//  Game.swift
//  TicTacToe
//
//  Created by Claudia Contreras on 5/26/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    private(set) var board: GameBoard = GameBoard()
    
    var activePlayer: GameBoard.Mark? = .x
    var gameIsOver: Bool = false
    var winningPlayer: GameBoard.Mark? = nil
    
    enum GameState {
        case active(GameBoard.Mark) // Active player
        case cat
        case won(GameBoard.Mark) // Winning player
    }
    
    var state: GameState {
        if let winningPlayer = winningPlayer {
            return .won(winningPlayer)
        } else if gameIsOver {
            return .cat
        } else {
            return .active(activePlayer!)
        }
    }
    
    // MARK: Functions
    mutating func restart() {
        // Restarts the game to a fresh state with an empty board, and player X starting.
        board = GameBoard()
        activePlayer = .x
        gameIsOver = false
        winningPlayer = nil
        
    }
    
    mutating func makeMark(at coordinate: Coordinate) throws {
        // adds a mark for the currently active player at the given coordinate. Updates game state.
        guard let activePlayer = activePlayer else { return }
        
        try board.place(mark: activePlayer, on: coordinate)
        
        if game(board: board, isWonBy: activePlayer) {
            gameIsOver = true
            winningPlayer = activePlayer
        } else if board.isFull {
            gameIsOver = true
            winningPlayer = nil
        } else {
            // Switch the player
            if activePlayer == .x {
                self.activePlayer = .o
            } else {
                self.activePlayer = .x
            }
        }
        
    }
    
}
