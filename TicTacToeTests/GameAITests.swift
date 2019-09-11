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
        
        XCTAssertFalse(gameWon(board: board, isWonBy: .x))
        XCTAssertFalse(gameWon(board: board, isWonBy: .o))
    }
    
    func testXWinCheckingVertical1() throws {
        var board = GameBoard()
        try board.place(mark: .x, on: (0, 0))
        try board.place(mark: .o, on: (1, 0))
        try board.place(mark: .x, on: (0, 1))
        try board.place(mark: .o, on: (1, 1))
        try board.place(mark: .x, on: (0, 2))
        
        XCTAssertTrue(gameWon(board: board, isWonBy: .x))
    }
    
    func testOWinCheckingVertical1() throws {
        var board = GameBoard()
        try board.place(mark: .o, on: (0, 0))
        try board.place(mark: .x, on: (1, 0))
        try board.place(mark: .o, on: (0, 1))
        try board.place(mark: .x, on: (1, 1))
        try board.place(mark: .o, on: (0, 2))
        
        XCTAssertTrue(gameWon(board: board, isWonBy: .o))
    }
    
    func testXNotWinCheckingVertical1And2() throws {
        var board = GameBoard()
        try board.place(mark: .x, on: (2, 0))
        try board.place(mark: .x, on: (2, 1))
        try board.place(mark: .x, on: (1, 0))
        
        XCTAssertFalse(gameWon(board: board, isWonBy: .x))
    }
    
    func testOWinCheckingVertical2() throws {
        var board = GameBoard()
        try board.place(mark: .o, on: (1, 0))
        try board.place(mark: .x, on: (2, 0))
        try board.place(mark: .o, on: (1, 1))
        try board.place(mark: .x, on: (2, 1))
        try board.place(mark: .o, on: (1, 2))
        
        XCTAssertTrue(gameWon(board: board, isWonBy: .o))
    }
    
    func testXWinCheckingVertical2() throws {
        var board = GameBoard()
        try board.place(mark: .x, on: (1, 0))
        try board.place(mark: .o, on: (2, 0))
        try board.place(mark: .x, on: (1, 1))
        try board.place(mark: .o, on: (2, 1))
        try board.place(mark: .x, on: (1, 2))
        
        XCTAssertTrue(gameWon(board: board, isWonBy: .x))
    }
    
    func testOWinCheckingVertical3() throws {
        var board = GameBoard()
        try board.place(mark: .o, on: (2, 0))
        try board.place(mark: .x, on: (1, 0))
        try board.place(mark: .o, on: (2, 1))
        try board.place(mark: .x, on: (1, 1))
        try board.place(mark: .o, on: (2, 2))
        
        XCTAssertTrue(gameWon(board: board, isWonBy: .o))
    }
    
    func testXWinCheckingVertical3() throws {
        var board = GameBoard()
        try board.place(mark: .x, on: (2, 0))
        try board.place(mark: .o, on: (1, 0))
        try board.place(mark: .x, on: (2, 1))
        try board.place(mark: .o, on: (1, 1))
        try board.place(mark: .x, on: (2, 2))
        
        XCTAssertTrue(gameWon(board: board, isWonBy: .x))
    }
    
    func testXWinCheckingHorizontal1() throws {
        var board = GameBoard()
        try board.place(mark: .x, on: (0, 0))
        try board.place(mark: .x, on: (1, 0))
        try board.place(mark: .x, on: (2, 0))
        
        XCTAssertTrue(gameWon(board: board, isWonBy: .x))
    }
    
    func testOWinCheckingHorizontal1() throws {
        var board = GameBoard()
        try board.place(mark: .o, on: (0, 0))
        try board.place(mark: .o, on: (1, 0))
        try board.place(mark: .o, on: (2, 0))
        
        XCTAssertTrue(gameWon(board: board, isWonBy: .o))
    }
    
    func testXNotWinCheckingHorizontal1And2() throws {
        var board = GameBoard()
        try board.place(mark: .x, on: (2, 0))
        try board.place(mark: .x, on: (2, 1))
        try board.place(mark: .x, on: (1, 0))
        
        XCTAssertFalse(gameWon(board: board, isWonBy: .x))
    }
    
    func testOWinCheckingDiagnal1() throws {
        var board = GameBoard()
        try board.place(mark: .o, on: (0, 0))
        try board.place(mark: .o, on: (1, 1))
        try board.place(mark: .o, on: (2, 2))
        
        XCTAssertTrue(gameWon(board: board, isWonBy: .o))
    }
}
