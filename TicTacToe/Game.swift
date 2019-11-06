//
//  Game.swift
//  TicTacToe
//
//  Created by Kat Milton on 8/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
struct Game {
    private (set) var board: GameBoard
    var gameIsOver: Bool
    var winningPlayer: GameBoard.Mark?
    var activePlayer: GameBoard.Mark?
    
    init() {
        self.board = GameBoard()
        self.gameIsOver = false
        self.winningPlayer = nil
        self.activePlayer = .x
    }
    
    mutating internal func restart() {
        self.board = GameBoard()
        self.gameIsOver = false
        self.winningPlayer = nil
        self.activePlayer = .x
    }
    
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        guard let player = self.activePlayer else { return }
        
        try self.board.place(mark: player, on: coordinate)
        
        if game(board: self.board, isWonBy: player) {
            self.gameIsOver = true
            self.winningPlayer = player
            self.activePlayer = nil
        } else if self.board.isFull {
            self.gameIsOver = true
            self.winningPlayer = nil
            self.activePlayer = nil
        } else {
            self.gameIsOver = false
            if self.activePlayer == .x {
                self.activePlayer = .o
            } else {
                self.activePlayer = .x
            }
        }
    }
}
