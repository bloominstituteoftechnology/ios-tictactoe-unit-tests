//
//  Game.swift
//  TicTacToe
//
//  Created by Chris Dobek on 5/13/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
struct Game {
    
    enum GameStatus: Equatable {
        case newGame(GameBoard.Mark)
        case catsGame
        case gameOver(GameBoard.Mark)
    }
    
    // MARK: - Properties
    private(set) var board: GameBoard
    internal var activePlayer: GameBoard.Mark?
    internal var gameIsOver: Bool
    internal var winningPlayer: GameBoard.Mark?
    var gameStatus: GameStatus = .newGame(.x)
    
    //MARK: - Functions
    mutating internal func restart() {
        gameStatus = .newGame(.x)
        gameIsOver = false
        winningPlayer = nil
        activePlayer = .x
    }
    
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        guard case let GameStatus.newGame(player) = gameStatus else {
            NSLog("Game Over")
            return
        }
        
        try board.place(mark: player, on: coordinate)
        if game(board: board, isWonBy: player) {
            gameStatus = .gameOver(player)
            gameIsOver = true
            winningPlayer = player
        } else if board.isFull {
            gameStatus = .catsGame
            gameIsOver = true
        } else {
            let newPlayer = player == .x ? GameBoard.Mark.o : GameBoard.Mark.x
            gameStatus = .newGame(newPlayer)
            gameIsOver = false
            winningPlayer = nil
            activePlayer = newPlayer
        }
    }
}
