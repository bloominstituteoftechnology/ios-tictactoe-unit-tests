//
//  Game.swift
//  TicTacToe
//
//  Created by Jake Connerly on 10/9/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    
    private(set) var board: GameBoard = GameBoard()
    
    internal var activePlayer: GameBoard.Mark? = .x
    internal var gameIsOver: Bool = false
    internal var winningPlayer: GameBoard.Mark? = nil
    
    private enum GameState {
        case active(GameBoard.Mark) // Active player
        case cat
        case won(GameBoard.Mark) // Winning player
    }
    
    private var gameState: GameState = .active(.x) {
        didSet {
            switch gameState {
            case .active(.x):
                activePlayer = .x
                gameIsOver = false
                winningPlayer = nil
            case .active(.o):
                activePlayer = .o
                gameIsOver = false
                winningPlayer = nil
            case .cat:
                activePlayer = nil
                gameIsOver = true
                winningPlayer = nil
            case .won(.x):
                activePlayer = nil
                gameIsOver = true
                winningPlayer = .x
            case .won(.o):
                activePlayer = nil
                gameIsOver = true
                winningPlayer = .o
            }
        }
    }
    
    mutating internal func restart() {
        board = GameBoard()
        gameState = .active(.x)
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
            } else if board.isFull {
                gameState = .cat
            } else {
                let newPlayer = player == .x ? GameBoard.Mark.o : GameBoard.Mark.x
                gameState = .active(newPlayer)
            }
        } catch {
            NSLog("Illegal move")
        }
    }
    
}
