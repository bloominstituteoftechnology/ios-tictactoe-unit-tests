//
//  Game.swift
//  TicTacToe
//
//  Created by Jon Bash on 2019-12-11.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    // MARK: - Game.State
    
    private enum State {
        case active(GameBoard.Mark) // Active player
        case cat
        case won(GameBoard.Mark) // Winning player
    }
    
    // MARK: - Public Properties
    
    internal var activePlayer: GameBoard.Mark? {
        switch gameState {
        case .active(let activePlayer):
            return activePlayer
        default:
            return nil
        }
    }
    internal var gameIsOver: Bool {
        switch gameState {
        case .active(_):
            return false
        default:
            return true
        }
    }
    internal var winningPlayer: GameBoard.Mark? {
        switch gameState {
        case .won(let winner):
            return winner
        default:
            return nil
        }
    }
    
    // MARK: - Private Properties
    
    private(set) var board: GameBoard = GameBoard()
    
    private var gameState = State.active(.x)
    
    // MARK: - Public Methods
    
    mutating internal func restart() {
        board = GameBoard()
        gameState = .active(.x)
    }
    
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        guard let mark = activePlayer else {
            throw GameBoardError.noActivePlayer
        }
        try board.place(mark: mark, on: coordinate)
    }
    
    private mutating func updateGameState() {
        guard case var State.active(player) = gameState else {
            NSLog("Game is over")
            return
        }
        
        if game(board: board, isWonBy: player) {
            gameState = .won(player)
        } else if board.isFull {
            gameState = .cat
        } else {
            player.toggle()
            gameState = .active(player)
        }
    }
}
