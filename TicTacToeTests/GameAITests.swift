//
//  GameAITests.swift
//  TicTacToeTests
//
//  Created by Bradley Yin on 9/11/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import XCTest
@testable import TicTacToe

class GameAITests:XCTestCase {
    func testThereIsNoWinnerWithNewGame() {
        var board = GameBoard()
        
        XCTAssertFalse(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    
    func testXWinCheckingVertical1() throws {
        var board = GameBoard()
        try board.place(mark: .x, on: (0, 0))
        try board.place(mark: .o, on: (1, 0))
        try board.place(mark: .x, on: (0, 1))
        try board.place(mark: .o, on: (1, 1))
        try board.place(mark: .x, on: (0, 2))
        
        XCTAssertTrue(game(board: board, isWonBy: .x))
    }
    
    func testOWinCheckingVertical1() throws {
        var board = GameBoard()
        try board.place(mark: .o, on: (0, 0))
        try board.place(mark: .x, on: (1, 0))
        try board.place(mark: .o, on: (0, 1))
        try board.place(mark: .x, on: (1, 1))
        try board.place(mark: .o, on: (0, 2))
        
        XCTAssertTrue(game(board: board, isWonBy: .o))
    }
    
    func testXNotWinCheckingVertical2() throws {
        var board = GameBoard()
        try board.place(mark: .x, on: (2, 0))
        try board.place(mark: .x, on: (2, 1))
        try board.place(mark: .x, on: (1, 0))
        
        XCTAssertFalse(game(board: board, isWonBy: .x))
    }
}
