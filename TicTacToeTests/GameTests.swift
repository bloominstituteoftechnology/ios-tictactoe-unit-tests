//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Shawn James on 5/14/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {

    var board = GameBoard()
    var gameVar = Game()

    func testRestart() {
        gameVar.restart()
        XCTAssertEqual(gameVar.activePlayer, .x )
        XCTAssertFalse(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }

    func testMakeMark() {

        /*
        x o x
        o x o
        x
        */
        
        try! board.place(mark: .x, on: (0,0))
        try! board.place(mark: .o, on: (0,1))
        try! board.place(mark: .x, on: (0,2))
        try! board.place(mark: .o, on: (1,0))
        try! board.place(mark: .x, on: (1,1))
        try! board.place(mark: .o, on: (1,2))
        try! board.place(mark: .x, on: (2,0))
        try! board.place(mark: .o, on: (2,1))
        try! board.place(mark: .x, on: (2,2))

        XCTAssertEqual(board[(0,0)], .x)
        XCTAssertEqual(board[(0,1)], .o)
        XCTAssertEqual(board[(0,2)], .x)
        XCTAssertEqual(board[(1,0)], .o)
        XCTAssertEqual(board[(1,1)], .x)
        XCTAssertEqual(board[(1,2)], .o)
        XCTAssertEqual(board[(2,0)], .x)
        XCTAssertEqual(board[(2,1)], .o)
        XCTAssertEqual(board[(2,2)], .x)

        XCTAssertTrue(board.isFull)
    }
    
}
