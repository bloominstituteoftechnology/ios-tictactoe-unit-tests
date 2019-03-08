//
//  Game.swift
//  TicTacToe
//
//  Created by Paul Yi on 3/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    
    mutating internal func restart() {
        board = GameBoard()
        activePlayer = .x
        gameIsOver = false
        winningPlayer = nil
    }
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        guard let currentlyActivePlayer = activePlayer else { return }
        try board.place(mark: currentlyActivePlayer, on: coordinate)
        if board.isFull || winningPlayer != nil {
            gameIsOver = true
        }
    }
    
    // MARK: - Properties
    
    private(set) var board: GameBoard
    internal var activePlayer: GameBoard.Mark? = .x
    internal var gameIsOver: Bool = false
    internal var winningPlayer: GameBoard.Mark? = nil
}
