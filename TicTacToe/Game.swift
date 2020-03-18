//
//  Game.swift
//  TicTacToeTests
//
//  Created by Ufuk Türközü on 18.03.20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

enum GameState {
    case active(GameBoard.Mark) // Active player
    case cat
    case won(GameBoard.Mark) // Winning player
}

struct Game {
    
    private(set) var board: GameBoard = GameBoard()
    internal var activePlayer: GameBoard.Mark? = .x
    internal var gameIsOver: Bool = false
    internal var winningPlayer: GameBoard.Mark? = nil
    var gameState = GameState.active(.x)

    mutating internal func restart() {
        board = GameBoard()
        gameState = GameState.active(.x)
        gameIsOver = false
        activePlayer = .x
        winningPlayer = nil
    }
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        guard case let GameState.active(player) = gameState else {
            NSLog("Game is over")
            return
        }
        
        do {
            try board.place(mark: player, on: coordinate)
            if game(board: board, isWonBy: player) {
                gameState = .won(player)
                gameIsOver = true
                winningPlayer = player
            } else if board.isFull {
                gameState = .cat
                gameIsOver = true
                winningPlayer = nil
            } else {
                let activePlayer = player == .x ? GameBoard.Mark.o : GameBoard.Mark.x
                self.activePlayer = activePlayer
                gameState = .active(activePlayer)
                gameIsOver = true
            }
        } catch {
            NSLog("Illegal move")
        }
    }

    
}
