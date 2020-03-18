//
//  Game.swift
//  TicTacToe
//
//  Created by Enrique Gongora on 3/18/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    
    mutating internal func restart() {
        board = GameBoard()
        gameIsOver = false
        activePlayer = .x
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
    
    private(set) var board: GameBoard
    internal var activePlayer: GameBoard.Mark?
    internal var gameIsOver: Bool
    internal var winningPlayer: GameBoard.Mark?
    
    init() {
        board = GameBoard()
        gameIsOver = false
        activePlayer = .x
    }
}
