//
//  Game.swift
//  TicTacToe
//
//  Created by Ilgar Ilyasov on 10/17/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    
    private(set) var board = GameBoard()
    
    internal var activePlayer: GameBoard.Mark? = .x
    internal var winnigPlayer: GameBoard.Mark? = nil
    internal var gameIsOver: Bool = false
    
    mutating internal func restart() {
        board = GameBoard()
        gameIsOver = false
        winnigPlayer = nil
        activePlayer = .x
    }
    
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        guard let currentPlayer = activePlayer else { return }
        
        try! board.place(mark: currentPlayer, on: coordinate)
        
        if game(board: board, isWonBy: currentPlayer) {
            winnigPlayer = currentPlayer
            gameOver()
        } else if board.isFull {
            gameOver()
            winnigPlayer = nil
        } else {
            updatePlayer()
        }
    }
    
    mutating func gameOver() {
        gameIsOver = true
        activePlayer = nil
    }
    
    mutating func updatePlayer() {
        if activePlayer == .x {
            activePlayer = .o
        } else {
            activePlayer = .x
        }
    }
}
