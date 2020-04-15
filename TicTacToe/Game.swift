//
//  Game.swift
//  TicTacToe
//
//  Created by Shawn Gee on 4/15/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    // MARK: - Public Properties
    
    private(set) var board: GameBoard = GameBoard()
    var activePlayer: GameBoard.Mark? = .x
    var gameIsOver: Bool = false
    var winningPlayer: GameBoard.Mark? = nil
    
    // MARK: - Public Methods
    
    mutating func restart() {
        
    }
    mutating func makeMark(at coordinate: Coordinate) throws {
        
    }
}
