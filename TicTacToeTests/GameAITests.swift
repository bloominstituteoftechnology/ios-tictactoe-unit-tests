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
    var board = GameBoard()
    
    func newGame() {
        var board = GameBoard()
    }

    func markO(x: Int, y: Int) {
        try! board.place(mark: .o, on: (x, y))
    }
    
    func markX(x: Int, y: Int) {
        try! board.place(mark: .x, on: (x, y))    }
    
    func xWins() {
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    
    func oWins() {
        XCTAssertTrue(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
    }
    
    func noWin() {
        XCTAssertFalse(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    
    func testWinCheckingVertical1() {
        /*
        x o -
        x o -
        x - -
        */
        newGame()
        markX(x: 0, y: 0)
        markO(x: 1, y: 0)
        markX(x: 0, y: 1)
        markO(x: 1, y: 1)
        markX(x: 0, y: 2)

        xWins()
    }
    
    func testWinCheckingVertical2() {
        /*
         x o -
         x o -
         - o -
         */
        newGame()
        markO(x: 1, y: 0)
        markX(x: 0, y: 0)
        markO(x: 1, y: 1)
        markX(x: 0, y: 1)
        markO(x: 1, y: 2)

        oWins()
    }
    
    func testWinCheckingVertical3() {
        /*
        - o x
        - o x
        - - x
        */
        newGame()
        markX(x: 2, y: 0)
        markO(x: 1, y: 0)
        markX(x: 2, y: 1)
        markO(x: 1, y: 1)
        markX(x: 2, y: 2)

        xWins()
    }
    
    func testWinCheckingHorizontal1() {
        /*
         o o o
         x x -
         - - -
         */
        newGame()
        markO(x: 0, y: 0)
        markX(x: 0, y: 1)
        markO(x: 1, y: 0)
        markX(x: 1, y: 1)
        markO(x: 2, y: 0)
        
        oWins()
    }
    
    func testWinCheckingHorizontal2() {
        /*
         - o -
         x x x
         o - -
         */
        newGame()
        markX(x: 0, y: 1)
        markO(x: 1, y: 0)
        markX(x: 1, y: 1)
        markO(x: 0, y: 2)
        markX(x: 2, y: 1)

        xWins()
    }
    
    func testWinCheckingHorizontal3() {
        /*
         x - -
         - x -
         o o o
         */
        newGame()
        markO(x: 0, y: 2)
        markX(x: 0, y: 0)
        markO(x: 1, y: 2)
        markX(x: 1, y: 1)
        markO(x: 2, y: 2)
        
        oWins()
    }
    
    func testWinCheckingDiagonal1() {
        /*
         x - -
         - x -
         o o x
         */
        newGame()
        markX(x: 0, y: 0)
        markO(x: 0, y: 2)
        markX(x: 1, y: 1)
        markO(x: 1, y: 2)
        markX(x: 2, y: 2)
        
        xWins()
    }
    
    func testWinCheckingDiagonal2() {
        /*
         x - o
         - o -
         o x -
         */
        newGame()
        markO(x: 2, y: 0)
        markX(x: 0, y: 0)
        markO(x: 1, y: 1)
        markX(x: 1, y: 2)
        markO(x: 0, y: 2)
        
        oWins()
    }
    
    func testIncompleteGame() {
        /*
         x - o
         - x -
         - o -
         */
        newGame()
        markX(x: 0, y: 0)
        markO(x: 2, y: 0)
        markX(x: 1, y: 1)
        markO(x: 1, y: 2)
        noWin()
    }

    func testCatsGame() {
        /*
         x o x
         o x o
         o x o
         */
        newGame()
        markO(x: 0, y: 2)
        markX(x: 1, y: 1)
        markO(x: 0, y: 1)
        markX(x: 0, y: 0)
        markO(x: 2, y: 2)
        markX(x: 1, y: 2)
        markO(x: 1, y: 0)
        markX(x: 2, y: 0)
        markO(x: 2, y: 1)
        noWin()
    }
}
