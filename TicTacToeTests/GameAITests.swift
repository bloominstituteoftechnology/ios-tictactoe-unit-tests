//
//  GameAITests.swift
//  TicTacToeTests
//
//  Created by Austin Cole on 1/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameAITests: XCTestCase {

    var board: GameBoard!
    
    override func setUp() {
        board = GameBoard()
    }
    func testWinCheckingVertical0() {
        
        
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .x, on: (0, 1))
        try! board.place(mark: .x, on: (0, 2))
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .o, on: (1, 1))
        
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse((game(board: board, isWonBy: .o)))
        
    }
    func testWinCheckingVertical1() {
        
        
        try! board.place(mark: .o, on: (0, 0))
        try! board.place(mark: .o, on: (0, 1))
        try! board.place(mark: .x, on: (1, 0))
        try! board.place(mark: .x, on: (1, 1))
        try! board.place(mark: .x, on: (1, 2))
        
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse((game(board: board, isWonBy: .o)))
}
    func testWinCheckingVertical2() {
        
        
        try! board.place(mark: .o, on: (0, 0))
        try! board.place(mark: .o, on: (0, 1))
        try! board.place(mark: .x, on: (2, 0))
        try! board.place(mark: .x, on: (2, 1))
        try! board.place(mark: .x, on: (2, 2))
        
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse((game(board: board, isWonBy: .o)))
    }
    
    
    func testWinCheckingHorizontal0() {
        
        
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .x, on: (1, 0))
        try! board.place(mark: .x, on: (2, 0))
        try! board.place(mark: .o, on: (1, 2))
        try! board.place(mark: .o, on: (1, 1))
        
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse((game(board: board, isWonBy: .o)))
        
    }
    func testWinCheckingHorizontal1() {
        
        
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .o, on: (2, 0))
        try! board.place(mark: .o, on: (0, 0))
        try! board.place(mark: .x, on: (2, 1))
        try! board.place(mark: .x, on: (2, 2))
        
        XCTAssertTrue(game(board: board, isWonBy: .o))
        XCTAssertFalse((game(board: board, isWonBy: .x)))
    }
    func testWinCheckingHorizontal2() {
        
        
        try! board.place(mark: .o, on: (0, 0))
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .o, on: (2, 0))
        try! board.place(mark: .x, on: (2, 1))
        try! board.place(mark: .x, on: (2, 2))
        
        XCTAssertTrue(game(board: board, isWonBy: .o))
        XCTAssertFalse((game(board: board, isWonBy: .x)))
    }
}
