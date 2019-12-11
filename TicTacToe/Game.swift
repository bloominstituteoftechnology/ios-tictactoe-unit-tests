//
//  Game.swift
//  TicTacToe
//
//  Created by Jon Bash on 2019-12-11.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    
    // MARK: - Properties
    private(set) var board: GameBoard
    
    internal var activePlayer: GameBoard.Mark?
    internal var gameIsOver: Bool
    internal var winningPlayer: GameBoard.Mark?
    
    // MARK: - Public Methods
    
    mutating internal func restart() {
        
    }
    
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        
    }
}
