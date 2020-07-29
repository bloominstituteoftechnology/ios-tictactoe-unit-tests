//
//  Game.swift
//  TicTacToe
//
//  Created by Elizabeth Thomas on 7/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct Game {
    
    enum GameState {
        case active(GameBoard.Mark) // Active player
        case cat
        case won(GameBoard.Mark) // Winning player
    }

    
    // MARK: - Properties
    private(set) var board: GameBoard = GameBoard()

    var activePlayer: GameBoard.Mark? = .x
    var gameIsOver: Bool = false
    var winningPlayer: GameBoard.Mark? = nil
    
    var state: GameState {
        if let winningPlayer = winningPlayer {
            return .won(winningPlayer)
        } else if gameIsOver {
            return .cat
        } else {
            return .active(activePlayer!)
        }
    }
    
    // MARK: - Methods
    mutating internal func restart() {
        board = GameBoard()
        activePlayer = .x
        gameIsOver = false
        winningPlayer = nil
    }
    
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        guard let player = activePlayer else { return }
        
        try board.place(mark: player, on: coordinate)
        
        if game(board: board, isWonBy: player) {
            gameIsOver = true
            winningPlayer = player
        } else if board.isFull {
            gameIsOver = true
            winningPlayer = nil
        } else {
            if player == .x {
                self.activePlayer = .o
            } else {
                self.activePlayer = .x
            }
        }
        
    }
    
}
