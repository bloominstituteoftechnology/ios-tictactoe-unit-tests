//
//  Game.swift
//  TicTacToe
//
//  Created by Jorge Alvarez on 2/19/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

/// This struct should handle most of the game logic (logic currently in GameViewController)
struct Game {
    
    /// Externally read-only property for the game board. Game (struct) itself modifies this as the game progresses
    private(set) var board: GameBoard

    /// The currently active player, either .x or .o. That is, the player whose turn it is. nil if the game is over. Starts with .x
    internal var activePlayer: GameBoard.Mark?
    
    /// true if the game is over (either won or a cat's game), false if the game is still running
    internal var gameIsOver: Bool
    
    /// The player that won the game, either .x or .o. nil if the game is still running, or it's a cat's game (no one won)
    internal var winningPlayer: GameBoard.Mark?
    
    /// Restarts the game to a fresh state with an empty board, and player X starting first
    mutating internal func restart() {
        
    }
    
    /// Adds a mark for the currently active player at the given coordinate. Updates game state
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        
    }
}
