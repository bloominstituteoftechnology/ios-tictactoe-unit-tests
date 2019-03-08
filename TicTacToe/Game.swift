//
//  Game.swift
//  TicTacToe
//
//  Created by Paul Yi on 3/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    
    // MARK: - Properties

    private(set) var board = GameBoard()
    
    internal var activePlayer: GameBoard.Mark? = .x
    internal var gameIsOver: Bool = false
    internal var winningPlayer: GameBoard.Mark? = nil
    
    mutating internal func restart() {
        board = GameBoard()
        gameIsOver = false
        winningPlayer = nil
        activePlayer = .x
    }
    
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        guard let currentlyActivePlayer = activePlayer else { return }
        
        try board.place(mark: currentlyActivePlayer, on: coordinate)
        
        if game(board: board, isWonBy: currentlyActivePlayer) {
            gameIsOver = true
            winningPlayer = currentlyActivePlayer
            activePlayer = nil
        } else if board.isFull {
            gameIsOver = true
            winningPlayer = nil
            activePlayer = nil
        } else {
            if activePlayer == .x {
                activePlayer = .o
            } else {
                activePlayer = .x
            }
        }

    }
}
