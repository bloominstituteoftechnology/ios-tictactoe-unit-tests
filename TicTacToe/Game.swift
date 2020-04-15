//
//  Game.swift
//  TicTacToe
//
//  Created by Bradley Diroff on 4/15/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    
    private enum GameState {
        case active(GameBoard.Mark) // Active player
        case cat
        case won(GameBoard.Mark) // Winning player
    }
    
    private(set) var board: GameBoard

    internal var activePlayer: GameBoard.Mark?
    internal var gameIsOver: Bool = false
    internal var winningPlayer: GameBoard.Mark?
    
    private var gameState = GameState.active(.x) {
        didSet {
            
        }
    }
    
    init() {
        board = GameBoard()
    }

    mutating internal func restart() {
        board = GameBoard()
        gameState = .active(.x)
    }
    
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        
        try board.place(mark: .x, on: (coordinate.x, coordinate.y))
        
        /*
        guard case let GameState.active(player) = gameState else {
             NSLog("Game is over")
             return
         }
         
         do {
             try board.place(mark: player, on: coordinate)
             if game(board: board, isWonBy: player) {
                 gameState = .won(player)
             } else if board.isFull {
                 gameState = .cat
             } else {
                 let newPlayer = player == .x ? GameBoard.Mark.o : GameBoard.Mark.x
                 gameState = .active(newPlayer)
             }
         } catch {
             NSLog("Illegal move")
         }
 */
    }
}
