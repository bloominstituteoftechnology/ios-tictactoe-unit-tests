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

        
    func testRestartIncompleteGame() {
        // Set up scenarios where the game is in different states, then reset the game and make sure the board is empty, the active player is X, the winning player and gameIsOver should both be nil.
        
        var game = Game(board: GameBoard(), activePlayer: .x, gameIsOver: false, winningPlayer: nil)
        var board = game.board
        var activePlayer = game.activePlayer
        let gameOver = game.gameIsOver
        let winner = game.winningPlayer
        
        // Incomplete Game
        /*
         x - -
         - - -
         - - -
         */
        
        try! game.makeMark(at: (0,0))
        game.restart()
        XCTAssertTrue(board.isEmpty)
        XCTAssertTrue(activePlayer == .x)
        XCTAssertTrue(gameOver == false)
        XCTAssertTrue(winner == nil)
    }
    
    func testRestartDiagonalGame() {
        
        var game = Game(board: GameBoard(), activePlayer: .x, gameIsOver: false, winningPlayer: nil)
        var board = game.board
        var activePlayer = game.activePlayer
        var gameOver = game.gameIsOver
        var winner = game.winningPlayer
        
        // Diagonal Winner
        /*
         x - o
         - x -
         o - x
         */
        
        try! game.makeMark(at: (0,0))
        try! game.makeMark(at: (1,1))
        try! game.makeMark(at: (2,2))
        try! game.makeMark(at: (2,0))
        try! game.makeMark(at: (0,2))
        game.restart()
        XCTAssertTrue(board.isEmpty)
        XCTAssertTrue(activePlayer == .x)
        XCTAssertTrue(gameOver == false)
        XCTAssertTrue(winner == nil)
        
    }
    
    func testRestartVerticalGame() {
        
        var game = Game(board: GameBoard(), activePlayer: .x, gameIsOver: false, winningPlayer: nil)
        var board = game.board
        var activePlayer = game.activePlayer
        var gameOver = game.gameIsOver
        var winner = game.winningPlayer
        
        // Vertical Winner
        /*
         x o -
         x o -
         x - -
         */
        
        try! game.makeMark(at: (0,0))
        try! game.makeMark(at: (1,0))
        try! game.makeMark(at: (0,1))
        try! game.makeMark(at: (1,1))
        try! game.makeMark(at: (0,2))
        game.restart()
        XCTAssertTrue(board.isEmpty)
        XCTAssertTrue(activePlayer == .x)
        XCTAssertTrue(gameOver == false)
        XCTAssertTrue(winner == nil)
    }
    
    func testRestartHorizontalGame() {
        
        var game = Game(board: GameBoard(), activePlayer: .x, gameIsOver: false, winningPlayer: nil)
        var board = game.board
        var activePlayer = game.activePlayer
        var gameOver = game.gameIsOver
        var winner = game.winningPlayer
        
        // Horizontal Winner
        /*
         - o -
         x x x
         o - -
         */
        try! game.makeMark(at: (1,0))
        try! game.makeMark(at: (0,1))
        try! game.makeMark(at: (0,2))
        try! game.makeMark(at: (1,1))
        try! game.makeMark(at: (2,1))
        game.restart()
        XCTAssertTrue(board.isEmpty)
        XCTAssertTrue(activePlayer == .x)
        XCTAssertTrue(gameOver == false)
        XCTAssertTrue(winner == nil)
    }
    
    func testRestartCatsGame() {
        
        var game = Game(board: GameBoard(), activePlayer: .x, gameIsOver: false, winningPlayer: nil)
        var board = game.board
        var activePlayer = game.activePlayer
        var gameOver = game.gameIsOver
        var winner = game.winningPlayer
        
        // Cats Game
        /*
         x o o
         o x x
         o x o
         */
        try! game.makeMark(at: (0,0))
        try! game.makeMark(at: (1,1))
        try! game.makeMark(at: (2,1))
        try! game.makeMark(at: (1,2))
        try! game.makeMark(at: (1,0))
        try! game.makeMark(at: (2,0))
        try! game.makeMark(at: (0,1))
        try! game.makeMark(at: (0,2))
        try! game.makeMark(at: (2,2))
        game.restart()
        XCTAssertTrue(board.isEmpty)
        XCTAssertTrue(activePlayer == .x)
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
        // Set up scenarios where the active player is tested. If new game, active player should be X. If X just made a mark, O should be active player and visa versa.
        var game = Game(board: GameBoard(), activePlayer: .x, gameIsOver: false, winningPlayer: nil)
        var board = game.board
        let activePlayer = game.activePlayer
        
        // New Game
        XCTAssertTrue(activePlayer == .x)
        
        // O is the active player
        /*
         x - -
         - - -
         - - -
         */
        try! game.makeMark(at: (0,0))
        XCTAssertTrue(activePlayer == .o)
        
        
        // X is the active player
        /*
         x - -
         - - -
         - - o
         */
        try! game.makeMark(at: (2,2))
        XCTAssertTrue(activePlayer == .x)
    }
    
    func testDiagonalGameIsOver() {
        // Set up scenarios where the game came to a finish (Win or Cats Game), also when game is not finished (Unfinished) and make sure the appropriate boolean is evident.
        var game = Game(board: GameBoard(), activePlayer: .x, gameIsOver: false, winningPlayer: nil)
        var board = game.board
        let gameOver = game.gameIsOver
        
        // Diagonal Winner
        /*
         x - o
         - x -
         o - x
         */
        
        try! game.makeMark(at: (0,0))
        try! game.makeMark(at: (1,1))
        try! game.makeMark(at: (2,2))
        try! game.makeMark(at: (2,0))
        try! game.makeMark(at: (0,2))
        XCTAssertTrue(gameOver == true)
    }
    
    func testVerticalGameIsOVer() {
        
        var game = Game(board: GameBoard(), activePlayer: .x, gameIsOver: false, winningPlayer: nil)
        var board = game.board
        let gameOver = game.gameIsOver
        
        // Vartical Winner
        /*
         x o -
         x o -
         - o -
         */
        try! game.makeMark(at: (1,0))
        try! game.makeMark(at: (0,0))
        try! game.makeMark(at: (1,1))
        try! game.makeMark(at: (0,1))
        try! game.makeMark(at: (1,2))
        XCTAssertTrue(gameOver == true)
    }
    
    func testHorizontalGameIsOver() {
        
        var game = Game(board: GameBoard(), activePlayer: .x, gameIsOver: false, winningPlayer: nil)
        var board = game.board
        let gameOver = game.gameIsOver
        
        // Horizontal Winner
        /*
         - o -
         x x x
         o - -
         */
        try! game.makeMark(at: (1,0))
        try! game.makeMark(at: (0,1))
        try! game.makeMark(at: (0,2))
        try! game.makeMark(at: (1,1))
        try! game.makeMark(at: (2,1))
        XCTAssertTrue(gameOver == true)
    }
    
    func testIncompleteGameIsOver() {
        
        var game = Game(board: GameBoard(), activePlayer: .x, gameIsOver: false, winningPlayer: nil)
        var board = game.board
        let gameOver = game.gameIsOver
        
        // Incomplete Game
        /*
         x - o
         - o -
         - x -
         */
        try! game.makeMark(at: (0,0))
        try! game.makeMark(at: (1,1))
        try! game.makeMark(at: (0,2))
        try! game.makeMark(at: (1,2))
        XCTAssertTrue(gameOver == false)
    }
    
    func testCatsGameIsOver() {
        
        var game = Game(board: GameBoard(), activePlayer: .x, gameIsOver: false, winningPlayer: nil)
        var board = game.board
        let gameOver = game.gameIsOver
        
        // Cats Game
        /*
         x o x
         o o x
         x x o
         */
        try! game.makeMark(at: (0,0))
        try! game.makeMark(at: (2,0))
        try! game.makeMark(at: (2,1))
        try! game.makeMark(at: (0,2))
        try! game.makeMark(at: (1,2))
        try! game.makeMark(at: (1,0))
        try! game.makeMark(at: (0,1))
        try! game.makeMark(at: (1,1))
        try! game.makeMark(at: (2,2))
        XCTAssertTrue(gameOver == false)
    }
    
    func testDiagonalWinningPlayer() {
        // Set up scenarios where a player wins (Horizontal, Vertical, Diagonal) and make sure the right player wins. Also make sure that there is no winning player when appropriate (Cats game, Unfinished game)
        var game = Game(board: GameBoard(), activePlayer: .x, gameIsOver: false, winningPlayer: nil)
        var board = game.board
        let winner = game.winningPlayer
        
        // Diagonal Winner
        /*
         x - o
         - x -
         o - x
         */
        
        try! game.makeMark(at: (0,0))
        try! game.makeMark(at: (1,1))
        try! game.makeMark(at: (2,2))
        try! game.makeMark(at: (2,0))
        try! game.makeMark(at: (0,2))
        XCTAssertTrue(winner == .x)
    }
    
    func testVerticalWinningPlayer() {
        
        var game = Game(board: GameBoard(), activePlayer: .x, gameIsOver: false, winningPlayer: nil)
        var board = game.board
        let winner = game.winningPlayer
        
        // Vartical Winner
        /*
         x o -
         x o -
         - o -
         */
        try! game.makeMark(at: (1,0))
        try! game.makeMark(at: (0,0))
        try! game.makeMark(at: (1,1))
        try! game.makeMark(at: (0,1))
        try! game.makeMark(at: (1,2))
        XCTAssertTrue(winner == .o)
    }
    
    func testHorizontalWinningPlayer() {
        
        var game = Game(board: GameBoard(), activePlayer: .x, gameIsOver: false, winningPlayer: nil)
        var board = game.board
        let winner = game.winningPlayer
        
        // Horizontal Winner
        /*
         - o -
         x x x
         o - -
         */
        try! game.makeMark(at: (1,0))
        try! game.makeMark(at: (0,1))
        try! game.makeMark(at: (0,2))
        try! game.makeMark(at: (1,1))
        try! game.makeMark(at: (2,1))
        XCTAssertTrue(winner == .x)
    }
    
    func testIncompleteWinningPlayer() {
        
        var game = Game(board: GameBoard(), activePlayer: .x, gameIsOver: false, winningPlayer: nil)
        var board = game.board
        let winner = game.winningPlayer
        
        // Incomplete Game
        /*
         x - o
         - o -
         - x -
         */
        try! game.makeMark(at: (0,0))
        try! game.makeMark(at: (1,1))
        try! game.makeMark(at: (0,2))
        try! game.makeMark(at: (1,2))
        XCTAssertTrue(winner == nil)
    }
    
    func testCatsWinningPlayer() {
        
        var game = Game(board: GameBoard(), activePlayer: .x, gameIsOver: false, winningPlayer: nil)
        var board = game.board
        let winner = game.winningPlayer
        
        // Cats Game
        /*
         x o x
         o o x
         x x o
         */
        try! game.makeMark(at: (0,0))
        try! game.makeMark(at: (2,0))
        try! game.makeMark(at: (2,1))
        try! game.makeMark(at: (0,2))
        try! game.makeMark(at: (1,2))
        try! game.makeMark(at: (1,0))
        try! game.makeMark(at: (1,1))
        try! game.makeMark(at: (0,1))
        try! game.makeMark(at: (2,2))
        XCTAssertTrue(winner == nil)
    }

}
