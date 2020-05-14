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
        
        for y in 0...2 {
            for x in 0...2 {
                XCTAssertNil(gameboard[(x, y)], " ⚠️⚠️ The entry at that \(x) and \(y) was \(gameboard[(x,y)]!) ⚠️⚠️")
            }
        }
    }
    
}
