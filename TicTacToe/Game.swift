//
//  Game.swift
//  TicTacToe
//
//  Created by De MicheliStefano on 12.09.18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    
    init() {
        self.board = GameBoard()
        self.activePlayer = .x
        self.gameIsOver = false
    }
    
    // MARK: - Properties
    
    var activePlayer: GameBoard.Mark?
    var gameIsOver: Bool
    var winningPlayer: GameBoard.Mark?
    var previousMove: Coordinate?
    private(set) var board : GameBoard
    
    // MARK: - Methods
    
    mutating func restart() {
        board = GameBoard()
        activePlayer = .x
        gameIsOver = false
    }
    
    mutating func undo() {
        guard let previousMove = previousMove else { NSLog("No previous move available"); return }
        board.remove(on: previousMove)
        activePlayer = activePlayer == .x ? GameBoard.Mark.o : GameBoard.Mark.x
    }
    
    mutating func makeMark(at coordinate: Coordinate) throws {
        guard let player = activePlayer else {
            NSLog("Game is over")
            return
        }
        
        do {
            try board.place(mark: player, on: coordinate)
            if game(board: board, isWonBy: player) {
                winningPlayer = player
                gameIsOver = true
                activePlayer = nil
            } else if board.isFull {
                gameIsOver = true
                activePlayer = nil
            } else {
                let newPlayer = player == .x ? GameBoard.Mark.o : GameBoard.Mark.x
                activePlayer = newPlayer
            }
        } catch {
            NSLog("Illegal move")
        }
        previousMove = coordinate
    }
    
}
