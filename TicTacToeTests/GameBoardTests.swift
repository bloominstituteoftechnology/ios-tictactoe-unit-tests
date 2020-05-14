//
//  GameBoardTests.swift
//  TicTacToeTests
//
//  Created by Ezra Black on 5/14/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameBoardTests: XCTestCase {
    
    func testCreatingEmptyBoard() throws {
        
        let gameboard = GameBoard()
//        XCTAssert(gameboard[(x: 0, y: 0)] == nil)
        //First Row
        XCTAssertNil(gameboard[(x: 0, y: 0)])
        XCTAssertNil(gameboard[(x: 1, y: 0)])
        XCTAssertNil(gameboard[(x: 2, y: 0)])
        //Second Row
        XCTAssertNil(gameboard[(x: 0, y: 1)])
        XCTAssertNil(gameboard[(x: 1, y: 1)])
        XCTAssertNil(gameboard[(x: 2, y: 1)])
        //third Row
        XCTAssertNil(gameboard[(x: 0, y: 2)])
        XCTAssertNil(gameboard[(x: 1, y: 2)])
        XCTAssertNil(gameboard[(x: 2, y: 2)])
        
       
    }
    
    func testPlacingMarks() {
        var gameboard = GameBoard()
        
//        try board.place(mark: .o, on: (0, 0))
        
        //1)put a piece on the board and check if it throws
        XCTAssertNoThrow(try gameboard.place(mark: .o, on: (0, 0)))
        //2)check if the piece is on the board
        XCTAssertEqual(gameboard[(0, 0)], .o)
        
        XCTAssertNoThrow(try gameboard.place(mark: .x, on: (2, 2)))
        XCTAssertEqual(gameboard[(2, 2)], .x)
        
        //Make sure things don't change if we place a O on the same tile.
        XCTAssertThrowsError(try gameboard.place(mark: .o, on: (2, 2)))
        XCTAssertEqual(gameboard[(2, 2)], .x)
        
        for y in 0...2 {
                   for x in 0...2 {
                       if x == 0 && y == 0 {continue}
                       if x == 2 && y == 2 {continue}
                       XCTAssertNil(gameboard[(x, y)], " ⚠️⚠️ The entry at that \(x) and \(y) was \(gameboard[(x,y)]!) ⚠️⚠️")
                   }
               }
               XCTAssertThrowsError(try gameboard.place(mark: .o, on: (2, 2))) { (error) in
                   XCTAssertEqual(error as? GameBoardError, .invalidSquare)
               }
    }
    
}
