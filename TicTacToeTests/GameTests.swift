//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Chris Gonzales on 3/18/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {


    func testRestart() {
        var board = GameBoard()
        var game = Game()
        
        XCTAssertFalse(game.gameIsOver)
        game.restart()
        XCTAssertTrue(board.isEmpty)
    }
    
    func testMakeMark() {
        var game = Game()
        /*
         x x o
         o x -
         - x o
         */
        try! game.makeMark(at: (0, 0)) // x
        try! game.makeMark(at: (0, 1)) // o
        try! game.makeMark(at: (1, 0)) // x
        try! game.makeMark(at: (2, 0)) // o
        try! game.makeMark(at: (1, 1)) // x
        
        XCTAssertNoThrow(try game.makeMark(at: (2,2)))
    }
    
    func testPlayerWon() {
        var games = Game()
        let board = GameBoard()
        /*
               x o x
               x o o
               x -
               */
               
               try! games.makeMark(at: (0, 0)) // x
               try! games.makeMark(at: (1, 0)) // o
               try! games.makeMark(at: (0, 2)) // x
               try! games.makeMark(at: (1, 1)) // o
               try! games.makeMark(at: (0, 2)) // x
        
        XCTAssertTrue(games.gameIsOver)
        XCTAssertTrue(game(board: board, isWonBy: .x))
    }
    
    func testCatsGame() {
        var game = Game()
        
        /*
        x o x
        x o o
        o x x
        */
        
        try! game.makeMark(at: (0, 0)) // x
        try! game.makeMark(at: (1, 0)) // o
        try! game.makeMark(at: (2, 0)) // x
        try! game.makeMark(at: (1, 1)) // o
        try! game.makeMark(at: (0, 1)) // x
        try! game.makeMark(at: (2, 1)) // o
        try! game.makeMark(at: (1, 2)) // x
        try! game.makeMark(at: (0, 2)) // o
        try! game.makeMark(at: (2, 2)) // x
        
        XCTAssertTrue(game.gameIsOver)
        XCTAssertNil(game.activePlayer)
        XCTAssertNil(game.winningPlayer)
    }

}
