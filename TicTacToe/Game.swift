//
//  Game.swift
//  TicTacToe
//
//  Created by Lambda_School_Loaner_34 on 3/6/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    
    mutating func restart() {
        board = GameBoard()
        activePlayer = .x
    }
    
    mutating func makeMark(at coordinate: Coordinate) throws {
        
    }
    
    private(set) var board: GameBoard = GameBoard()
    
    var activePlayer: GameBoard.Mark? = .x
    var gameIsOver: Bool = false
    var winningPlayer: GameBoard.Mark? = nil
}
