//
//  Game.swift
//  TicTacToe
//
//  Created by ronald huston jr on 9/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    
    //  a board for Game to modify
    private(set) var board: GameBoard
    
    //  represent a current active player
    internal var activePlayer: GameBoard.Mark?
    
    //  a varible to represent whether the game is running
    internal var gameIsOver: Bool
    
    //  the player that won; X or O
    internal var winningPlayer: GameBoard.Mark?
    
    //  restart the game to a fresh state with an empty board
    mutating internal func restart() {
        board = GameBoard()
        activePlayer = .x
        gameIsOver = false
    }
    
    //  will add mark for current player @ given coordinate; update game state
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        
        guard let player = activePlayer else {
            NSLog("game is over")
            return
        }
        
        
    }
    
}
