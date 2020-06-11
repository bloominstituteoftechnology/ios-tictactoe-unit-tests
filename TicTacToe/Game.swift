//
//  Game.swift
//  TicTacToe
//
//  Created by Cody Morley on 6/10/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

// THIS CONTROLLER WILL TAKE THE FUCTIONALITY OF RUNNING THE GAME OUT OF THE VCs
///TODO:   ! done  **in progress
///1. Give all properties correct values **
///2. fill functions
///3. test this controller
///4. call in the vcs


import Foundation

struct Game {
    //MARK: - Properties -
    private(set) var board: GameBoard = GameBoard()
    internal var activePlayer: GameBoard.Mark? = .x
    internal var gameIsOver: Bool = false
    internal var winningPlayer: GameBoard.Mark? = nil
    
    
    //MARK: - Actions -
    mutating internal func restart() {
        board = GameBoard()
        activePlayer = GameBoard.Mark.x
        gameIsOver = false
        winningPlayer = nil
    }
    
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        if !gameIsOver {
            guard let player = activePlayer else {
                return
            }
            
            do {
                try board.place(mark: player, on: coordinate)
                if game(board: board, isWonBy: player) {
                    winningPlayer = player
                    gameIsOver = true
                    NSLog("\(player.stringValue) WINS!")
                } else if board.isFull {
                    winningPlayer = nil
                    gameIsOver = true
                    NSLog("Game to the cat.")
                } else {
                    if activePlayer == .x {
                        activePlayer = .o
                    } else {
                        activePlayer = .x
                    }
                }
            } catch {
                NSLog("Illegal move")
            }
        }
    }
    
    
}
