//
//  Game.swift
//  TicTacToe
//
//  Created by Dillon McElhinney on 10/17/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    private(set) var board = GameBoard()
    private(set) var lastMove: Coordinate?
    var activePlayer: GameBoard.Mark? = .x
    var gameIsOver: Bool = false
    var winningPlayer: GameBoard.Mark?
    
    mutating func restart() {
        board = GameBoard()
        activePlayer = .x
        winningPlayer = nil
        gameIsOver = false
        lastMove = nil
    }
    
    mutating func makeMark(at coordinate: Coordinate) throws {
        guard let activePlayer = activePlayer else {
            NSLog("Error: There was no active player")
            return
        }
        
            try board.place(mark: activePlayer, on: coordinate)
            if game(board: board, isWonBy: activePlayer) {
                gameIsOver = true
                winningPlayer = activePlayer
            } else if board.isFull {
                gameIsOver = true
                winningPlayer = nil
            } else {
                lastMove = coordinate
                togglePlayer()
            }
    }
    
    mutating func undoMove() {
        if let lastMove = lastMove {
            board.removeMark(from: lastMove)
            togglePlayer()
        }
        lastMove = nil
    }
    
    private mutating func togglePlayer() {
        activePlayer = activePlayer == .x ? .o : .x
    }
    
}
