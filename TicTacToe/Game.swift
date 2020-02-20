//
//  Game.swift
//  TicTacToe
//
//  Created by Michael on 2/19/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct Game {

    enum GameStatus: Equatable {
        case newGame(GameBoard.Mark)
        case catsGame
        case gameOver(GameBoard.Mark)
    }
    
    private(set) var board: GameBoard = GameBoard()

    internal var activePlayer: GameBoard.Mark?
    internal var gameIsOver: Bool = false
    internal var winningPlayer: GameBoard.Mark?
    var gameStatus: GameStatus = .newGame(.x)
    
    
    mutating internal func restart() {
        gameStatus = .newGame(.x)
        board = GameBoard()
        gameIsOver = false
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
    
//    guard case let GameStatus.newGame(player) = gameStatus else {
//        NSLog("Game is over")
//        return
//    }
//        try board.place(mark: player, on: coordinate)
//        if game(board: board, isWonBy: player) {
//            gameStatus = .gameOver(player)
//            gameIsOver = true
//            winningPlayer = player
//        } else if board.isFull {
//            gameStatus = .catsGame
//            gameIsOver = true
//        } else {
//            let newPlayer = player == .x ? GameBoard.Mark.o : GameBoard.Mark.x
//            gameStatus = .newGame(newPlayer)
//            gameIsOver = false
//            winningPlayer = nil
//            activePlayer = newPlayer
//        }
    
    func game(board: GameBoard, isWonBy player: GameBoard.Mark) -> Bool {
        // Check verticals
        for x in 0..<3 {
            var numMarks = 0
            for y in 0..<3 {
                if board[(x, y)] == player {
                    numMarks += 1
                }
            }
            if numMarks == 3 {
                return true
            }
        }
        
        // Check horizontals
        for y in 0..<3 {
            var numMarks = 0
            for x in 0..<3 {
                if board[(x, y)] == player {
                    numMarks += 1
                }
            }
            if numMarks == 3 {
                return true
            }
        }
        
        // Check diagonals
        let ltr: [Coordinate] = [(0,0), (1, 1), (2,2)]
        var numMatches = 0
        for coord in ltr {
            if board[coord] == player {
                numMatches += 1
            }
        }
        if numMatches == 3 { return true }
        
        let rtl: [Coordinate] = [(2,0), (1, 1), (0,2)]
        numMatches = 0
        for coord in rtl {
            if board[coord] == player {
                numMatches += 1
            }
        }
        if numMatches == 3 { return true }
        
        return false
    }
}
