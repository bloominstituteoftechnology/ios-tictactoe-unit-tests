//
//  Game.swift
//  TicTacToe
//
//  Created by Moses Robinson on 2/27/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    
    mutating func restart() {
        
    }
    
    mutating func makeMark(at coordinate: Coordinate) throws {
        
    }
    
    
    // MARK: - Properties
    
    private(set) var board: GameBoard
    
    var activePlayer: GameBoard.Mark?
    var gameIsOver: Bool
    var winningPlayer: GameBoard.Mark?
}
