//
//  Game.swift
//  TicTacToe
//
//  Created by Bobby Keffury on 11/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

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
         */
        
    }

    private(set) var board: GameBoard
        /*
        This is the specific board that the Game struct will change as the game progresses with marks, restarts, etc.
        */

    internal var activePlayer: GameBoard.Mark?
        /*
        If new game, active player is X. If X made the last mark, active player is O. If O made the last mark, active player is X.
        */
    
    internal var gameIsOver: Bool
        /*
        if game is won, or is a cats game, this is True. If game is still running, this is False.
        */
    
    internal var winningPlayer: GameBoard.Mark?
        /*
        If game is over and it isnt a cats game, winning player is whoever has 3 marks in a row. (Vert, Horizontal, Diagonal.) If the game ended in cats game, or the game is still running, the winning player is nil.
        */
        
     
}
