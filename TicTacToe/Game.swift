//
//  Game.swift
//  TicTacToe
//
//  Created by denis cedeno on 4/16/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct Game {

    enum GameState {
        case active(GameBoard.Mark) // Active player
        case cat // draw
        case won(GameBoard.Mark) // Winning player
    }
    
    private(set) var board: GameBoard

    var activePlayer: GameBoard.Mark?
    var gameIsOver: Bool
    var winningPlayer: GameBoard.Mark?
    var gameState = GameState.active(.x)
    
    init() {
        self.board = GameBoard()
        activePlayer = .x
        gameState = .active(.x)
        gameIsOver = false
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
        } catch {
            print("Illegal Move")
        }
    }


}

