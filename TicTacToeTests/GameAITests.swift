//
//  GameAITests.swift
//  TicTacToeTests
//
//  Created by Ezra Black on 5/14/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe
class GameAITests: XCTestCase {

    func testWinCheckingVertical0() throws {
    var gameboard = GameBoard()
        
        try gameboard.place(mark: .x, on: (0,0))
        try gameboard.place(mark: .o, on: (1,0))
        
        try gameboard.place(mark: .x, on: (0,1))
        try gameboard.place(mark: .o, on: (1,1))
        
        try gameboard.place(mark: .x, on: (0,2))
        
        XCTAssertTrue(game(board: gameboard, isWonBy: .x))
        XCTAssertFalse(game(board: gameboard, isWonBy: .o))
    }
    func testWinCheckingVertical1() throws {
    var gameboard = GameBoard()
        
        try gameboard.place(mark: .x, on: (0,0))
        try gameboard.place(mark: .o, on: (1,0))
        
        try gameboard.place(mark: .x, on: (0,1))
        try gameboard.place(mark: .o, on: (1,1))
        
        try gameboard.place(mark: .x, on: (0,2))
        
        XCTAssertTrue(game(board: gameboard, isWonBy: .x))
        XCTAssertFalse(game(board: gameboard, isWonBy: .o))
    }
}
