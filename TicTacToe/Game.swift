//
//  Game.swift
//  TicTacToe
//
//  Created by Wyatt Harrell on 4/15/20.
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
        activePlayer = GameBoard.Mark.x
        gameIsOver = false
    }
    
    init()  {
        self.board = GameBoard()
        self.gameIsOver = false
        activePlayer = GameBoard.Mark.x
    }
    
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        if activePlayer == GameBoard.Mark.x {
            try! board.place(mark: .x, on: coordinate)
            gameIsOver = game(board: board, isWonBy: .x)
            if gameIsOver {
                activePlayer = nil
            }
        } else if activePlayer == GameBoard.Mark.o {
            try! board.place(mark: .o, on: coordinate)
            #warning("will need to change to !")
            gameIsOver = game(board: board, isWonBy: .x)
            if gameIsOver {
                activePlayer = nil
            }
        }
    }
}
