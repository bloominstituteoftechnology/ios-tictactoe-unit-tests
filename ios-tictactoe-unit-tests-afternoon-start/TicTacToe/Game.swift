//
//  Game.swift
//  TicTacToe
//
//  Created by Jessie Ann Griffin on 4/14/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    mutating internal func restart() {
            board = GameBoard()
            gameState = .active(.x)
    }
    
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        if let player = activePlayer {
            try board.place(mark: player, on: coordinate)
            if game(board: board, isWonBy: player) {
                gameState = .won(player)
                gameIsOver = true
            } else if board.isFull {
                gameState = .cat
                gameIsOver = true
            } else {
                let newPlayer = player == .x ? GameBoard.Mark.o : GameBoard.Mark.x
                gameState = .active(newPlayer)
                gameIsOver = false
            }
        }
    }

    private(set) var board: GameBoard
    
    private var gameState: GameState

    internal var activePlayer: GameBoard.Mark?
    internal var gameIsOver: Bool
    internal var winningPlayer: GameBoard.Mark?
}

enum GameState {
    case active(GameBoard.Mark) // Active player
    case cat
    case won(GameBoard.Mark) // Winning player
}
