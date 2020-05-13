//
//  GameAITests.swift
//  TicTacToeTests
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameAITests: XCTestCase {
    
    func testWinCheckingVertical1() throws {
        var board = GameBoard()
        /*
        x o -
        x o -
        x - -
        */
        try board.place(mark: .x, on: (0, 0))
        try board.place(mark: .o, on: (1, 0))
        try board.place(mark: .x, on: (0, 1))
        try board.place(mark: .o, on: (1, 1))
        try board.place(mark: .x, on: (0, 2))
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    
    func testWinCheckingVertical2() throws {
        var board = GameBoard()
        /*
         x o -
         x o -
         - o -
         */
        try board.place(mark: .o, on: (1, 0))
        try board.place(mark: .x, on: (0, 0))
        try board.place(mark: .o, on: (1, 1))
        try board.place(mark: .x, on: (0, 1))
        try board.place(mark: .o, on: (1, 2))
        XCTAssertTrue(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
    }
    
    func testWinCheckingVertical3() throws {
        var board = GameBoard()
        /*
         - - o
         x x o
         - - o
         */
        try board.place(mark: .o, on: (2, 0))
        try board.place(mark: .x, on: (0, 1))
        try board.place(mark: .o, on: (2, 1))
        try board.place(mark: .x, on: (1, 1))
        try board.place(mark: .o, on: (2, 2))
        XCTAssertTrue(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
    }
    
    func testWinCheckingHorizontal1() throws {
        var board = GameBoard()
        /*
         - o -
         x x x
         o - -
         */
    }
    
    func testWinCheckingHorizontal2() throws {
        var board = GameBoard()
        /*
         x - -
         - x -
         o o o
         */
    }
    
    func testWinCheckingDiagonal1() throws {
        var board = GameBoard()
        /*
         x - -
         - x -
         o o x
         */
    }
    
    func testWinCheckingDiagonal2() throws {
        var board = GameBoard()
        /*
         x - o
         - o -
         o x -
         */
    }
    
    func testIncompleteGame() {
    }

    func testCatsGame() {
    }
}
