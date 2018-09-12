//
//  Game.swift
//  TicTacToe
//
//  Created by Conner on 9/12/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    init(board: GameBoard,
         activePlayer: GameBoard.Mark,
         winningPlayer: GameBoard.Mark?,
         gameIsOver: Bool = false) {
        self.board = board
        self.activePlayer = activePlayer
        self.winningPlayer = winningPlayer
        self.gameIsOver = gameIsOver
    }
    
    mutating func restart() {
        board = GameBoard()
        activePlayer = .x
    }
    
    mutating func makeMark(at coordinate: Coordinate) throws {
        do {
            guard let activePlayer = activePlayer else { return }
            try board.place(mark: activePlayer, on: coordinate)
            
            if game(board: board, isWonBy: activePlayer) {
                winningPlayer = activePlayer
                gameIsOver = true
                return
            }
            
            if activePlayer == .x {
                self.activePlayer = .o
            } else {
                self.activePlayer = .x
            }
        } catch {
            NSLog("Illegal move")
        }
    }
    
    private(set) var board: GameBoard
    private var activePlayer: GameBoard.Mark?
    var winningPlayer: GameBoard.Mark?
    var gameIsOver: Bool
}
