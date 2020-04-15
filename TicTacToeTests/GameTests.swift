//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by David Wright on 4/14/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {

    // Tests for 'makeMark(at:)' method
    
    func testMakingMarks() {
        var game = Game()
        
        XCTAssertNoThrow(try! game.makeMark(at: (0, 0)))
        XCTAssertNoThrow(try! game.makeMark(at: (2, 2)))
        XCTAssertNoThrow(try! game.makeMark(at: (2, 1)))
        XCTAssertNoThrow(try! game.makeMark(at: (1, 0)))
        
        for x in 0..<3 {
            for y in 0..<3 {
                if x == 0 && y == 0 { XCTAssertNotNil(game.board[(x, y)]) ; continue }
                if x == 2 && y == 2 { XCTAssertNotNil(game.board[(x, y)]) ; continue }
                if x == 2 && y == 1 { XCTAssertNotNil(game.board[(x, y)]) ; continue }
                if x == 1 && y == 0 { XCTAssertNotNil(game.board[(x, y)]) ; continue }
                XCTAssertNil(game.board[(x, y)])
            }
        }
        
        // Make sure you can't change an already marked square
        XCTAssertThrowsError(try game.makeMark(at: (0, 0))) { (error) in
            XCTAssertEqual(error as? GameBoardError, GameBoardError.invalidSquare)
        }
    }
    
    // Tests for 'activePlayer' property
    
    func testActivePlayer() {
        var game = Game()
        
        /*
        x o -
        o - x
        - x o
        */
        XCTAssertEqual(game.activePlayer, .x)
        try! game.makeMark(at: (1, 0))
        XCTAssertEqual(game.activePlayer, .o)
        try! game.makeMark(at: (0, 0))
        XCTAssertEqual(game.activePlayer, .x)
        try! game.makeMark(at: (1, 1))
        XCTAssertEqual(game.activePlayer, .o)
        try! game.makeMark(at: (0, 1))
        XCTAssertEqual(game.activePlayer, .x)
        try! game.makeMark(at: (1, 2))
        
        // Condition: 'X' wins - the game is over.
        XCTAssertNil(game.activePlayer)
        
        // Condition: 'O' wins - the game is over.
        game = gameEndingInAWin(winningMark: .o)
        XCTAssertNil(game.activePlayer)
        
        // Condition: It's a tie - the game is over.
        game = gameEndingInATie()
        XCTAssertNil(game.activePlayer)
    }
    
    // Tests for 'gameIsOver' property
    
    func testGameIsOver() {
        var game = Game()
        
        XCTAssertFalse(game.gameIsOver)
        try! game.makeMark(at: (1, 0))
        XCTAssertFalse(game.gameIsOver)
        try! game.makeMark(at: (0, 0))
        XCTAssertFalse(game.gameIsOver)
        try! game.makeMark(at: (1, 1))
        XCTAssertFalse(game.gameIsOver)
        try! game.makeMark(at: (0, 1))
        XCTAssertFalse(game.gameIsOver)
        try! game.makeMark(at: (1, 2))
        
        // Condition: 'X' wins - the game is over.
        XCTAssertTrue(game.gameIsOver)
        
        // Condition: 'O' wins - the game is over.
        game = gameEndingInAWin(winningMark: .o)
        XCTAssertTrue(game.gameIsOver)
        
        // Condition: It's a tie - the game is over.
        game = gameEndingInATie()
        XCTAssertTrue(game.gameIsOver)
    }
    
    // Tests for 'winningPlayer' property
    
    func testWinningPlayer() {
        var game = Game()
        
        XCTAssertNil(game.winningPlayer)
        try! game.makeMark(at: (1, 0))
        XCTAssertNil(game.winningPlayer)
        try! game.makeMark(at: (0, 0))
        XCTAssertNil(game.winningPlayer)
        try! game.makeMark(at: (1, 1))
        XCTAssertNil(game.winningPlayer)
        try! game.makeMark(at: (0, 1))
        XCTAssertNil(game.winningPlayer)
        try! game.makeMark(at: (1, 2))
        
        // Condition: 'X' wins - the game is over.
        XCTAssertEqual(game.winningPlayer, GameBoard.Mark.x)
        
        // Condition: 'O' wins - the game is over.
        game = gameEndingInAWin(winningMark: .o)
        XCTAssertEqual(game.winningPlayer, GameBoard.Mark.o)
        
        // Condition: It's a tie - the game is over.
        game = gameEndingInATie()
        XCTAssertNil(game.winningPlayer)
    }
    
    // Tests for 'restart()' method
    
    func testRestartingGame() {
        var game = Game()
        
        try! game.makeMark(at: (0, 0))
        try! game.makeMark(at: (2, 2))
        try! game.makeMark(at: (2, 1))
        try! game.makeMark(at: (1, 0))
        
        // Condition: Incomplete game
        game.restart()
        assertCorrectStartingState(for: game)

        // Condition: 'X' wins - the game is over.
        game = gameEndingInAWin(winningMark: .x)
        game.restart()
        assertCorrectStartingState(for: game)
        
        // Condition: 'O' wins - the game is over.
        game = gameEndingInAWin(winningMark: .o)
        game.restart()
        assertCorrectStartingState(for: game)
        
        // Condition: It's a tie - the game is over.
        game = gameEndingInATie()
        game.restart()
        assertCorrectStartingState(for: game)
    }
    
    // MARK: - Helper Functions
    
    func assertCorrectStartingState(for game: Game) {
        XCTAssertEqual(game.activePlayer, GameBoard.Mark.x)
        XCTAssertFalse(game.gameIsOver)
        XCTAssertNil(game.winningPlayer)
        
        // Assert board is empty
        for x in 0..<3 {
            for y in 0..<3 {
                XCTAssertNil(game.board[(x, y)])
            }
        }
    }
    
    func gameEndingInAWin(winningMark: GameBoard.Mark) -> Game {
        var game = Game()
        
        try! game.makeMark(at: (1, 0)) // x
        try! game.makeMark(at: (0, 0)) // o
        try! game.makeMark(at: (1, 1)) // x
        try! game.makeMark(at: (0, 1)) // o
        
        if winningMark == .x {
            try! game.makeMark(at: (1, 2)) // x
            /*
            o x -
            o x -
            - x -
            */
            return game
            
        } else {
            try! game.makeMark(at: (2, 2)) // x
            try! game.makeMark(at: (0, 2)) // o
            /*
            o x -
            o x -
            o - x
            */
            return game
        }
    }
    
    func gameEndingInATie() -> Game {
        var game = Game()
        
        try! game.makeMark(at: (1, 0)) // x
        try! game.makeMark(at: (0, 0)) // o
        try! game.makeMark(at: (2, 0)) // x
        try! game.makeMark(at: (1, 1)) // o
        try! game.makeMark(at: (0, 1)) // x
        try! game.makeMark(at: (2, 1)) // o
        try! game.makeMark(at: (0, 2)) // x
        try! game.makeMark(at: (1, 2)) // o
        try! game.makeMark(at: (2, 2)) // x
        /*
        o x x
        x o o
        x o x
        */
        return game
    }
}
