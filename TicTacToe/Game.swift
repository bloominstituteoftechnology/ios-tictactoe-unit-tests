//
//  Game.swift
//  TicTacToe
//
//  Created by Moses Robinson on 2/27/19.
//  Copyright © 2019 Lambda School. All rights reserved.
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
        
        if game(board: board, isWonBy: activePlayer) {
            winningPlayer = activePlayer
            gameIsOver = true
            self.activePlayer = nil
            return
        }
        if activePlayer == .x {
            self.activePlayer = .o
        } else {
            self.activePlayer = .x
        }
        if board.isFull {
            gameIsOver = true
            self.activePlayer = nil
        }
    }
    
    
    // MARK: - Properties
    
    private(set) var board: GameBoard = GameBoard()
    
    var activePlayer: GameBoard.Mark? = .x
    var gameIsOver: Bool = false
    var winningPlayer: GameBoard.Mark? = nil
}
