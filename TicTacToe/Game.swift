//
//  Game.swift
//  TicTacToe
//
//  Created by Christy Hicks on 4/14/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    // MARK: - Properties
    private(set) var board = GameBoard() // Instantiate a game that is read only outside this struct
    internal var activePlayer: GameBoard.Mark? = .x // Set default active player to .x
    internal var gameIsOver: Bool = false // Set default to false so game can proceed.
    internal var winningPlayer: GameBoard.Mark? = nil // Set default to nil. Will change if a player wins.
    
    // MARK: - Methods
    mutating internal func restart() { // restarts game after it has completed.
        board = GameBoard()
        activePlayer = .x
        winningPlayer = nil
        gameIsOver = false
    }
    
    mutating internal func makeMark(at coordinate: Coordinate) throws { // Adds a mark, if possible, or ends the game.
        guard let player = activePlayer else { return }
        
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
    }
}
