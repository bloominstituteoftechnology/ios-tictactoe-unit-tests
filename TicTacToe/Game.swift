//
//  Game.swift
//  TicTacToe
//
//  Created by Bobby Keffury on 11/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct Game {

    mutating internal func restart() {
        /*
        Clears the board and sets the active player to X.
        */
        self.board = GameBoard()
        activePlayer = .x
    }
    
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        /*
         Should make a mark at a specific spot with a label for the active player and hold that until the game is restarted.
         Should update the state of the game and the active player.
         
         If X made the last mark, active player is O. If O made the last mark, active player is X.
        */
        
        if gameIsOver == true {
            // Add alert to tell the user that a move cannot be made.
        } else {
            if activePlayer == .x {
                try! self.board.place(mark: .x, on: coordinate)
                activePlayer = .o
                // Doesnt cover situations where the board is full and it wasnt a cats game.
                if gameIsOver == true && board.isFull {
                    winningPlayer = nil
                } else if gameIsOver == true {
                    winningPlayer = .x
                }
            } else if activePlayer == .o {
                try! self.board.place(mark: .o, on: coordinate)
                activePlayer = .x
                // Doesnt cover situations where the board is full and it wasnt a cats game.
                if gameIsOver == true && board.isFull {
                    winningPlayer = nil
                } else if gameIsOver == true {
                    winningPlayer = .o
                }
            }
        }
    }

    private(set) var board: GameBoard
        /*
        This is the specific board that the Game struct will change as the game progresses with marks, restarts, etc.
        */

    internal var activePlayer: GameBoard.Mark?

    
    internal var gameIsOver: Bool {
        
        /*
        if game is won, or is a cats game, this is True. If game is still running, this is False.
        */
        
        for x in 0..<3 {
            var numMarks = 0
            for y in 0..<3 {
                if board[(x, y)] == activePlayer {
                    numMarks += 1
                }
            }
            if numMarks == 3 {
                return true
            }
        }
        for y in 0..<3 {
            var numMarks = 0
            for x in 0..<3 {
                if board[(x, y)] == activePlayer {
                    numMarks += 1
                }
            }
            if numMarks == 3 {
                return true
            }
        }
        return false
    }

    
    internal var winningPlayer: GameBoard.Mark?
        /*
        If game is over and it isnt a cats game, winning player is whoever has 3 marks in a row. (Vert, Horizontal, Diagonal.) If the game ended in cats game, or the game is still running, the winning player is nil.
        */
        
     
}
