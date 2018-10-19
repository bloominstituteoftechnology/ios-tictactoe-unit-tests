//
//  GameTests.swift
//  GameTests
//
//  Created by Madison Waters on 10/17/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {

    func testRestart() {
        let board = GameBoard()
        var game = game(
        XCTAssertFalse(board.isFull)
        XCTAssertTrue(game.)
    }
    
    func testMakeAMark(){
        var board = GameBoard()
       
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .x, on: (0, 1))
        try! board.place(mark: .x, on: (0, 2))
        try! board.place(mark: .x, on: (1, 0))
        try! board.place(mark: .x, on: (1, 1))
        try! board.place(mark: .x, on: (1, 2))
        try! board.place(mark: .x, on: (2, 0))
        try! board.place(mark: .x, on: (2, 1))
        try! board.place(mark: .x, on: (2, 2))
        XCTAssertTrue(currentGame(board: board, isWonBy: .x))
    }
}
