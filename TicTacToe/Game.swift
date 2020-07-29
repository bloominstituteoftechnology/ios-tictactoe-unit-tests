//
//  Game.swift
//  TicTacToe
//
//  Created by Morgan Smith on 7/29/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct Game {

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

  private(set) var board: GameBoard

  internal var activePlayer: GameBoard.Mark?
  internal var gameIsOver: Bool
  internal var winningPlayer: GameBoard.Mark?
  private var gameState = GameState.active(.x)

  private enum GameState {
      case active(GameBoard.Mark) // Active player
      case cat
      case won(GameBoard.Mark) // Winning player
  }

}
