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
        // Set up scenarios where the game is in different states, then reset the game and make sure the board is empty, the active player is X, the winning player and gameIsOver should both be nil.
        
        var game = Game(board: GameBoard(), activePlayer: .x, gameIsOver: false, winningPlayer: nil)
        var board = game.board
        var player = game.activePlayer
        var gameOver = game.gameIsOver
        var winner = game.winningPlayer
        
        // Incomplete Game
        /*
         x - -
         - - -
         - - -
         */
        
        try! board.place(mark: .x, on: (0,0))
        game.restart()
        XCTAssertTrue(board.isEmpty)
        XCTAssertTrue(player == .x)
        XCTAssertTrue(gameOver == false)
        XCTAssertTrue(winner == nil)
        
        // Diagonal Winner
        /*
        x - o
        - x -
        o - x
        */
        
        try! board.place(mark: .x, on: (0,0))
        try! board.place(mark: .x, on: (1,1))
        try! board.place(mark: .x, on: (2,2))
        try! board.place(mark: .o, on: (2,0))
        try! board.place(mark: .o, on: (0,2))
        player = .o
        gameOver = true
        winner = .x
        game.restart()
        XCTAssertTrue(board.isEmpty)
        XCTAssertTrue(player == .x)
        XCTAssertTrue(gameOver == false)
        XCTAssertTrue(winner == nil)
        
        
        // Vertical Winner
        /*
        x o -
        x o -
        x - -
        */
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .x, on: (0, 1))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (0, 2))
        player = .o
        gameOver = true
        winner = .x
        game.restart()
        XCTAssertTrue(board.isEmpty)
        XCTAssertTrue(player == .x)
        XCTAssertTrue(gameOver == false)
        XCTAssertTrue(winner == nil)
        
        
        // Horizontal Winner
        /*
        - o -
        x x x
        o - -
        */
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .x, on: (0, 1))
        try! board.place(mark: .o, on: (0, 2))
        try! board.place(mark: .x, on: (1, 1))
        try! board.place(mark: .x, on: (2, 1))
        player = .o
        gameOver = true
        winner = .x
        game.restart()
        XCTAssertTrue(board.isEmpty)
        XCTAssertTrue(player == .x)
        XCTAssertTrue(gameOver == false)
        XCTAssertTrue(winner == nil)
        
        
        // Cats Game
        /*
        x o o
        o x x
        o x o
        */
        try! board.place(mark: .x, on: (0,0))
        try! board.place(mark: .x, on: (1,1))
        try! board.place(mark: .x, on: (2,1))
        try! board.place(mark: .x, on: (1,2))
        try! board.place(mark: .o, on: (1,0))
        try! board.place(mark: .o, on: (2,0))
        try! board.place(mark: .o, on: (0,1))
        try! board.place(mark: .o, on: (0,2))
        try! board.place(mark: .o, on: (2,2))
        player = .x
        gameOver = true
        winner = nil
        game.restart()
        XCTAssertTrue(board.isEmpty)
        XCTAssertTrue(player == .x)
        XCTAssertTrue(gameOver == false)
        XCTAssertTrue(winner == nil)
    }
    
    
    func testMakingMarks() {
        // Should be the same as the other method, except with using the Game file instead of GameViewController properties.
        let game = Game(board: GameBoard(), activePlayer: .x, gameIsOver: false, winningPlayer: nil)
        var board = game.board
        
        XCTAssertNoThrow(try board.place(mark: .o, on: (0, 0)))
        XCTAssertEqual(board[(0, 0)], .o)
        XCTAssertNoThrow(try board.place(mark: .x, on: (2, 2)))
        XCTAssertEqual(board[(2, 2)], .x)
        for x in 0..<3 {
            for y in 0..<3 {
                if x == 0 && y == 0 { continue }
                if x == 2 && y == 2 { continue }
                XCTAssertNil(board[(x, y)])
            }
        }
        
        // Make sure you can't change an already marked square
        XCTAssertThrowsError(try board.place(mark: .x, on: (0, 0))) { (error) in
            XCTAssertEqual(error as? GameBoardError, GameBoardError.invalidSquare)
        }
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
