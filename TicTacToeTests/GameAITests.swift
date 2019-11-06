//
//  TicTacToeTests.swift
//  TicTacToeTests
//
//  Created by Kat Milton on 8/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import XCTest
@testable import TicTacToe

class GameAITests: XCTestCase {
    
    func testWinCheckingVertical() throws {
        var board = GameBoard()
        
        try board.place(mark: .x, on: (0, 1))
        try board.place(mark: .o, on: (1, 0))
        try board.place(mark: .x, on: (1, 1))
        try board.place(mark: .o, on: (0, 2))
        try board.place(mark: .x, on: (2, 1))
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    
    func testWinCheckingHorizontal() throws {
        var board = GameBoard()
        
        try board.place(mark: .o, on: (0, 2))
        try board.place(mark: .x, on: (0, 0))
        try board.place(mark: .o, on: (1, 2))
        try board.place(mark: .x, on: (1, 1))
        try board.place(mark: .o, on: (2, 2))
        XCTAssertTrue(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
    }
    
    func testWinCheckingDiagonal() throws {
        var board = GameBoard()
        
        try board.place(mark: .x, on: (0, 0))
        try board.place(mark: .o, on: (0, 2))
        try board.place(mark: .x, on: (1, 1))
        try board.place(mark: .o, on: (1, 2))
        try board.place(mark: .x, on: (2, 2))
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    
    func testIncompleteGame() throws {
        var board = GameBoard()
        
        try board.place(mark: .x, on: (0, 0))
        try board.place(mark: .o, on: (2, 0))
        try board.place(mark: .x, on: (0, 1))
        try board.place(mark: .o, on: (0, 2))
        XCTAssertFalse(board.isFull)
    }
    
    func testCatsGame() throws {
        var board = GameBoard()
        
        try board.place(mark: .x, on: (0, 2))
        try board.place(mark: .o, on: (2, 0))
        try board.place(mark: .x, on: (0, 0))
        try board.place(mark: .o, on: (0, 1))
        try board.place(mark: .x, on: (1, 0))
        try board.place(mark: .o, on: (1, 1))
        try board.place(mark: .x, on: (2, 1))
        try board.place(mark: .o, on: (1, 2))
        try board.place(mark: .x, on: (2, 2))
        XCTAssertTrue(board.isFull)
    }
}

