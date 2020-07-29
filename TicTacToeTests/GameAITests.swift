//
//  GameAITests.swift
//  TicTacToeTests
//
//  Created by Bronson Mullens on 7/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameAITests: XCTestCase {
    
    func testWinCheckingVertical1() {
        var board = GameBoard()
        
        /*
         x o -
         x o -
         x o -
         x - -
         */
        
        XCTAssertNoThrow(try board.place(mark: .x, on: (0,0)))
        XCTAssertNoThrow(try board.place(mark: .o, on: (1,0)))
        XCTAssertNoThrow(try board.place(mark: .x, on: (0,1)))
        XCTAssertNoThrow(try board.place(mark: .o, on: (1,1)))
        XCTAssertNoThrow(try board.place(mark: .x, on: (0,2)))
        
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    
    func testWinCheckingHorizontal1() {
        var board = GameBoard()
        
        /*
         x x x
         x o -
         x o -
         x - -
         */
        
        XCTAssertNoThrow(try board.place(mark: .x, on: (0,0)))
        XCTAssertNoThrow(try board.place(mark: .o, on: (0,1)))
        
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    
}
