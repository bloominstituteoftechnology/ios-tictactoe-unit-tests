//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Lambda_School_Loaner_268 on 4/15/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {
    
    func testNewBoardOrRestart() {
        
        let game = Game()
        var board = game.board
        
        for x in 0..<3 {
            for y in 0..<3 {
                XCTAssertNil(board[(x, y)])
                
            }
        }
    }
    
    func testMakeMark() {
        
        var game = Game()
        var board = game.board
        
        try XCTAssertNoThrow(board.place(mark: .x, on: (0, 0 )))
        XCTAssertEqual(board[(0, 0)], .x)
        try XCTAssertNoThrow(board.place(mark: .o, on: (1, 1)))
        XCTAssertEqual(board[(1, 1)], .o)
        
    }
    
    func testCantMarkSameSpot() {
        
        let game = Game()
        var board = game.board
        
        try XCTAssertNoThrow(board.place(mark: .x, on: (0, 0 )))
        XCTAssertThrowsError(try board.place(mark: .o, on: (0, 0)))
        
    }
    
    func testIsFull() {
        
        let game = Game()
        var board = game.board
               
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (0, 1))
        try! board.place(mark: .x, on: (1, 0))
        try! board.place(mark: .o, on: (2, 0))
        try! board.place(mark: .x, on: (0, 2))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (2, 1))
        try! board.place(mark: .o, on: (1, 2))
        
        XCTAssertFalse(board.isFull)
        try! board.place(mark: .x, on: (2, 2))
        XCTAssertTrue(board.isFull)
        
    }
}

