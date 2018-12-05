//
//  GameAITests.swift
//  TicTacToeTests
//
//  Created by Jason Modisett on 12/5/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameAITests: XCTestCase {

    // Vertical check
    func testWinVertical() {
        var board = GameBoard()
        try! board.place(mark: .x, on: (0,0))
        try! board.place(mark: .o, on: (1,0))
        try! board.place(mark: .x, on: (0,1))
        try! board.place(mark: .o, on: (1,1))
        try! board.place(mark: .x, on: (0,2))
        
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    
    // Horizontal check
    func testWinHorizontal() {
        var board = GameBoard()
        try! board.place(mark: .o, on: (0,0))
        try! board.place(mark: .x, on: (0,1))
        try! board.place(mark: .o, on: (1,0))
        try! board.place(mark: .x, on: (1,1))
        try! board.place(mark: .x, on: (2,1))
        
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    
    // Diagonal check
    func testWinDiagonal() {
        var board = GameBoard()
        try! board.place(mark: .o, on: (0,0))
        try! board.place(mark: .x, on: (0,2))
        try! board.place(mark: .o, on: (1,0))
        try! board.place(mark: .x, on: (1,1))
        try! board.place(mark: .x, on: (2,0))
        
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }

}
