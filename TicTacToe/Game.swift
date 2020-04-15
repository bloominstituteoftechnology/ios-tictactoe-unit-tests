//
//  Game.swift
//  TicTacToe
//
//  Created by Shawn Gee on 4/15/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    // MARK: - Public Properties
    
    private(set) var board: GameBoard = GameBoard()
    var activePlayer: GameBoard.Mark? = .x
    var gameIsOver: Bool = false
    var winningPlayer: GameBoard.Mark? = nil
    
    // MARK: - Public Methods
    
    mutating func restart() {
        board = GameBoard()
        activePlayer = .x
        gameIsOver = false
        winningPlayer = nil
    }
    
    mutating func makeMark(at coordinate: Coordinate) throws {
        guard let activePlayer = activePlayer else { return }
        try board.place(mark: activePlayer, on: coordinate)
        
        if game(board: board, isWonBy: activePlayer) {
            gameIsOver = true
            self.activePlayer = nil
            winningPlayer = activePlayer
        } else if board.isFull {
            gameIsOver = true
            self.activePlayer = nil
        } else {
            self.activePlayer = activePlayer == .x ? .o : .x
        }
    }
}
