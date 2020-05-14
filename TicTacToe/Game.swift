//
//  Game.swift
//  TicTacToe
//
//  Created by Shawn James on 5/14/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

enum GameState {
    case active(GameBoard.Mark)
    case cat
    case won(GameBoard.Mark)
}

struct Game {
    private(set) var board: GameBoard
    internal var activePlayer: GameBoard.Mark?
    internal var winningPlayer: GameBoard.Mark?
    internal var gameIsOver: Bool
    var gameState: GameState = .active(.x)

    init() {
        self.board = GameBoard()
        gameState = .active(.x)
        activePlayer = .x
        gameIsOver = false
    }

    mutating internal func restart() {
        gameState = .active(.x)
        activePlayer = .x
        winningPlayer = nil
        gameIsOver = false
    }

    mutating internal func makeMark(at coordinate: Coordinate) throws {
        guard case let GameState.active(player) = gameState else { return }

        try board.place(mark: player, on: coordinate)
        
        if game(board: board, isWonBy: player) {
            gameState = .won(player)
            winningPlayer = player
            gameIsOver = true
        } else if board.isFull {
            gameState = .cat
            gameIsOver = true
        } else {
            let newPlayer = player == .x ? GameBoard.Mark.o : GameBoard.Mark.x
            gameState = .active(newPlayer)
            gameIsOver = false
            activePlayer = newPlayer
            winningPlayer = nil
        }
    }
}
