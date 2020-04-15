//
//  Game.swift
//  TicTacToe
//
//  Created by Lydia Zhang on 4/15/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
struct Game {

    mutating internal func restart() {
        board = GameBoard()
        gameIsOver = false
        winningPlayer = nil
        activePlayer = .x
    }
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        guard let player = activePlayer else {return}
        
        try! board.place(mark: player, on: coordinate)
        
        
        if game(board: board, isWonBy: player) {
            gameIsOver = true
            winningPlayer = player
            activePlayer = nil
        } else if board.isFull {
            gameIsOver = true
            winningPlayer = nil
            activePlayer = nil
        } else {
            gameIsOver = false
            
            if activePlayer == .x {
                activePlayer = .o
            } else {
                activePlayer = .x
            }
            
        }
    }

    private(set) var board: GameBoard = GameBoard()

    internal var activePlayer: GameBoard.Mark? = .x
    internal var gameIsOver: Bool = false
    internal var winningPlayer: GameBoard.Mark? = nil
}
