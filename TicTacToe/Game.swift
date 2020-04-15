//
//  Game.swift
//  TicTacToe
//
//  Created by Karen Rodriguez on 4/15/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct Game {

    private(set) var board: GameBoard
    
    internal var activePlayer: GameBoard.Mark?
    internal var gameIsOver: Bool
    internal var winningPlayer: GameBoard.Mark?
    
    mutating internal func restart() {
        // Create brand new board (Got this from looking at GameVC)
        board = GameBoard()
        // Reset gameIsOver
        gameIsOver = false
        // Make x first move.
        activePlayer = .x
    }
    
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        
        guard let player = activePlayer else {
            NSLog("Where is player?")
            return
        }
        
        do {
            try board.place(mark: player, on: coordinate)
            if game(board: board, isWonBy: player) {
                gameIsOver = true
                activePlayer = nil
                winningPlayer = player
            } else if board.isFull {
                gameIsOver = true
                activePlayer = nil
                winningPlayer = nil
            }
        } catch {
            
        }
    }
    
}
