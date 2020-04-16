//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Karen Rodriguez on 4/15/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {

    func testCreatingGame() {
        let game = Game(board: GameBoard())

        for x in 0..<3 {
            for y in 0..<3 {
                XCTAssertNil(game.board[(x, y)])
            }
        }
    }
    
    func testPlacingMark() {
        var game = Game(board: GameBoard())
//        let board = game.board
        // My dumbass failed to realize that when using a struct, the code above would pass by creating a new instance. There goes a good 30 minutes of trying to figure out where I was wrong!!!!!.
        
        // Should be X
        
        XCTAssertNoThrow(try game.makeMark(at: (0, 1)))
        XCTAssertNotNil(game.board[(0, 1)])
        XCTAssertEqual(game.board[(0, 1)], .x)
        
        // Should be Y
        XCTAssertNoThrow(try game.makeMark(at: (2,1)))
        XCTAssertNotNil(game.board[(2, 1)])
        XCTAssertEqual(game.board[(2, 1)], .o)
        
        // Check everything else remains
        for x in 0..<3 {
            for y in 0..<3 {
                if (x == 0 && y == 1) || (x == 2 && y == 1) { continue }
                XCTAssertNil(game.board[(x, y)])
            }
        }
    }
    
    func testIsFull() {
        var game = Game(board: GameBoard())
        
        /*
        o o x
        x x o
        o x x
        */
        
        try! game.makeMark(at: (2,0)) // x
        try! game.makeMark(at: (0,0)) // o
        try! game.makeMark(at: (0,1)) // x
        try! game.makeMark(at: (1,0)) // o
        try! game.makeMark(at: (1,1)) // x
        try! game.makeMark(at: (2,1)) // o
        try! game.makeMark(at: (1,2)) // x
        try! game.makeMark(at: (0,2)) // o
        XCTAssertFalse(game.board.isFull)
        
        try! game.makeMark(at: (2,2)) // x
        XCTAssertTrue(game.board.isFull)
    }

}
