//
//  GameTest.swift
//  TicTacToeTests
//
//  Created by Sergey Osipyan on 2/6/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTest: XCTestCase {
    
    var game: Game!
    
    override func setUp() {
     game = Game()
    }
    
    func testRestart() {
        
        try! game.makeMark(at: (0, 0))
        try! game.makeMark(at: (1, 0))
        try! game.makeMark(at: (1, 1))
        try! game.makeMark(at: (0, 1))
        try! game.makeMark(at: (2, 0))
        try! game.makeMark(at: (0, 2))
        try! game.makeMark(at: (2, 1))
        try! game.makeMark(at: (2, 2))
        try! game.makeMark(at: (1, 2))
        
        game.restart()
        
        XCTAssertFalse(game.gameIsOver)
        XCTAssertTrue(game.activePlayer == .x)
        XCTAssertNil(game.winningPlayer)
        XCTAssertTrue(game.board[(0, 0)] == nil)
        XCTAssertTrue(game.board[(1, 0)] == nil)
        XCTAssertTrue(game.board[(0, 1)] == nil)
        XCTAssertTrue(game.board[(1, 1)] == nil)
        XCTAssertTrue(game.board[(0, 2)] == nil)
        XCTAssertTrue(game.board[(1, 2)] == nil)
        XCTAssertTrue(game.board[(2, 2)] == nil)
        XCTAssertTrue(game.board[(2, 0)] == nil)
        XCTAssertTrue(game.board[(2, 1)] == nil)
        
    }
    
    func testMakeMarkCat() {
        
        if game.board.isFull {
            
        try! game.makeMark(at: (0, 0))
        try! game.makeMark(at: (1, 0))
        try! game.makeMark(at: (1, 1))
        try! game.makeMark(at: (0, 1))
        try! game.makeMark(at: (2, 0))
        try! game.makeMark(at: (0, 2))
        try! game.makeMark(at: (2, 1))
        try! game.makeMark(at: (2, 2))
        try! game.makeMark(at: (1, 2))
        
        XCTAssertNil(game.winningPlayer)
        XCTAssertNil(game.activePlayer)
        XCTAssertTrue(game.gameIsOver)
        
        }
    }
    
}
