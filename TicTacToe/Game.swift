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
    internal var lastMoves: [Coordinate] = []
    internal var movesCount: Int = 0

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
            lastMoves.append(coordinate)
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
        return lastMoves[lastMoves.count-1]
    }
    
    mutating func getLastMovesCount() -> Int {
        return lastMoves.count
    }
    
    mutating func undoLastMove() {
        if lastMoves.count > 0 {
            if let player = activePlayer, player == .x {
                activePlayer = .o
            } else if let player = activePlayer, player == .o {
                activePlayer = .x
            } else if let winner = winningPlayer, winner == .x {
                activePlayer = .o
            } else if let winner = winningPlayer, winner == .o {
                activePlayer = .x
            } else {
                activePlayer = .x
            }
            board.remove(on: lastMoves[lastMoves.count-1])
            lastMoves.remove(at: lastMoves.count-1)
        }
    }
}
