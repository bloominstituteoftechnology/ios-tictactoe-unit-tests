//
//  Game.swift
//  TicTacToe
//
//  Created by Matthew Martindale on 5/26/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    
    mutating internal func restart() {
        board = GameBoard()
        activePlayer = .x
    }

    private(set) var board: GameBoard

    internal var activePlayer: GameBoard.Mark?
    internal var gameIsOver: Bool?
    internal var winningPlayer: GameBoard.Mark?
}
