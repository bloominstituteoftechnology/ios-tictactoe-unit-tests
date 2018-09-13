//
//  Game.swift
//  TicTacToe
//
//  Created by Linh Bouniol on 9/12/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

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
        
        
        
        
        
        
//        // if player is x, want o to go, if player is o, want x to go
//        if activePlayer == .x {
//            self.activePlayer = .o
//        } else {
//            self.activePlayer = .x
//        }
        
        // the player is nil from the if else statement above, but when it gets to this if statement the player is set again, which we don't want. we want player to be nil if the game is over.
    }
}
