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
    
    func testWinCheckingVertical1() {
        var board = GameBoard()
        /*
        x o -
        x o -
        x - -
        */
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .x, on: (0, 1))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (0, 2))
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    
    func testWinCheckingVertical2() {
        var board = GameBoard()
        /*
         x o -
         x o -
         - o -
         */
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (0, 1))
        try! board.place(mark: .o, on: (1, 2))
        XCTAssertTrue(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
    }
    
    func testWinCheckingHorizontal1() {
        var board = GameBoard()
        /*
         - o -
         x x x
         o - -
         */
        try! board.place(mark: .x, on: (x: 0, y: 0))
        try! board.place(mark: .o, on: (x: 1, y: 1))
        try! board.place(mark: .x, on: (x: 1, y: 0))
        try! board.place(mark: .o, on: (x: 0, y: 1))
        try! board.place(mark: .x, on: (x: 2, y: 0))
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
        
        
        
    }
    
    func testWinCheckingHorizontal2() {
        var board = GameBoard()
        /*
         x - -
         - x -
         o o o
         */
        try! board.place(mark: .x, on: (x: 0, y: 0))
        try! board.place(mark: .o, on: (x: 2, y: 0))
        try! board.place(mark: .x, on: (x: 1, y: 1))
        try! board.place(mark: .o, on: (x: 2, y: 1))
        try! board.place(mark: .x, on: (x: 1, y: 0))
        try! board.place(mark: .o, on: (x: 2, y: 2))
        XCTAssertTrue(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
    }
    
    func testWinCheckingDiagonal1() {
        var board = GameBoard()
        /*
         x - -
         - x -
         o o x
         */
        try! board.place(mark: .x, on: (x: 0, y: 0))
        try! board.place(mark: .o, on: (x: 2, y: 0))
        try! board.place(mark: .x, on: (x: 1, y: 1))
        try! board.place(mark: .o, on: (x: 2, y: 1))
        try! board.place(mark: .x, on: (x: 2, y: 2))
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    
    func testWinCheckingDiagonal2() {
        var board = GameBoard()
        /*
         x - o
         - o -
         o x -
         */
        try! board.place(mark: .x, on: (x: 0, y: 0))
        try! board.place(mark: .o, on: (x: 0, y: 2))
        try! board.place(mark: .x, on: (x: 1, y: 0))
        try! board.place(mark: .o, on: (x: 1, y: 1))
        try! board.place(mark: .x, on: (x: 2, y: 1))
        try! board.place(mark: .o, on: (x: 2, y: 0))
        XCTAssertTrue(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
    }
    
    func testIncompleteGame() {
       var board = GameBoard()
        var numberOfXs: Int {
            return countOf(mark: .x)
        }
        
        var numberOfOs: Int {
            return countOf(mark: .o)
        }
        var isValid: Bool {
            if numberOfXs < 0 { return false }
            if numberOfOs < 0 { return false }
            if numberOfXs > 5 { return false }
            if numberOfOs > 4 { return false }
            
            if numberOfXs == numberOfOs || numberOfXs == (numberOfOs + 1) {
                return true
            }
            
            return false
        }
        
        func countOf(mark: GameBoard.Mark) -> Int {
            var count = 0
            for x in 0 ..< 3 {
                for y in 0 ..< 3 {
                    if board[(x: x, y: y)] == mark {
                        count += 1
                    }
                }
            }
            return count
        }
        
        XCTAssertFalse(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }

    func testCatsGame() {
        var board = GameBoard()
        
        try! board.place(mark: .x, on: (x: 0, y: 0))
        try! board.place(mark: .o, on: (x: 1, y: 0))
        try! board.place(mark: .x, on: (x: 2, y: 0))
        try! board.place(mark: .x, on: (x: 0, y: 1))
        try! board.place(mark: .o, on: (x: 1, y: 1))
        try! board.place(mark: .x, on: (x: 2, y: 1))
        try! board.place(mark: .o, on: (x: 0, y: 2))
        try! board.place(mark: .x, on: (x: 1, y: 2))
        try! board.place(mark: .o, on: (x: 2, y: 2))
        XCTAssertTrue(board.isFull, "Tie games only occur with a full board")
        XCTAssertFalse(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    
}
