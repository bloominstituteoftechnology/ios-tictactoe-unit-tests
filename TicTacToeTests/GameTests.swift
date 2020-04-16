//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Bradley Diroff on 4/15/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {

    func testRestart() {
        var game = Game()
        try! game.makeMark(at: (1,1))
        try! game.makeMark(at: (2,0))
        try! game.makeMark(at: (0,1))
        try! game.makeMark(at: (2,1))
        try! game.makeMark(at: (2,2))
        try! game.makeMark(at: (0,0))
        try! game.makeMark(at: (1,0))
        try! game.makeMark(at: (1,2))
        try! game.makeMark(at: (0,2))
        XCTAssertTrue(game.board.isFull)
        game.restart()
        XCTAssertTrue(game.board.noThings)
        
    }
    
    func testVerticalWin() {
        var game = Game()
        /*
        x o -
        x o -
        x - -
        
        */
        try! game.makeMark(at: (0,0))
        try! game.makeMark(at: (1,0))
        try! game.makeMark(at: (0,1))
        try! game.makeMark(at: (1,1))
        try! game.makeMark(at: (0,2))
        XCTAssertTrue(gameai(board: game.board, isWonBy: .x))
        XCTAssertFalse(gameai(board: game.board, isWonBy: .o))
        XCTAssertTrue(game.gameIsOver)
        
        game.restart()
        
        /*
        - o x
        - o x
        - - x
        
        */
        
        try! game.makeMark(at: (2,0))
        try! game.makeMark(at: (1,0))
        try! game.makeMark(at: (2,1))
        try! game.makeMark(at: (1,1))
        try! game.makeMark(at: (2,2))
        XCTAssertTrue(gameai(board: game.board, isWonBy: .x))
        XCTAssertFalse(gameai(board: game.board, isWonBy: .o))
        XCTAssertTrue(game.gameIsOver)
        
    }

}
