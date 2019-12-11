//
//  Game.swift
//  TicTacToe
//
//  Created by morse on 12/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    
    // MARK: - Properties
    internal var activePlayer: GameBoard.Mark? = GameBoard.Mark.x
    internal var gameIsOver: Bool = false
    internal var winningPlayer: GameBoard.Mark? = nil
    private(set) var board: GameBoard = GameBoard()
    /*private */var gameState = GameState.active(.x) {
        didSet {
//            updateViews()
        }
    }
    
    enum GameState: Equatable {
        case active(GameBoard.Mark)
        case won(GameBoard.Mark)
        case cat
    }
    
    // MARK: - Methods
    
    mutating internal func restart() {
        board = GameBoard()
        // Not sure if these should be set by default or set in this function. It depends if a new instance of Game is created when restarting. If so, set them by default, otherwise, set them here
//        activePlayer = GameBoard.Mark.x
//        gameIsOver = false
//        winningPlayer = nil
    }
    
    mutating internal func makeMark(at coordinate: Coordinate) throws {
//        guard let activePlayer = activePlayer else { return }
        
        guard case let GameState.active(player) = gameState else {
            NSLog("Game is over")
            return
        }
        
        do {
            try board.place(mark: player, on: coordinate)
            if game(board: board, isWonBy: player) {
                gameState = .won(player)
                winningPlayer = player
                print("\(winningPlayer) won!")
            } else if board.isFull {
                gameState = .cat
                gameIsOver = true
            } else {
                let activePlayer = player == .x ? GameBoard.Mark.o : GameBoard.Mark.x
                self.activePlayer = activePlayer
                gameState = .active(activePlayer)
            }
        } catch {
            NSLog("Illegal move")
            throw error
        }
    }
}
