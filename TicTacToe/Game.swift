//
//  Game.swift
//  TicTacToe
//
//  Created by Benjamin Hakes on 1/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    
    mutating internal func restart() {
        self.board = GameBoard()
        activePlayer = .x
        winningPlayer = nil
        gameIsOver = false
    }
    
    mutating func makeMark(at coordinate: Coordinate) throws{
        
        guard let player = activePlayer else {
            NSLog("Game is over")
            return
        }
        
        do {
            try board.place(mark: player, on: coordinate)
            if game(board: board, isWonBy: player) {
                winningPlayer = player
                activePlayer = nil
                gameIsOver = true
            } else if board.isFull {
                activePlayer = nil
                gameIsOver = true
            } else {
                let newPlayer = player == .x ? GameBoard.Mark.o : GameBoard.Mark.x
                activePlayer = newPlayer
            }
        } catch let illegal {
            NSLog("Illegal move")
            throw illegal
        }
    }
    
    private(set) var board: GameBoard = GameBoard()
    
    var activePlayer: GameBoard.Mark? = .x
    var gameIsOver: Bool?
    var winningPlayer: GameBoard.Mark?

    
}
