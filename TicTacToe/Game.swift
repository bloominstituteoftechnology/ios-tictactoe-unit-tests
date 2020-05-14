//
//  Game.swift
//  TicTacToe
//
//  Created by Ezra Black on 5/14/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    
    enum GameState {
        case active(GameBoard.Mark) // Active player
        case cat
        case won(GameBoard.Mark) // Winning player
    }
    
    mutating internal func restart() {
        board = GameBoard()
        gameState = .active(.x)
        activePlayer = .x
        gameIsOver = false
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
                winningPlayer = player
                gameIsOver = true
            } else if board.isFull {
                gameState = .cat
                winningPlayer = nil
                gameIsOver = true
            } else {
                let activePlayer = player == .x ? GameBoard.Mark.o : GameBoard.Mark.x
                self.activePlayer = activePlayer
                gameState = .active(activePlayer)
            }
        } catch {
            NSLog("Illegal move")
        }
    }
    
    private(set) var board: GameBoard = GameBoard()
    
    internal var gameState = GameState.active(.x)
    internal var activePlayer: GameBoard.Mark? = .x
    internal var gameIsOver: Bool = false
    internal var winningPlayer: GameBoard.Mark? = nil
}
