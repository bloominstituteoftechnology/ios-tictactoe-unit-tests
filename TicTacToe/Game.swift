//
//  Game.swift
//  TicTacToe
//
//  Created by Bhawnish Kumar on 5/13/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    
    private(set) var board: GameBoard

     internal var activePlayer: GameBoard.Mark?
     internal var gameIsOver: Bool
     internal var winningPlayer: GameBoard.Mark?

    mutating internal func restart() {
        board = GameBoard()
        activePlayer = .x
        gameIsOver = false
        winningPlayer = nil
        
    }
    
    mutating internal func makeMark(at coordinate: Coordinate) throws {
         guard let activePlayer = activePlayer,
            gameIsOver == false else {
                return
        }
        try board.place(mark: activePlayer, on: coordinate)
        
        if game(board: board, isWonBy: activePlayer) {
            gameIsOver = true
            self.activePlayer = nil
            winningPlayer = activePlayer
        } else if board.isFull {
            gameIsOver = true
            self.activePlayer = nil
        } else {
            self.activePlayer = activePlayer == .x ? .o : .x
        }
    }

 
}
