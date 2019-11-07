//
//  Game.swift
//  TicTacToe
//
//  Created by Gi Pyo Kim on 11/6/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    private(set) var board: GameBoard
    
    internal var activePlayer: GameBoard.Mark?
    internal var gameIsOver: Bool
    internal var winningPlayer: GameBoard.Mark?
    
    
    mutating internal func restart() {
        board = GameBoard()
        activePlayer = .x
        gameIsOver = false
    }
    
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        guard let activePlayer = activePlayer else { return }
        
        do {
            try board.place(mark: activePlayer, on: coordinate)
            if game(board: board, isWonBy: activePlayer) {
                gameIsOver = true
                winningPlayer = activePlayer
            } else if board.isFull {
                gameIsOver = true
                winningPlayer = nil
            } else {
                self.activePlayer = activePlayer == .x ? GameBoard.Mark.o : GameBoard.Mark.x
                gameIsOver = false
                winningPlayer = nil
            }
        } catch {
            NSLog("Illegal move")
        }
    }

}
