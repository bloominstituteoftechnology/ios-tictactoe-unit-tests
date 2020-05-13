//
//  GameAITests.swift
//  TicTacToeTests
//
//  Created by Dimitri Bouniol Lambda on 5/13/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameAITests: XCTestCase {

    func testWinCheckingVertical0() throws {
        var board = GameBoard()
        
        try board.place(mark: .x, on: (0, 0))
        try board.place(mark: .o, on: (1, 0))
        
        try board.place(mark: .x, on: (0, 1))
        try board.place(mark: .o, on: (1, 1))
        
        XCTAssertFalse(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
        
        try board.place(mark: .x, on: (0, 2))
        
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }

    func testWinCheckingVertical1() throws {
        var board = GameBoard()
        
        try board.place(mark: .x, on: (0, 0))
        try board.place(mark: .o, on: (0, 1))
        
        try board.place(mark: .x, on: (1, 0))
        try board.place(mark: .o, on: (2, 0))
        
        try board.place(mark: .x, on: (1, 1))
        try board.place(mark: .o, on: (2, 1))
        
        XCTAssertFalse(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
        
        try board.place(mark: .x, on: (1, 2))
        
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    
    func testWinCheckingVertical2() {
        var board = GameBoard()
        
        try! board.place(mark: .x, on: (2, 0))
        try! board.place(mark: .o, on: (0, 0))
        
        try! board.place(mark: .x, on: (2, 1))
        try! board.place(mark: .o, on: (0, 1))
        
        try! board.place(mark: .x, on: (2, 2))
        
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }

    func testWinCheckingHorizontal0() {
        var board = GameBoard()
        
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (0, 1))
        
        try! board.place(mark: .x, on: (1, 0))
        try! board.place(mark: .o, on: (1, 1))
        
        try! board.place(mark: .x, on: (2, 0))
        
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }

    func testWinCheckingHorizontal1() {
        var board = GameBoard()
        
        try! board.place(mark: .x, on: (0, 1))
        try! board.place(mark: .o, on: (0, 2))
        
        try! board.place(mark: .x, on: (1, 1))
        try! board.place(mark: .o, on: (1, 2))
        
        try! board.place(mark: .x, on: (2, 1))
        
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }

    func testWinCheckingHorizontal2() {
        var board = GameBoard()
        
        try! board.place(mark: .x, on: (0, 2))
        try! board.place(mark: .o, on: (0, 0))
        
        try! board.place(mark: .x, on: (1, 2))
        try! board.place(mark: .o, on: (1, 0))
        
        try! board.place(mark: .x, on: (2, 2))
        
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }

    func testWinCheckingDiagonalA() {
        var board = GameBoard()
        
        try! board.place(mark: .o, on: (0, 0))
        try! board.place(mark: .x, on: (0, 1))
        
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (1, 0))
        
        try! board.place(mark: .o, on: (2, 2))
        
        XCTAssertTrue(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
    }

    func testWinCheckingDiagonalB() {
        var board = GameBoard()
        
        try! board.place(mark: .o, on: (2, 0))
        try! board.place(mark: .x, on: (0, 1))
        
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (1, 0))
        
        try! board.place(mark: .o, on: (0, 2))
        
        XCTAssertTrue(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
    }
    
    func testCatsGame() {
        var board = GameBoard()
        
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (0, 1))
        try! board.place(mark: .x, on: (1, 0))
        try! board.place(mark: .o, on: (2, 0))
        try! board.place(mark: .x, on: (0, 2))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (2, 1))
        try! board.place(mark: .o, on: (1, 2))
        try! board.place(mark: .x, on: (2, 2))
        XCTAssertTrue(board.isFull)
        
        XCTAssertFalse(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }

}
