//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Bobby Keffury on 11/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {
    
    func testRestartGame() {
        var game = Game(board: GameBoard(), activePlayer: .x, gameIsOver: false, winningPlayer: nil)
        var board = game.board
        var player = game.activePlayer
        var status = game.gameIsOver
        var winner = game.winningPlayer
        
        /*
         x - -
         - - -
         - - -
         */
        
        try! board.place(mark: .x, on: (0,0))
        game.restart()
        XCTAssertTrue( board  ,player == .x, status == false, winner == false)
        
        // Set up scenarios where the game is in different states, then reset the game and make sure the board is empty, the active player is X, the winning player and gameIsOver should both be nil.
    }
    
    func testMakingMarks() {
        // Should be the same as the other method, except with using the Game file instead of GameViewController properties.
    }
    
    func testActivePlayer() {
        // Set up scenarios where the active player is tested. If new game, active player should be X. If X just made a mark, O should be active player and visa versa. If game is over, active player is nil.
    }
    
    func testGameIsOver() {
        // Set up scenarios where the game came to a finish (Win or Cats Game), also when game is not finished (Unfinished) and make sure the appropriate boolean is evident.
    }
    
    func testWinningPlayer() {
        // Set up scenarios where a player wins (Horizontal, Vertical, Diagonal) and make sure the right player wins. Also make sure that there is no winning player when appropriate (Cats game, Unfinished game)
    }
}
