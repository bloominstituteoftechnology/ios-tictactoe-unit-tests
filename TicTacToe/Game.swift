//
//  Game.swift
//  TicTacToe
//
//  Created by Christy Hicks on 4/14/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct Game {
// Board can only be created/changed in this file, but can be read from other files.
    private(set) var board = GameBoard()

    internal var activePlayer: GameBoard.Mark? = .x
    internal var gameIsOver: Bool = false
    internal var winningPlayer: GameBoard.Mark? = nil

    mutating internal func restart() {
        board = GameBoard()
        activePlayer = .x
        winningPlayer = nil
        gameIsOver = false
    }
    
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        guard let player = activePlayer else { return }
        do {
            try board.place(mark: player, on: coordinate)
            if game(board: board, isWonBy: player) {
                winningPlayer = player
                gameIsOver = true
                activePlayer = nil
            } else if board.isFull {
                winningPlayer = nil
                gameIsOver = true
                activePlayer = nil
            } else {
                let newPlayer = player == .x ? GameBoard.Mark.o : GameBoard.Mark.x
                activePlayer = newPlayer
            }
        } catch {
            NSLog("Illegal move")
        }
    }
}
