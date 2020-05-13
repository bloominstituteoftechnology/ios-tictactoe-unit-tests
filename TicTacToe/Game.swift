//
//  Game.swift
//  TicTacToe
//
//  Created by Hunter Oppel on 5/13/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    enum GameState {
        case active
        case cat
        case won
    }
    
    private(set) var board: GameBoard
    private(set) var gameState = GameState.active
    
    var activePlayer: GameBoard.Mark? = .x
    var gameIsOver = false
    var winningPlayer: GameBoard.Mark?
    
    mutating func restart() {
        board = GameBoard()
        gameState = .active
        activePlayer = .x
        winningPlayer = nil
        gameIsOver = false
    }
    
    mutating func makeMark(at coordinate: Coordinate) throws {
        guard let player = activePlayer else { return }
        
        try board.place(mark: player, on: coordinate)
        
        if game(board: board, isWonBy: player) {
            winningPlayer = player
            activePlayer = nil
            gameIsOver = true
            gameState = .won
        } else if board.isFull {
            winningPlayer = nil
            activePlayer = nil
            gameIsOver = true
            gameState = .cat
        } else {
            let newPlayer = player == .x ? GameBoard.Mark.o : GameBoard.Mark.x
            activePlayer = newPlayer
        }
    }
}
