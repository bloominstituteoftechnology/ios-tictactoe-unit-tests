//
//  Game.swift
//  TicTacToe
//
//  Created by Isaac Lyons on 11/6/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    
    init() {
        board = GameBoard()
        activePlayer = .x
    }
    
    mutating internal func restart() {
        board = GameBoard()
        activePlayer = .x
    }
    
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        
    }
    
    private(set) var board: GameBoard
    
    internal var activePlayer: GameBoard.Mark?
    internal var gameIsOver: Bool {
        return false
    }
    internal var winningPlayer: GameBoard.Mark? {
        return nil
    }
}
