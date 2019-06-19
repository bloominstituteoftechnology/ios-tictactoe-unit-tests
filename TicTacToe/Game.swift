//
//  Game.swift
//  TicTacToe
//
//  Created by Mitchell Budge on 6/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    
    mutating internal func restart() {
        activePlayer = GameBoard.Mark.x
        gameIsOver = false
        winningPlayer = nil
        gameState = .active(.x)
        board = GameBoard()
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

    private(set) var board: GameBoard = GameBoard()
    internal var activePlayer: GameBoard.Mark?
    internal var gameIsOver: Bool = false
    internal var winningPlayer: GameBoard.Mark? = nil
    private(set) var gameState: GameState = GameState.active(.x)
    
    enum GameState {
        case active(GameBoard.Mark)
        case cat
        case won(GameBoard.Mark)
    }
    
}
