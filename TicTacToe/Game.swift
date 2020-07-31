//
//  Game.swift
//  TicTacToe
//
//  Created by Clayton Watkins on 7/28/20.
//  Copyright © 2020 Lambd1a School. All rights reserved.
//

import Foundation

struct Game {
    
    enum GameState {
        case active(GameBoard.Mark) // Active player
        case cat
        case won(GameBoard.Mark) // Winning player
    }
    mutating internal func restart(){
        board = GameBoard()
        gameState = .active(.x)
        winningPlayer = nil
        gameIsOver = false
    }
    
    mutating internal func makeMark(at coordinate: Coordinate) throws{
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
