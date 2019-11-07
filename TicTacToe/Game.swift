//
//  Game.swift
//  TicTacToe
//
//  Created by Jesse Ruiz on 11/6/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

private enum GameState {
    case active(GameBoard.Mark) // Active player
    case cat
    case won(GameBoard.Mark) // Winning player
}

struct Game {
    
    // MARK: - Methods
    mutating internal func restart() {
        board = GameBoard()
        gameIsOver = false
        winningPlayer = nil
        activePlayer = .x
    }
    
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        guard let playerX = activePlayer else { return }
        
        try! board.place(mark: playerX, on: coordinate)
        if game(board: board, isWonBy: playerX) {
            gameState = .won(playerX)
        } else if board.isFull {
            gameState = .cat
        } else {
            let newPlayer = playerX == .x ? GameBoard.Mark.o : GameBoard.Mark.x
            gameState = .active(newPlayer)
        }
    }
    
    // MARK: - Properties
    private(set) var board: GameBoard
    internal var activePlayer: GameBoard.Mark?
    internal var gameIsOver: Bool
    internal var winningPlayer: GameBoard.Mark?
    private var gameState: GameState
    
    init() {
        self.board = GameBoard()
        self.gameIsOver = false
        self.gameState = .active(.x)
    }
}
