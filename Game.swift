//
//  Game.swift
//  TicTacToe
//
// Created by Nick Nguyen on 3/18/20.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    
    // MARK: - Properties:
    

    private(set) var board = GameBoard()
    internal var activePlayer: GameBoard.Mark? = .x
    internal var gameIsOver: Bool = false
    internal var winningPlayer: GameBoard.Mark? = nil
    
    
    //MARK:- Methods:
    
    mutating internal func restart() {
    //Fresh start, x go first.
        board = GameBoard()
        gameIsOver = false
        winningPlayer = nil
        activePlayer = .x
    }
    
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        
        guard let currentPlayer = activePlayer else { return }

        try board.place(mark: currentPlayer, on: coordinate)

        if game(board: board, isWonBy: currentPlayer) {
            //Game has wining player
            gameIsOver = true
            winningPlayer = currentPlayer
            activePlayer = nil
            
        } else if board.isFull {
            // Cat game
            
            gameIsOver = true
            winningPlayer = nil
            activePlayer = nil
        } else {
            // Change turn
            activePlayer = activePlayer == .x ? .o : .x
        }
    }
}

