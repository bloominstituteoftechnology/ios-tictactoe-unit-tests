//
//  Game.swift
//  TicTacToe
//
//  Created by Jordan Christensen on 10/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    private(set) var board: GameBoard
    internal var activePlayer: GameBoard.Mark? = .x
    internal var gameIsOver: Bool
    internal var winningPlayer: GameBoard.Mark?

    mutating internal func restart() {
        
    }
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        
    }
}
