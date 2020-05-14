//
//  Game.swift
//  TicTacToe
//
//  Created by Chris Dobek on 5/13/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

enum GameState {
    case active(GameBoard.Mark)
    case cat
    case won(GameBoard.Mark)
}

struct Game {
    
    
    // MARK: - Properties
    private(set) var board: GameBoard
    internal var activePlayer: GameBoard.Mark?
    internal var gameIsOver: Bool
    internal var winningPlayer: GameBoard.Mark?
    var gameState: GameState = .active(.x)
    
    init() {
        self.board = GameBoard()
        activePlayer = .x
        gameState = .active(.x)
        gameIsOver = false
    }
    
    //MARK: - Functions
    mutating internal func restart() {
        board = GameBoard()
        gameState = .active(.x)
        gameIsOver = false
        winningPlayer = nil
        activePlayer = .x
    }
    
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        guard case let GameState.active(player) = gameState else {
            NSLog("Game Over")
            return
        }
        
        try board.place(mark: player, on: coordinate)
        if game(board: board, isWonBy: player) {
            gameState = .won(player)
            gameIsOver = true
            winningPlayer = player
        } else if board.isFull {
            gameState = .cat
            gameIsOver = true
        } else {
            let newPlayer = player == .x ? GameBoard.Mark.o : GameBoard.Mark.x
            gameState = .active(newPlayer)
            gameIsOver = false
            winningPlayer = nil
            activePlayer = newPlayer
        }
    }
}
