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
                //gameState = .won(activePlayer!)
            } else if board.isFull {
                //gameState = .cat
            } else {
                let newPlayer = activePlayer == .x ? GameBoard.Mark.o : GameBoard.Mark.x
                //gameState = .active(newPlayer)
            }
        } catch {
            NSLog("Illegal move")
        }
    }

  internal var board: GameBoard

  internal var activePlayer: GameBoard.Mark?
  internal var gameIsOver: Bool
  internal var winningPlayer: GameBoard.Mark?
}
