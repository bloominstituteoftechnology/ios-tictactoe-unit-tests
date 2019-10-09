//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Jordan Christensen on 10/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {
    func testGameRestarted() {
        var game = Game(board: GameBoard(), gameIsOver: true, winningPlayer: .x)
        let coordinate: Coordinate = (1, 1)
        
        XCTAssertNoThrow(try! game.makeMark(at: coordinate))
        game.restart()
        
        for x in 0..<3 {
            for y in 0..<3 {
                XCTAssertEqual(game.board[(x, y)], nil)
            }
        }
    }
    
    func testGameMakeMark() {
        var game = Game(board: GameBoard(), gameIsOver: false, winningPlayer: nil)
        let coordinate: Coordinate = (1, 1)
        
        XCTAssertNoThrow(try! game.makeMark(at: coordinate))
        XCTAssertTrue(game.board[coordinate] != nil)
    }
    
    func testGameIsOver() {
        var game = Game(board: GameBoard(), gameIsOver: false, winningPlayer: nil)
        
        try! game.makeMark(at: (0, 0))
        try! game.makeMark(at: (0, 1))
        try! game.makeMark(at: (1, 0))
        try! game.makeMark(at: (2, 0))
        try! game.makeMark(at: (0, 2))
        try! game.makeMark(at: (1, 1))
        try! game.makeMark(at: (2, 1))
        try! game.makeMark(at: (1, 2))
        try! game.makeMark(at: (2, 2))
        
        XCTAssertTrue(game.isGameOver())
    }
    
    func testXWin() {
        var game = Game(board: GameBoard(), gameIsOver: false, winningPlayer: nil)
        
        try! game.makeMark(at: (0, 0))
        try! game.makeMark(at: (1, 0))
        try! game.makeMark(at: (0, 1))
        try! game.makeMark(at: (1, 1))
        try! game.makeMark(at: (0, 2))
        
        XCTAssertTrue(game.isGameOver())
        XCTAssertEqual(GameBoard.Mark.x, game.getWinningPlayer())
    }
    
    func testOWin() {
        var game = Game(board: GameBoard(), gameIsOver: false, winningPlayer: nil)
        
        try! game.makeMark(at: (0, 0))
        try! game.makeMark(at: (1, 0))
        try! game.makeMark(at: (0, 1))
        try! game.makeMark(at: (1, 1))
        try! game.makeMark(at: (2, 0))
        try! game.makeMark(at: (1, 2))
        
        XCTAssertTrue(game.isGameOver())
        XCTAssertEqual(GameBoard.Mark.o, game.getWinningPlayer())
    }
    
    func testGetCurrentPlayerX() {
        var game = Game(board: GameBoard(), gameIsOver: false, winningPlayer: nil)
        
        try! game.makeMark(at: (0, 0))
        try! game.makeMark(at: (0, 1))
        
        XCTAssertEqual(GameBoard.Mark.x, game.getCurrentPlayer())
    }
    
    func testGetCurrentPlayerO() {
        var game = Game(board: GameBoard(), gameIsOver: false, winningPlayer: nil)
        
        try! game.makeMark(at: (0, 0))
        
        XCTAssertEqual(GameBoard.Mark.o, game.getCurrentPlayer())
    }
}
