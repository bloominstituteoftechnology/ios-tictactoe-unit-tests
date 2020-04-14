//
//  Game.swift
//  TicTacToe
//
//  Created by David Wright on 4/14/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    
    // MARK: - Public API
    // (Public API signature determined in README file)
    
    // Externally read-only property for the game board.
    // Game itself modifies this as the game progresses.
    private(set) var board: GameBoard = GameBoard()

    // The currently active player, either .x or .o.
    // nil if the game is over.
    internal var activePlayer: GameBoard.Mark? = .x
    
    // true if the game is over (either won or a cat's game)
    // false if the game is still running.
    internal var gameIsOver: Bool = false
    
    // The player that won the game, either .x or .o.
    // nil if the game is still running, or it's a cat's game (no one won).
    internal var winningPlayer: GameBoard.Mark?
    
    // Restarts the game to a fresh state with an empty board, and player X starting.
    mutating internal func restart() {
        board = GameBoard()
        gameState = .active(.x)
    }
    
    // Adds a mark for the currently active player at the given coordinate.
    // Updates game state.
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        guard case let GameState.active(player) = gameState else {
            NSLog("Game is over")
            return
        }
        
        try board.place(mark: player, on: coordinate)
        if game(board: board, isWonBy: player) {
            // 'player' won the game
            gameState = .won(player)
        } else if board.isFull {
            // The game ends in a tie
            gameState = .cat
        } else {
            // 'player's turn is over; it is the opposing player's turn
            let newPlayer = player == .x ? GameBoard.Mark.o : GameBoard.Mark.x
            gameState = .active(newPlayer)
        }
    }
    
    // MARK: - Private API
    // Add private helper properties and methods below as needed
    
    private var gameState = GameState.active(.x) {
        didSet {
            switch gameState {
            case let .active(player):
                activePlayer = player
                gameIsOver = false
                winningPlayer = nil
            case .cat:
                activePlayer = nil
                gameIsOver = true
                winningPlayer = nil
            case let .won(player):
                activePlayer = nil
                gameIsOver = true
                winningPlayer = player
            }
        }
    }
    
    private enum GameState {
        case active(GameBoard.Mark) // Active player
        case cat
        case won(GameBoard.Mark) // Winning player
    }
}
