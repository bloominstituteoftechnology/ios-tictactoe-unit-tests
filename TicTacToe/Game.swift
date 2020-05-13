//
//  Game.swift
//  TicTacToe
//
//  Created by Hunter Oppel on 5/13/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    
    private(set) var board: GameBoard
    
    var activePlayer: GameBoard.Mark?
    var gameIsOver = false
    var winningPlayer: GameBoard.Mark?
    
    mutating func restart() {
        board = GameBoard()
        activePlayer = .x
        winningPlayer = nil
        gameIsOver = false
    }
    
    mutating func makeMark(at coordinate: Coordinate) throws {
        let player = activePlayer ?? .x
        
        try board.place(mark: player, on: coordinate)
        
        if game(board: board, isWonBy: player) {
            winningPlayer = player
            activePlayer = nil
            gameIsOver = true
        } else if board.isFull {
            winningPlayer = nil
            activePlayer = nil
            gameIsOver = true
        } else {
            let newPlayer = player == .x ? GameBoard.Mark.o : GameBoard.Mark.x
            activePlayer = newPlayer
        }
    }
}
