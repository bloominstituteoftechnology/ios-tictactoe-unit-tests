//
//  Game.swift
//  TicTacToe
//
//  Created by Lisa Sampson on 9/12/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    
    mutating func restart() {
        board = GameBoard()
        activePlayer = .x
        gameIsOver = false
        winningPlayer = nil
    }
    
    mutating func makeMark(at coordinate: Coordinate) throws {
        guard let activePlayer = activePlayer else {
            NSLog("Game is over.")
            return
        }
        
        try board.place(mark: activePlayer, on: coordinate)
        if checkGame(board: board, isWonBy: activePlayer) {
            winningPlayer = activePlayer
            gameIsOver = true
            self.activePlayer = nil
            return
        }
        
        if activePlayer == .x {
            self.activePlayer = .o
        } else {
            self.activePlayer = .x
        }
        
        if board.isFull {
            gameIsOver = true
            self.activePlayer = nil
        }
    }
    
    private(set) var board = GameBoard()
    var activePlayer: GameBoard.Mark? = .x
    var gameIsOver: Bool = false
    var winningPlayer: GameBoard.Mark? = nil
}
