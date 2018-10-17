//
//  Game.swift
//  TicTacToe
//
//  Created by Moin Uddin on 10/17/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    
    mutating internal func restart() {
        board = GameBoard()
        gameIsOver = false
        activePlayer = .x
        winningPlayer = nil
    }
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        guard var activePlayer = activePlayer else { return }
        try board.place(mark: activePlayer, on: coordinate)
        if game(board: board, isWonBy: activePlayer) {
            winningPlayer = activePlayer
        } else if board.isFull {
            gameIsOver = true
        } else {
            if activePlayer == .x {
             activePlayer = .o
            } else {
             activePlayer = .x
            }
        }
    }
    
    private(set) var board: GameBoard
    
    internal var activePlayer: GameBoard.Mark?
    internal var gameIsOver: Bool
    internal var winningPlayer: GameBoard.Mark?
}
