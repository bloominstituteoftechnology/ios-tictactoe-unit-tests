//
//  Game.swift
//  TicTacToe
//
//  Created by Vici Shaweddy on 11/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    private enum GameState {
        case active(GameBoard.Mark) // Active player
        case cat
        case won(GameBoard.Mark) // Winning player
    }
    
    private var gameState = GameState.active(.x)
    private(set) var board: GameBoard
    
    internal var activePlayer: GameBoard.Mark? {
        // extracting the active player from the active state of the GameState enum
        if case .active(let activePlayer) = self.gameState {
            return activePlayer
        } else {
            return nil
        }
    }
    
    internal var gameIsOver: Bool {
        switch self.gameState {
        case .cat, .won:
            return true
        case .active:
            return false
        }
    }
    
    internal var winningPlayer: GameBoard.Mark? {
        if case .won(let winningPlayer) = self.gameState {
            return winningPlayer
        } else {
            return nil
        }
    }
    
    init() {
        self.board = GameBoard()
    }
    
    mutating internal func restart() {
        board = GameBoard()
        gameState = .active(.x)
    }
    
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        guard case let GameState.active(activePlayer) = gameState else {
            NSLog("Game is over")
            return
        }
        
        do {
            try board.place(mark: activePlayer, on: coordinate)
            if game(board: board, isWonBy: activePlayer) {
                gameState = .won(activePlayer)
            } else if board.isFull {
                gameState = .cat
            } else {
                let newPlayer = activePlayer == .x ? GameBoard.Mark.o : GameBoard.Mark.x
                gameState = .active(newPlayer)
            }
        } catch {
            NSLog("Illegal move")
        }
    }
}
