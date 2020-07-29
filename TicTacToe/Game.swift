//
//  Game.swift
//  TicTacToe
//
//  Created by Juan M Mariscal on 5/26/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct Game {

    mutating internal func restart() {
        board = GameBoard()
        activePlayer = .x
        gameIsOver = true
        winningPlayer = .none
    }
    mutating internal func makeMark(at coordinate: Coordinate) throws {

        do {
            try board.place(mark: activePlayer!, on: coordinate)
            if game(board: board, isWonBy: activePlayer!) {
                winningPlayer = activePlayer
                gameIsOver = true
            } else if board.isFull {
                winningPlayer = nil
                gameIsOver = true
            } else {
                let newPlayer = activePlayer == .x ? GameBoard.Mark.o : GameBoard.Mark.x
                winningPlayer = nil
                gameIsOver = false
            }
        } catch {
            NSLog("Illegal move")
        }
    }

    private(set) var board: GameBoard
    
    internal var activePlayer: GameBoard.Mark?
    internal var gameIsOver: Bool
    internal var winningPlayer: GameBoard.Mark?
}
