//
//  Game.swift
//  TicTacToe
//
//  Created by Ivan Caldwell on 2/6/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct Game {

    // board : Externally read-only property for the game board. Game itself
    // modifies this as the game progresses.
    private(set) var board: GameBoard = GameBoard()
    
    // activePlayer : The currently active player, either .x or .o . That is, the
    // player whose turn it is. nil if the game is over.
    internal var activePlayer: GameBoard.Mark? = .x
    
    // gameIsOver : true if the game is over (either won or a cat's game), false
    // if the game is still running.
    internal var gameIsOver: Bool
    
    // winningPlayer : The player that won the game, either .x or .o . nil if the
    // game is still running, or it's a cat's game (no one won).
    internal var winningPlayer: GameBoard.Mark?
    
    
    // restart() : Restarts the game to a fresh state with an empty board,
    // and player X starting.
    mutating internal func restart() {
        board = GameBoard()
        activePlayer = .x
        gameIsOver = false
        winningPlayer = nil
    }
    
    // makeMark(at:) : adds a mark for the currently active player at the given
    // coordinate. Updates game state.
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        guard let player = activePlayer else {
            NSLog("Game Over")
            return
        }
        do {
            try board.place(mark: player, on: coordinate)
            if game(board: board, isWonBy: player) {
                activePlayer = nil
                gameIsOver = true
                winningPlayer = player
            } else if board.isFull {
                activePlayer = nil
                gameIsOver = true
            } else {
                let newPlayer = player == .x ? GameBoard.Mark.o : GameBoard.Mark.x
                activePlayer = newPlayer
            }
        } catch let illegal {
            NSLog("Illegal move")
            throw illegal
        }
    }
    

}
