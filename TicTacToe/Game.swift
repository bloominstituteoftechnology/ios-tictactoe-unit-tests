
//
//  Game.swift
//  TicTacToe
//
//  Created by Lambda_School_Loaner_268 on 4/15/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    
    enum GameState {
        case active(GameBoard.Mark) // Active player
        case cat
        case won(GameBoard.Mark) // Winning player
    }
    
    private(set) var board: GameBoard = GameBoard()

    internal var activePlayer: GameBoard.Mark? = .x
    internal var gameIsOver: Bool = false
    internal var winningPlayer: GameBoard.Mark? = nil
    internal var gameState: GameState = .active(.x)

    mutating internal func restart() {
        gameState = .active(.x)
        board = GameBoard()
        activePlayer = .x
        gameIsOver = false
        winningPlayer = nil
        
        
    }
    
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        guard case let GameState.active(player) = self.gameState else {
            NSLog("Game is over")
            return
        }
        do {
            try board.place(mark: player, on: coordinate)
            if game(board: board, isWonBy: player) {
                gameState = .won(player)
                gameIsOver = true
                winningPlayer = player
            }
            else if board.isFull {
                gameState = .cat
                gameIsOver = true
                winningPlayer = nil
            }
            else {
                if player == .x {
                    let nextPlayer: GameBoard.Mark = .o
                    gameState = .active(nextPlayer)
                }
                else {
                    let nextPlayer: GameBoard.Mark = .x
                    gameState = .active(nextPlayer)
                }
            }
        } catch {
            NSLog("Illegal Move")
        }
    }
}
