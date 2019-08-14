//
//  Game.swift
//  TicTacToe
//
//  Created by Dongwoo Pae on 8/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct Game { //using this to refactor GameViewController that has long functions which might cause conflicts being run to be shortened or efficient way
    
    
    init() {
        self.board = GameBoard()  //  gvc uses board so use game's board instead
        self.gameIsOver = false
        self.winningPlayer = nil
        self.activePlayer = .x
    }
    
    mutating internal func restart() {
        board = GameBoard()
        activePlayer = .x
        gameIsOver = false
        winningPlayer = nil
    }
    
    mutating internal func makeMark(coordinate: Coordinate) throws {
        
        if gameIsOver {
            print("Game is over")
            return
        }
        
        do {
            try board.place(mark: activePlayer!, on: coordinate)
            if game(board: board, isWonBy: activePlayer!) {
                winningPlayer = activePlayer
                gameIsOver = true
                print("Game is over and the game is won by \(winningPlayer!)")
            } else if board.isFull {
                gameIsOver = true  //cat's game
                print("Game is over and the board is full")
            } else {
                let newPlayer = activePlayer == .x ? GameBoard.Mark.o : GameBoard.Mark.x
                activePlayer = newPlayer  //change active player to o from x
            }
        } catch {
            NSLog("Illegal move")
        }
    }

    private(set) var board: GameBoard
    
    internal var activePlayer: GameBoard.Mark?  //.x or .o depending on player's turn. nil if the game is over
    internal var gameIsOver: Bool // true (gameOver), false (game is still playing)
    internal var winningPlayer: GameBoard.Mark? // either .x or .o. nil if the game is still running or its a cat's game
}
