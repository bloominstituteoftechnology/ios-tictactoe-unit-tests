//
//  Game.swift
//  TicTacToe
//
//  Created by Jerry haaser on 12/11/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    
    private enum GameState {
        case active(GameBoard.Mark) // Active player
        case cat
        case won(GameBoard.Mark) // Winning player
    }
    
    private(set) var board: GameBoard = GameBoard()
    
    internal var activePlayer: GameBoard.Mark = .x
    internal var gameIsOver: Bool = false
    internal var winningPlayer: GameBoard.Mark? = nil
    private var gameState: GameState = .active(.x)
      
//            switch gameState {
//                case let .active:
//
//                print("")
//
//            case .cat:
//                gameIsOver = true
//
//            case let .won:
//                gameIsOver = true
//
//            }

    
    mutating internal func restart() {
        board = GameBoard()
        gameState = .active(.x)
    }
    
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        
    }


    
}
