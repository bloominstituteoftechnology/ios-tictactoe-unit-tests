//
//  Game.swift
//  TicTacToe
//
//  Created by Sergey Osipyan on 2/6/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct Game {
    
    internal enum GameState {
        case active(GameBoard.Mark) // Active player
        case cat
        case won(GameBoard.Mark) // Winning player
    }
    
    mutating internal func restart() {
        board = GameBoard()
        gameState = .active(.x)
        gameIsOver = false
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
                activePlayer = nil
            } else if board.isFull {
                gameState = .cat
                gameIsOver = true
                activePlayer = nil
            } else {
                let newPlayer = player == .x ? GameBoard.Mark.o : GameBoard.Mark.x
                gameState = .active(newPlayer)
                activePlayer = newPlayer
            }
        } catch {
            NSLog("Illegal move")
        }
        
    }
    private(set) var board: GameBoard
    internal var gameState = GameState.active(.x)
    internal var activePlayer: GameBoard.Mark? = .x
    internal var gameIsOver: Bool
    internal var winningPlayer: GameBoard.Mark?
    
   
}
