//
//  Game.swift
//  TicTacToe
//
//  Created by Bradley Diroff on 5/13/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct Games {
    
    private enum GameState {
        case active(GameBoard.Mark) // Active player
        case cat
        case won(GameBoard.Mark) // Winning player
    }
    
    private(set) var board: GameBoard = GameBoard()

    internal var activePlayer: GameBoard.Mark? = .x
    internal var gameIsOver: Bool = false
    internal var winningPlayer: GameBoard.Mark? = nil
    
    private var gameState = GameState.active(.x) {
        didSet {
            
        }
    }

    mutating internal func restart() {
        board = GameBoard()
               gameState = .active(.x)
    }
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        
        guard let activePlayer = activePlayer else { return }
        try board.place(mark: activePlayer, on: coordinate)
        
        if self.activePlayer == .x {
            self.activePlayer = .o
        } else {
            self.activePlayer = .x
        }
        
    }
}
