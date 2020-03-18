//
//  Game.swift
//  TicTacToeTests
//
//  Created by Elizabeth Wingate on 3/18/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    
    private(set) var board: GameBoard

    internal var activePlayer: GameBoard.Mark?
    internal var gameIsOver: Bool
    internal var winningPlayer: GameBoard.Mark?
    
    init() {
        board = GameBoard()
        gameIsOver = false
        activePlayer = .x
    }
    
    mutating internal func restart() {
        
    }
    
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        
    }
}
