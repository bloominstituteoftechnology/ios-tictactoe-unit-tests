//
//  Game.swift
//  TicTacToe
//
//  Created by Christopher Aronson on 6/12/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    
    private(set) var board: GameBoard
    
    internal var  activePlayer: GameBoard.Mark?
    internal var gameIsOver: Bool
    internal var winningPlayer: GameBoard.Mark?
    
    mutating internal func restart() {
        activePlayer = .x
        gameIsOver = false
        winningPlayer = nil
        
        board = GameBoard()
        
    }
    
    mutating internal func makeMark(at coordinate: Coordinate) throws {}
}
