//
//  Game.swift
//  TicTacToe
//
//  Created by Christopher Aronson on 6/12/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    
    private(set) var board: GameBoard = GameBoard()
    
    internal var  activePlayer: GameBoard.Mark = GameBoard.Mark.x
    internal var gameIsOver: Bool = false
    internal var winningPlayer: GameBoard.Mark? = nil
    
    mutating internal func restart() {
        activePlayer = .x
        gameIsOver = false
        winningPlayer = nil
        
        board = GameBoard()
        
    }
    
    mutating internal func makeMark(at coordinate: Coordinate) throws {}
}
