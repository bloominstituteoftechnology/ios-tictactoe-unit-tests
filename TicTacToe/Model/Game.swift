//
//  Game.swift
//  TicTacToe
//
//  Created by Chad Rutherford on 1/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    private(set) var board: GameBoard = GameBoard()
    internal var activePlayer: GameBoard.Mark? = .x
    internal var gameIsOver: Bool = false
    internal var winningPlayer: GameBoard.Mark? = nil
    var gameState = GameState.active(.x)
    
    enum GameState: Equatable {
        case active(GameBoard.Mark) // Playing
        case won(GameBoard.Mark) // Winner
        case cat // Tie Game
    }
    
    mutating internal func restart() {
        board = GameBoard()
        activePlayer = .x
        gameIsOver = false
        winningPlayer = nil
        gameState = .active(.x)
    }
    
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        guard case let GameState.active(player) = gameState else {
            NSLog("Game over")
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
                gameIsOver = true
            } else {
                let activePlayer = player == .x ? GameBoard.Mark.o : GameBoard.Mark.x
                self.activePlayer = activePlayer
                gameState = .active(activePlayer)
            }
        } catch {
            NSLog("Move Not Allowed")
            throw error
        }
    }
}
