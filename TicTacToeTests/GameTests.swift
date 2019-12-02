//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Joel Groomer on 12/1/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {

    func testMoveOrder() {
        var game = Game()
        
        // first move X
        XCTAssertNoThrow(try! game.makeMark(at: (0, 0)))
        XCTAssertEqual(game.board[(0, 0)], GameBoard.Mark.x)
        
        // second move O
        XCTAssertNoThrow(try! game.makeMark(at: (0, 1)))
        XCTAssertEqual(game.board[(0, 1)], GameBoard.Mark.o)
        
        // third move X
        XCTAssertNoThrow(try! game.makeMark(at: (0, 2)))
        XCTAssertEqual(game.board[(0, 2)], GameBoard.Mark.x)
        
        // fourth move O
        XCTAssertNoThrow(try! game.makeMark(at: (1, 1)))
        XCTAssertEqual(game.board[(1, 1)], GameBoard.Mark.o)
    }

    func testGameWon() {
        var game = Game()
        
        try! game.makeMark(at: (0, 0))
        try! game.makeMark(at: (0, 1))
        try! game.makeMark(at: (1, 1))
        try! game.makeMark(at: (0, 2))
        try! game.makeMark(at: (2, 2))
        
        XCTAssertEqual(game.gameIsOver, true)
        XCTAssertEqual(game.winningPlayer, GameBoard.Mark.x)
    }
    
    func testCatsGame() {
        var game = Game()
        
        try! game.makeMark(at: (0, 0)) // X
        try! game.makeMark(at: (0, 1)) // O
        try! game.makeMark(at: (0, 2)) // X
        try! game.makeMark(at: (1, 1)) // O
        try! game.makeMark(at: (1, 0)) // X
        try! game.makeMark(at: (2, 0)) // O
        try! game.makeMark(at: (2, 2)) // X
        try! game.makeMark(at: (1, 2)) // O
        try! game.makeMark(at: (2, 1)) // X
        
        XCTAssertEqual(game.gameIsOver, true)
        XCTAssertEqual(game.board.isFull, true)
        XCTAssertNil(game.winningPlayer)
    }
}
