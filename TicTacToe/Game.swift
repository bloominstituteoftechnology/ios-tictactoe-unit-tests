//
//  Game.swift
//  TicTacToe
//
//  Created by Kenneth Jones on 9/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    
    enum GameState: Equatable {
        case active(GameBoard.Mark)
        case cat
        case won(GameBoard.Mark)
    }
    
    var gameState = GameState.active(.x)
    
    private(set) var board: GameBoard = GameBoard()
    
    internal var activePlayer: GameBoard.Mark?
    internal var gameIsOver: Bool = false
    internal var winningPlayer: GameBoard.Mark?
    
    var latestSpot: Coordinate?
    
    mutating internal func restart() {
        board = GameBoard()
        gameState = .active(.x)
        activePlayer = .x
        gameIsOver = false
    }
    
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        guard let player = activePlayer else { return }
        
        try board.place(mark: player, on: coordinate)
        if game(board: board, isWonBy: player) {
            gameState = .won(player)
            gameIsOver = true
            winningPlayer = player
        } else if board.isFull {
            gameState = .cat
            gameIsOver = true
        } else {
            let newPlayer = player == .x ? GameBoard.Mark.o : GameBoard.Mark.x
            gameState = .active(newPlayer)
            activePlayer = newPlayer
            latestSpot = coordinate
        }
    }
    
    mutating func undo() {
        guard let spot = latestSpot, let mark = activePlayer else { return }
        
        do {
            try board.undo(mark: mark, on: spot)
        } catch {
            NSLog("There was an error you know what I'm sayin?")
        }
        
        let newPlayer = mark == .x ? GameBoard.Mark.o : GameBoard.Mark.x
        gameState = .active(newPlayer)
        activePlayer = newPlayer
    }
    
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
