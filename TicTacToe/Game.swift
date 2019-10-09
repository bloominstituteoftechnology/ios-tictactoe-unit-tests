//
//  Game.swift
//  TicTacToe
//
//  Created by Jordan Christensen on 10/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    private(set) var board: GameBoard
    internal var activePlayer: GameBoard.Mark? = .x
    internal var gameIsOver: Bool
    internal var winningPlayer: GameBoard.Mark?
    internal var lastMove: Coordinate = (-1, -1)

    mutating internal func restart() {
        board = GameBoard()
        gameIsOver = false
        winningPlayer = nil
        activePlayer = .x
    }
    
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        guard let player = activePlayer else { throw NSError() }
        
        do {
            try board.place(mark: player, on: coordinate)
        } catch {
            throw error
        }
        
        gameIsOver = true
        for x in 0..<3 {
            for y in 0..<3 {
                if board[(x, y)] == nil {
                    gameIsOver = false
                }
            }
        }
        setWinningPlayer()
        
        if gameIsOver {
            activePlayer = nil
        } else if (player == .x) {
            activePlayer = .o
        } else {
            activePlayer = .x
        }
    }
    
    mutating private func setWinningPlayer() {
        if game(board: board, isWonBy: .x) {
            winningPlayer = .x
            gameIsOver = true
        } else if game(board: board, isWonBy: .o) {
            winningPlayer = .o
            gameIsOver = true
        } else { winningPlayer = nil }
    }
    
    mutating func getWinningPlayer() -> GameBoard.Mark? {
        return winningPlayer
    }
    
    mutating func isGameOver() -> Bool {
        return gameIsOver
    }
    
    mutating func getCurrentPlayer() -> GameBoard.Mark? {
        return activePlayer
    }
    
    mutating func getLastMove() -> Coordinate {
        return lastMove
    }
}
