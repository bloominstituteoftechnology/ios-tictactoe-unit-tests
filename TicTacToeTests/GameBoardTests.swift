//
//  GameBoardTests.swift
//  TicTacToeTests
//
//  Created by Lambda_School_Loaner_34 on 3/6/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//
//command u runs test
//command shift u runs and builds test
//control command up arrow shows file that you cannot see
// DRY: Don't Repeat Yourself

import XCTest

@testable import TicTacToe

class GameBoardTests: XCTestCase {
    
    //test names are descriptive of what we're testing
    var board: GameBoard!
    
    override func setUp() {
        super.setUp()
        board = GameBoard()
    }
    
    func testNewGameBoardIsEmpty() {
        for x in 0..<3 {
            for y in 0..<3 {
                XCTAssertNil(board[(x, y)])
            }
        }
    }
    
    func testPlacingASingleMark() throws {
        try board.place(mark: .x, on: (0, 0))
        //first value is expect value, second value is the value itself
        XCTAssertEqual(.x, board[(0, 0)])
        //XCTAssertEqual(expected, actual)
    }
    
    func testPlacingADuplicateMarkThrowsAnError() {
        XCTAssertNoThrow(try board.place(mark: .o, on: (1, 1)))
        
        XCTAssertThrowsError(try board.place(mark: .x, on: (1, 1))) { (error) in
            XCTAssertEqual(GameBoardError.invalidSquare, error as? GameBoardError)
        }
    }
    
    func testBoardIsFullAfterFillingAllSpots() throws {
        for x in 0..<3 {
            for y in 0..<3 {
                //verify not full
                XCTAssertFalse(board.isFull)
                
                //place tile
                try board.place(mark: .x, on: (x, y))
                
            }
        }
        //verify full
        XCTAssertTrue(board.isFull)
    }
}
