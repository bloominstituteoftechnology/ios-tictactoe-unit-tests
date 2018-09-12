//
//  Game.swift
//  TicTacToe
//
//  Created by Lisa Sampson on 9/12/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    
    mutating func restart() {
        board = GameBoard()
        activePlayer = .x
        gameIsOver = false
        winningPlayer = nil
    }
    
    mutating func makeMark(at coordinate: Coordinate) throws {
        guard let activePlayer = activePlayer else { return }
        try board.place(mark: activePlayer, on: coordinate)
        if board.isFull || winningPlayer != nil {
            gameIsOver = true
        }
    }
    
    private(set) var board: GameBoard
    var activePlayer:GameBoard.Mark?
    var gameIsOver: Bool
    var winningPlayer: GameBoard.Mark?
}
