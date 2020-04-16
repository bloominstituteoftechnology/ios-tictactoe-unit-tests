//
//  Game.swift
//  TicTacToe
//
//  Created by Karen Rodriguez on 4/15/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    
    // Add game state as I feel like I'll need it at some point
    enum GameState {
        case active(GameBoard.Mark) // Active player
        case cat
        case won(GameBoard.Mark) // Winning player
    }
    
    private(set) var gameState: GameState = .active(.x)
    
    mutating internal func stateChange(to state: GameState) {
        gameState = state
    }
    

    private(set) var board: GameBoard
    
    internal var activePlayer: GameBoard.Mark? = .x
    internal var gameIsOver: Bool = false
    internal var winningPlayer: GameBoard.Mark?
    
    mutating internal func restart() {
        // Create brand new board (Got this from looking at GameVC)
        board = GameBoard()
        // Reset gameIsOver
        gameIsOver = false
        // Make x first move.
        activePlayer = .x
        // No longer need to reset active player as the didSet will take care of that
        // Reset winning player
        winningPlayer = nil
        
        // Reset state
        gameState = .active(activePlayer!)
    }
    
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        
        guard let player = activePlayer else {
            NSLog("Where is player?")
            throw NSError(domain: "Error unwrapping activePlayer", code: 0, userInfo: nil)
        }
        
        do {
            try board.place(mark: player, on: coordinate)
            if game(board: board, isWonBy: player) {
                gameIsOver = true
                winningPlayer = activePlayer
                activePlayer = nil
            } else if board.isFull {
                gameIsOver = true
                activePlayer = nil
                winningPlayer = nil
            } else {
                let newPlayer = activePlayer == .x ? GameBoard.Mark.o : GameBoard.Mark.x
                activePlayer = newPlayer
                gameState = .active(activePlayer!)
            }
        } catch {
            NSLog("Illegal move")
        }
    }
    
}
