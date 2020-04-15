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
        try! game.makeMark(mark: .x, at: (1,1))
        try! game.makeMark(mark: .o, at: (2,0))
        try! game.makeMark(mark: .x, at: (0,1))
        try! game.makeMark(mark: .o, at: (2,1))
        try! game.makeMark(mark: .x, at: (2,2))
        try! game.makeMark(mark: .o, at: (0,0))
        try! game.makeMark(mark: .x, at: (1,0))
        try! game.makeMark(mark: .o, at: (1,2))
        try! game.makeMark(mark: .x, at: (0,2))
        XCTAssertTrue(game.board.isFull)
        game.restart()
        XCTAssertTrue(game.board.noThings)
        
    }

}
