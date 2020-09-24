//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Cora Jacobson on 9/23/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {

    func testRestart() {
        var game = Game(board: GameBoard(), gameIsOver: false)
        game.gameState = .active(.x)
        
        for x in 0..<3 {
            for y in 0..<3 {
                XCTAssertNil(game.board[(x, y)])
            }
        }
        XCTAssertEqual(game.gameState, .active(.x))
    }
    
    func testMakeMark() {
        var game = Game(board: GameBoard(), gameIsOver: false)
        try! game.makeMark(at: (0, 0))
        XCTAssertEqual(game.board[(0, 0)], .x)
        try! game.makeMark(at: (2, 2))
        XCTAssertEqual(game.board[(2, 2)], .o)
        for x in 0..<3 {
            for y in 0..<3 {
                if x == 0 && y == 0 { continue }
                if x == 2 && y == 2 { continue }
                XCTAssertNil(game.board[(x, y)])
            }
        }
        
        try! game.makeMark(at: (2, 2))
        XCTAssertNotEqual(game.board[(2, 2)], .x)
        XCTAssertEqual(game.gameState, .active(.x))
    }
    
    func testIsFullAndCat() {
        var game = Game(board: GameBoard(), gameIsOver: false)
        
        try! game.makeMark(at: (0, 0))
        try! game.makeMark(at: (1, 0))
        try! game.makeMark(at: (2, 0))
        try! game.makeMark(at: (1, 1))
        try! game.makeMark(at: (0, 1))
        try! game.makeMark(at: (2, 1))
        try! game.makeMark(at: (1, 2))
        try! game.makeMark(at: (0, 2))
        XCTAssertFalse(game.board.isFull)
        
        try! game.makeMark(at: (2, 2))
        XCTAssertTrue(game.board.isFull)
        XCTAssertEqual(game.gameState, .cat)
    }
    
    func testXWin() {
        var gameTest = Game(board: GameBoard(), gameIsOver: false)
        
        try! gameTest.makeMark(at: (0, 0))
        try! gameTest.makeMark(at: (1, 0))
        try! gameTest.makeMark(at: (0, 1))
        try! gameTest.makeMark(at: (1, 1))
        try! gameTest.makeMark(at: (0, 2))
        
        XCTAssertEqual(gameTest.gameState, .won(.x))
        XCTAssertTrue(game(board: gameTest.board, isWonBy: .x))
        XCTAssertFalse(game(board: gameTest.board, isWonBy: .o))
    }
    
    func testOWin() {
        var gameTest = Game(board: GameBoard(), gameIsOver: false)
        
        try! gameTest.makeMark(at: (0, 0))
        try! gameTest.makeMark(at: (1, 0))
        try! gameTest.makeMark(at: (2, 0))
        try! gameTest.makeMark(at: (1, 1))
        try! gameTest.makeMark(at: (0, 2))
        try! gameTest.makeMark(at: (1, 2))
        
        XCTAssertEqual(gameTest.gameState, .won(.o))
        XCTAssertTrue(game(board: gameTest.board, isWonBy: .o))
        XCTAssertFalse(game(board: gameTest.board, isWonBy: .x))
    }
    
    func testIncompleteGame() {
        var gameTest = Game(board: GameBoard(), gameIsOver: false)
        
        try! gameTest.makeMark(at: (0, 0))
        try! gameTest.makeMark(at: (1, 0))
        try! gameTest.makeMark(at: (0, 1))
        try! gameTest.makeMark(at: (1, 1))
        
        XCTAssertEqual(gameTest.gameState, .active(.x))
        XCTAssertFalse(game(board: gameTest.board, isWonBy: .x))
        XCTAssertFalse(game(board: gameTest.board, isWonBy: .o))
    }
    
    func testUndo() {
        var gameTest = Game(board: GameBoard(), gameIsOver: false)
        
        try! gameTest.makeMark(at: (0, 0))
        gameTest.undo()
        
        XCTAssertNotEqual(gameTest.board[(0, 0)], .x)
        XCTAssertEqual(gameTest.gameState, .active(.x))
    }

}
