//
//  Game.swift
//  TicTacToe
//
//  Created by Bradley Diroff on 4/15/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    
    private enum GameState {
        case active(GameBoard.Mark) // Active player
        case cat
        case won(GameBoard.Mark) // Winning player
    }
    
    private(set) var board: GameBoard

    internal var activePlayer: GameBoard.Mark?
    internal var gameIsOver: Bool = false
    internal var winningPlayer: GameBoard.Mark?
    
    private var gameState = GameState.active(.x) {
        didSet {
            
        }
    }

    mutating internal func restart() {
        
    }
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        
    }
}
