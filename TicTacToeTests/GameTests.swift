//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Michael on 2/19/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {

    func testCreatingEmptyBoard() {
        let game = Game()

        for x in 0..<3 {
            for y in 0..<3 {
                XCTAssertNil(game.board[(x, y)])
            }
        }
    }
    
    func testPlacingMarks() {
        let game = Game()
        var board = game.board
        
        XCTAssertNoThrow(try board.place(mark: .o, on: (0, 0)))
        XCTAssertEqual(board[(0, 0)], .o)
        XCTAssertNoThrow(try board.place(mark: .x, on: (2, 2)))
        XCTAssertEqual(board[(2, 2)], .x)
        for x in 0..<3 {
            for y in 0..<3 {
                if x == 0 && y == 0 { continue }
                if x == 2 && y == 2 { continue }
                XCTAssertNil(board[(x, y)])
            }
        }
        
        // Make sure you can't change an already marked square
        XCTAssertThrowsError(try board.place(mark: .x, on: (0, 0))) { (error) in
        XCTAssertEqual(error as? GameBoardError, GameBoardError.invalidSquare)
        }
    }
    
    func testIsFull() {
        let game = Game()
        var board = game.board
        /*
        x o x
        o o x
        x x o
        */
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .x, on: (2, 0))
        try! board.place(mark: .o, on: (0, 1))
        try! board.place(mark: .x, on: (2, 1))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (0, 2))
        try! board.place(mark: .o, on: (2, 2))
        XCTAssertFalse(board.isFull)
        
        try! board.place(mark: .x, on: (1, 2))
        XCTAssertTrue(board.isFull)
    }
    
    func testCannotMarkSameSquare() {
        var game = Game()
        var board = game.board
        game.gameStatus = .newGame(.x)
        
        try! board.place(mark: .x, on: (0, 0))
        
        XCTAssertThrowsError(try board.place(mark: .o, on: (0, 0)))
    }
    
    func testWinCheckingVertical1() {
        let game = Game()
        var board = game.board
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
        XCTAssertTrue(game.game(board: board, isWonBy: .x))
        XCTAssertFalse(game.game(board: board, isWonBy: .o))
    }
    
    func testWinCheckingVertical2() {
        let game = Game()
        var board = game.board
        /*
         o x -
         o x -
         - x -
         */
        try! board.place(mark: .x, on: (1, 0))
        try! board.place(mark: .o, on: (0, 0))
        try! board.place(mark: .x, on: (1, 1))
        try! board.place(mark: .o, on: (0, 1))
        try! board.place(mark: .x, on: (1, 2))
        XCTAssertTrue(game.game(board: board, isWonBy: .x))
        XCTAssertFalse(game.game(board: board, isWonBy: .o))
    }
    
    func testWinCheckingVertical3() {
        let game = Game()
        var board = game.board
        /*
         - - x
         - o x
         - o x
         */
        try! board.place(mark: .x, on: (2, 0))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (2, 1))
        try! board.place(mark: .o, on: (1, 2))
        try! board.place(mark: .x, on: (2, 2))
        XCTAssertTrue(game.game(board: board, isWonBy: .x))
        XCTAssertFalse(game.game(board: board, isWonBy: .o))
    }
    
    func testWinCheckingHorizontal1() {
        let game = Game()
        var board = game.board
        /*
         x x x
         o o -
         - - -
         */
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (0, 1))
        try! board.place(mark: .x, on: (1, 0))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (2, 0))
        
        XCTAssertTrue(game.game(board: board, isWonBy: .x))
        XCTAssertFalse(game.game(board: board, isWonBy: .o))
    }
    
    func testWinCheckingHorizontal2() {
        let game = Game()
        var board = game.board
        /*
         o - o
         x x x
         - - -
         */
        try! board.place(mark: .x, on: (0, 1))
        try! board.place(mark: .o, on: (0, 0))
        try! board.place(mark: .x, on: (1, 1))
        try! board.place(mark: .o, on: (2, 0))
        try! board.place(mark: .x, on: (2, 1))
        
        XCTAssertTrue(game.game(board: board, isWonBy: .x))
        XCTAssertFalse(game.game(board: board, isWonBy: .o))
    }
    
    func testWinCheckingHorizontal3() {
        let game = Game()
        var board = game.board
        /*
         - - -
         o o -
         x x x
         */
        try! board.place(mark: .x, on: (0, 2))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (1, 2))
        try! board.place(mark: .o, on: (0, 1))
        try! board.place(mark: .x, on: (2, 2))
        
        XCTAssertTrue(game.game(board: board, isWonBy: .x))
        XCTAssertFalse(game.game(board: board, isWonBy: .o))
    }
    
    func testWinCheckingDiagonal1() {
        let game = Game()
        var board = game.board
        /*
         x - o
         - x o
         - - x
         */
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (2, 0))
        try! board.place(mark: .x, on: (1, 1))
        try! board.place(mark: .o, on: (2, 1))
        try! board.place(mark: .x, on: (2, 2))
        
        XCTAssertTrue(game.game(board: board, isWonBy: .x))
        XCTAssertFalse(game.game(board: board, isWonBy: .o))
    }
    
    func testWinCheckingDiagonal2() {
        let game = Game()
        var board = game.board
        /*
         o - x
         - x -
         x o -
         */
        try! board.place(mark: .x, on: (2, 0))
        try! board.place(mark: .o, on: (0, 0))
        try! board.place(mark: .x, on: (1, 1))
        try! board.place(mark: .o, on: (1, 2))
        try! board.place(mark: .x, on: (0, 2))
        
        XCTAssertTrue(game.game(board: board, isWonBy: .x))
        XCTAssertFalse(game.game(board: board, isWonBy: .o))
    }
    
    func testIncompleteGame() {
        let game = Game()
        var board = game.board
        /*
         x - o
         - x -
         x - o
         */
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (2, 0))
        try! board.place(mark: .x, on: (1, 1))
        try! board.place(mark: .o, on: (2, 2))
        try! board.place(mark: .x, on: (0, 2))
        
        XCTAssertFalse(game.game(board: board, isWonBy: .x))
        XCTAssertFalse(game.game(board: board, isWonBy: .o))
        
        XCTAssertFalse(board.isFull)
    }
    
    func testCatsGame() {
        let game = Game()
        var board = game.board
        /*
         x o x
         o o x
         x x o
         */
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .x, on: (2, 0))
        try! board.place(mark: .o, on: (0, 1))
        try! board.place(mark: .x, on: (2, 1))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (0, 2))
        try! board.place(mark: .o, on: (2, 2))
        try! board.place(mark: .x, on: (1, 2))
        
        XCTAssertTrue(board.isFull)
        
        XCTAssertFalse(game.game(board: board, isWonBy: .o))
        XCTAssertFalse(game.game(board: board, isWonBy: .x))
    }
}
