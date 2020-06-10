//
//  Game.swift
//  TicTacToe
//
//  Created by Kelson Hartle on 6/10/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation


import Foundation

struct Game {
    
    // MARK: - Properties
    
    // give these properties default values so when we create/instantiate this struct in GameVC, we don't need/want to set default values there
    private(set) var board = GameBoard()
    
    internal var activePlayer: GameBoard.Mark? = .x
    internal var gameIsOver: Bool = false
    internal var winningPlayer: GameBoard.Mark? = nil
    
    mutating internal func restart() {
        // make empty board
        board = GameBoard()

        gameIsOver = false
        winningPlayer = nil

        // player X starts
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
            // if player is x, want o to go, if player is o, want x to go
            if activePlayer == .x {
                activePlayer = .o
            } else {
                activePlayer = .x
            }
        }
    }
}
