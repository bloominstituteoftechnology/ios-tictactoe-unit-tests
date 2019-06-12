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
        
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .o, on: (0, 2))
        try! board.place(mark: .x, on: (0, 1))
        try! board.place(mark: .x, on: (1, 1))
        try! board.place(mark: .x, on: (2, 1))

        XCTAssertFalse(game(board: board, isWonBy: .o))
        XCTAssertTrue(game(board: board, isWonBy: .x))
    }
    
    func testWinCheckingHorizontal2() {
        var board = GameBoard()
        /*
         x - -
         - x -
         o o o
         */
        
        try! board.place(mark: .o, on: (0, 2))
        try! board.place(mark: .o, on: (1, 2))
        try! board.place(mark: .o, on: (2, 2))
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .x, on: (1, 1))
        
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
        
        try! board.place(mark: .o, on: (0, 2))
        try! board.place(mark: .o, on: (1, 2))
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .x, on: (1, 1))
        try! board.place(mark: .x, on: (2, 2))

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
        
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .x, on: (1, 2))
        try! board.place(mark: .o, on: (2, 0))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .o, on: (0, 2))
        
        XCTAssertTrue(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
    }
    
    func testIncompleteGame() {
        var board = GameBoard()
        var nilCounter = 0
        
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .x, on: (2, 1))
        try! board.place(mark: .x, on: (0, 2))
        try! board.place(mark: .x, on: (1, 2))
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .o, on: (0, 1))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .o, on: (2, 2))
        
        for x in 0 ..< 3 {
            for y in 0 ..< 3 {
                if board[(x, y)] == nil {
                    nilCounter += 1
                }
            }
        }
        
        XCTAssert(nilCounter != 0)
        XCTAssertFalse(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
        
    }

    func testCatsGame() {
        var board = GameBoard()
        
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .x, on: (2, 1))
        try! board.place(mark: .x, on: (0, 2))
        try! board.place(mark: .x, on: (1, 2))
        try! board.place(mark: .x, on: (2, 0))
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .o, on: (0, 1))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .o, on: (2, 2))
        
        for x in 0 ..< 3 {
            for y in 0 ..< 3 {
                XCTAssertNotNil(board[(x, y)])
            }
        }
        
        XCTAssertFalse(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
    }
    
    func testGameReset() {
        var board = GameBoard()
        board = set(board: board)
        
        var game = Game(board: board, activePlayer: nil, gameIsOver: false, winningPlayer: nil)
        
        game.restart()
        board = game.board
        
        XCTAssertEqual(game.activePlayer, GameBoard.Mark.x)
        XCTAssertFalse(game.gameIsOver)
        XCTAssertNil(game.winningPlayer)
        
    }
    
    private func set(board: GameBoard) -> GameBoard {
        var setBoard = board
        try! setBoard.place(mark: .x, on: (0, 0))
        try! setBoard.place(mark: .x, on: (2, 1))
        try! setBoard.place(mark: .x, on: (0, 2))
        try! setBoard.place(mark: .x, on: (1, 2))
        try! setBoard.place(mark: .x, on: (2, 0))
        try! setBoard.place(mark: .o, on: (1, 0))
        try! setBoard.place(mark: .o, on: (0, 1))
        try! setBoard.place(mark: .o, on: (1, 1))
        try! setBoard.place(mark: .o, on: (2, 2))
        
        return setBoard
    }
}
