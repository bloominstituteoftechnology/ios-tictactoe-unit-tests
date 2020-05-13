//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Chris Dobek on 5/13/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {
 
    var gameTest = Game()
    var board = GameBoard()

    func testRestart() {
        gameTest.gameStatus = .gameOver(.o)
        gameTest.restart()
        XCTAssertEqual(gameTest.activePlayer, .x )
        XCTAssertFalse(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }

    func testMakeMark() {

        try! board.place(mark: .x, on: (0,0))
        try! board.place(mark: .o, on: (0,1))
        try! board.place(mark: .x, on: (0,2))
        try! board.place(mark: .o, on: (1,0))
        try! board.place(mark: .x, on: (1,1))
        try! board.place(mark: .o, on: (1,2))
        try! board.place(mark: .x, on: (2,0))

        XCTAssertEqual(board[(0,0)], .x)
        XCTAssertEqual(board[(0,1)], .o)
        XCTAssertEqual(board[(0,2)], .x)
        XCTAssertEqual(board[(1,0)], .o)
        XCTAssertEqual(board[(1,1)], .x)
        XCTAssertEqual(board[(1,2)], .o)
        XCTAssertEqual(board[(2,0)], .x)

        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
        XCTAssertFalse(board.isFull)
        XCTAssertThrowsError(try board.place(mark: .o, on: (2,0))) { (error) in
            XCTAssertEqual(error as? GameBoardError, GameBoardError.invalidSquare)
        }


    }
}
