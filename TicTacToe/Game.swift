//
//  Game.swift
//  TicTacToe
//
//  Created by Isaac Lyons on 11/6/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

enum GameError: Error, Equatable {
    case noActivePlayer
}

struct Game {
    
    init() {
        board = GameBoard()
        activePlayer = .x
    }
    
    mutating internal func restart() {
        board = GameBoard()
        activePlayer = .x
        gameIsOver = false
        winningPlayer = nil
    }
    
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        guard let activePlayer = activePlayer else {
            throw GameError.noActivePlayer
        }
        
        try board.place(mark: activePlayer, on: coordinate)
        
        checkIfGameIsOver()
        
        if !gameIsOver {
            if activePlayer == .x {
                self.activePlayer = .o
            } else {
                self.activePlayer = .x
            }
        } else {
            self.activePlayer = nil
        }
    }
    
    mutating func checkIfGameIsOver() {
        // Check verticals
        for x in 0..<3 {
            var numMarks = 0
            guard let player: GameBoard.Mark = board[(x, 0)] else { continue }
            
            for y in 0..<3 {
                if board[(x, y)] == player {
                    numMarks += 1
                }
            }
            if numMarks == 3 {
                winningPlayer = player
                gameIsOver = true
                return
            }
        }
        
        // Check horizontals
        for y in 0..<3 {
            var numMarks = 0
            guard let player: GameBoard.Mark = board[(0, y)] else { continue }

            for x in 0..<3 {
                if board[(x, y)] == player {
                    numMarks += 1
                }
            }
            if numMarks == 3 {
                winningPlayer = player
                gameIsOver = true
                return
            }
        }
        
        // Check diagonals
        let ltr: [Coordinate] = [(0,0), (1, 1), (2,2)]
        
        if let player: GameBoard.Mark = board[ltr[0]] {
            var numMatches = 0
            for coord in ltr {
                if board[coord] == player {
                    numMatches += 1
                }
            }
            if numMatches == 3 {
                winningPlayer = player
                gameIsOver = true
                return
            }
        }
        
        let rtl: [Coordinate] = [(2,0), (1, 1), (0,2)]
        
        if let player: GameBoard.Mark = board[rtl[0]]{
            var numMatches = 0
            for coord in rtl {
                if board[coord] == player {
                    numMatches += 1
                }
            }
            if numMatches == 3 {
                winningPlayer = player
                gameIsOver = true
                return
            }
        }
        
        // Check for cat's game
        
        var over = true
        loop: for y in 0..<3 {
            for x in 0..<3 {
                if board[(x, y)] == nil {
                    over = false
                    break loop
                }
            }
        }
        
        if over { gameIsOver = over }
    }
    
    private(set) var board: GameBoard
    
    internal var activePlayer: GameBoard.Mark?
    
    internal var gameIsOver: Bool = false
    
    internal var winningPlayer: GameBoard.Mark?
}
