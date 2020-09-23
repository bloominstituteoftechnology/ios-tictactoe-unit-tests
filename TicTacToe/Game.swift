//
//  Game.swift
//  TicTacToe
//
//  Created by Norlan Tibanear on 9/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    
    init() {
        board = GameBoard()
        gameIsOver = false
    }
    
    enum GameState {
        case active(GameBoard.Mark) // Active player
        case cat
        case won(GameBoard.Mark) // Winning player
    }
    

    mutating internal func restart() {
        board = GameBoard()
        gameState = .active(.x)
    }
    
    
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        guard case let GameState.active(player) = gameState else {
            print("Game Over")
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
            NSLog("Illegal Move")
        }
        
    }//
    

  private(set) var board: GameBoard
    
    internal var gameState = GameState.active(.x) {
        didSet {
            switch gameState {
            case .active(let player):
                winningPlayer = nil
                gameIsOver = false
                activePlayer = player
            case .cat:
                winningPlayer = nil
                gameIsOver = true
                activePlayer = nil
            case .won(let player):
                winningPlayer = player
                gameIsOver = true
                activePlayer = nil
            }
        }
    }
  

  internal var activePlayer: GameBoard.Mark?
  internal var gameIsOver: Bool
  internal var winningPlayer: GameBoard.Mark?
    
}
