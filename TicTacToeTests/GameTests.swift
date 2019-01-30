//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Austin Cole on 1/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {
    
    var board: GameBoard?
    override func setUp() {
        board = GameBoard()
    }

    func testRestart() {
        XCTAssertNoThrow(try board!.place(mark: .o, on: (0, 0)))
        XCTAssertEqual(board![(0, 0)], .o)
        XCTAssertNoThrow(try board!.place(mark: .o, on: (0, 1)))
        XCTAssertEqual(board![(0, 1)], .o)
        XCTAssertNoThrow(try board!.place(mark: .o, on: (0, 2)))
        XCTAssertEqual(board![(0, 2)], .o)
        XCTAssertNoThrow(try board!.place(mark: .o, on: (1, 0)))
        XCTAssertEqual(board![(1, 0)], .o)
        XCTAssertNoThrow(try board!.place(mark: .o, on: (1, 1)))
        XCTAssertEqual(board![(1, 1)], .o)
        XCTAssertNoThrow(try board!.place(mark: .o, on: (1, 2)))
        XCTAssertEqual(board![(1, 2)], .o)
        XCTAssertNoThrow(try board!.place(mark: .o, on: (2, 0)))
        XCTAssertEqual(board![(2, 0)], .o)
        XCTAssertNoThrow(try board!.place(mark: .o, on: (2, 1)))
        XCTAssertEqual(board![(2, 1)], .o)
        XCTAssertNoThrow(try board!.place(mark: .o, on: (2, 2)))
        XCTAssertEqual(board![(2, 2)], .o)
        
        XCTAssertNil(board!)
    }
}
