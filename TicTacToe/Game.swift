//
//  Game.swift
//  TicTacToe
//
//  Created by Jonathan Ferrer on 6/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

struct Game {

    mutating func restart() {
        self.board = GameBoard()
        activePlayer = GameBoard.Mark.x
        gameIsOver = false
    }

    mutating func makeMark(at coordinate: Coordinate) throws {
        guard let player = activePlayer else { return }

        try self.board.place(mark: player, on: coordinate)
        if game(board: board, isWonBy: player) {
            gameIsOver = true
            winningPlayer = player
        } else if board.isFull {
            gameIsOver = true
            winningPlayer = nil
        } else {
            gameIsOver = false
            if activePlayer == .x {
                activePlayer = .o
            } else {
                activePlayer = .x
            }
        }
    }

    private(set) var board = GameBoard()

    var activePlayer: GameBoard.Mark? = .x
    var gameIsOver: Bool = false
    var winningPlayer: GameBoard.Mark? = nil
}
