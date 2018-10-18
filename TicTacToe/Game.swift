//
//  Game.swift
//  TicTacToe
//
//  Created by Moin Uddin on 10/17/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    
    init() {
        self.board = GameBoard()
        self.gameIsOver = false
        self.winningPlayer = nil
        self.activePlayer = .x
    }
    
    mutating internal func restart() {
        board = GameBoard()
        gameIsOver = false
        activePlayer = .x
        winningPlayer = nil
    }
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        guard let activePlayer = activePlayer else {
            NSLog("Game is Over")
            return
        }
        
        do {
            try board.place(mark: activePlayer, on: coordinate)
            if game(board: board, isWonBy: activePlayer) {
                winningPlayer = activePlayer
                gameIsOver = true
                self.activePlayer = nil
                return
            }
            if board.isFull {
                gameIsOver = true
                self.activePlayer = nil
            }
            
            if activePlayer == .x {
                self.activePlayer = .o
            } else {
                self.activePlayer = .x
            }
            
        } catch {
            NSLog("Illegal Move")
            return
        }

    }
    
    private(set) var board: GameBoard
    
    var activePlayer: GameBoard.Mark?
    var gameIsOver: Bool
    var winningPlayer: GameBoard.Mark?
}
