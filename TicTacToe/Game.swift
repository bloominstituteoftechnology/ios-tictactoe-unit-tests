//
//  Game.swift
//  TicTacToe
//
//  Created by Jon Bash on 2019-12-11.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    // MARK: - Game.State
    
    private enum State {
        case active(GameBoard.Mark) // Active player
        case cat
        case won(GameBoard.Mark) // Winning player
    }
    
    // MARK: - Public Properties
    
    internal var activePlayer: GameBoard.Mark? {
        switch gameState {
        case .active(let activePlayer):
            return activePlayer
        default:
            return nil
        }
    }
    internal var gameIsOver: Bool {
        switch gameState {
        case .active(_):
            return false
        default:
            return true
        }
    }
    internal var winningPlayer: GameBoard.Mark? {
        switch gameState {
        case .won(let winner):
            return winner
        default:
            return nil
        }
    }
    
    // MARK: - Private Properties
    private var gameState = State.active(.x)
    
    // MARK: - Public Methods
    
    mutating internal func restart() {
        
    }
    
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        
    }
}
