//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Bradley Diroff on 5/13/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {
    
    func testActivePlayer() throws {
        var game = Games()
        XCTAssertEqual(game.activePlayer, .x)
        
        try game.makeMark(at: (0,1))
        XCTAssertEqual(game.activePlayer, .o)
    }
    
    func testWinningPlayer() throws {
        var game = Games()
        try game.makeMark(at: (0,0))
        try game.makeMark(at: (1,0))
        try game.makeMark(at: (0,1))
        try game.makeMark(at: (1,1))
        try game.makeMark(at: (0,2))
        XCTAssertEqual(game.winningPlayer, .x)
        
        game.restart()
        
        try game.makeMark(at: (0,0))
        try game.makeMark(at: (1,0))
        try game.makeMark(at: (2,0))
        try game.makeMark(at: (1,1))
        try game.makeMark(at: (0,1))
        try game.makeMark(at: (1,2))
        XCTAssertEqual(game.winningPlayer, .o)
//        try! board.place(mark: .o, on: (1, 0))
//        try! board.place(mark: .x, on: (0, 0))
//        try! board.place(mark: .o, on: (1, 1))
//        try! board.place(mark: .x, on: (0, 1))
//        try! board.place(mark: .o, on: (1, 2))
    //    XCTAssertEqual(game.winningPlayer, .o)
    }

    func testRestart() throws {
        var game = Games()
        try game.makeMark(at: (0,0))
        try game.makeMark(at: (1,0))
        try game.makeMark(at: (0,1))
        try game.makeMark(at: (1,1))
        try game.makeMark(at: (0,2))
        
        game.restart()
        
        XCTAssertTrue(game.board.isEmpty)
        
    }
    
}
