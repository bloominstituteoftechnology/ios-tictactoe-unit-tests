//
//  GameAITests.swift
//  TicTacToeTests
//
//  Created by Breena Greek on 5/26/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameAITests: XCTestCase {
    
    func testWinCheckingVerticl0() {
        var board = GameBoard()
        
        try! board.place(mark: .x, on : (0, 0))
        try! board.place(mark: .o, on : (1, 0))
        
        try! board.place(mark: .x, on : (0, 1))
        try! board.place(mark: .o, on : (1, 1))
        
        XCTAssertFalse(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
        
        try! board.place(mark: .x, on : (0, 2))
        
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    
    func testWinCheckingVertical1() {
        var board = GameBoard()
        
        try! board.place(mark: .x, on : (1, 0))
        try! board.place(mark: .o, on : (2, 0))
        
        try! board.place(mark: .x, on : (1, 1))
        try! board.place(mark: .o, on : (2, 1))
        
        try! board.place(mark: .x, on : (1, 2))
        
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    func testWinHorizontal1() {
        
        var board = GameBoard()
        
        try! board.place(mark: .x, on: (0, 1))
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .x, on: (1, 1))
        try! board.place(mark: .o, on: (0, 2))
        try! board.place(mark: .x, on: (2, 1))
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    
    func testWinCheckingHorizontal2() {
        var board = GameBoard()
        try! board.place(mark: .o, on: (0, 2))
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (1, 2))
        try! board.place(mark: .x, on: (1, 1))
        try! board.place(mark: .o, on: (2, 2))
        XCTAssertTrue(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
    }
    
    func testWinCheckingDiagonal1() {
        var board = GameBoard()
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (0, 2))
        try! board.place(mark: .x, on: (1, 1))
        try! board.place(mark: .o, on: (1, 2))
        try! board.place(mark: .x, on: (2, 2))
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    
    func testWinCheckingDiagonal2() {
        var board = GameBoard()
        try! board.place(mark: .o, on: (2, 0))
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (1, 2))
        try! board.place(mark: .o, on: (0, 2))
        XCTAssertTrue(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
    }
    
    func testIncompleteGame() {
        var board = GameBoard()
        try! board.place(mark: .o, on: (0, 2))
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (1, 2))
        try! board.place(mark: .o, on: (1, 1))
        XCTAssertFalse(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
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
        try! board.place(mark: .o, on: (2, 2))
        try! board.place(mark: .x, on: (1, 2))
        XCTAssertFalse(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
}
