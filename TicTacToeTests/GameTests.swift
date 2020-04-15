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
        try! game.board.place(mark: .x, on: (1, 1))
        try! game.board.place(mark: .o, on: (2, 0))
        try! game.board.place(mark: .x, on: (0, 1))
        try! game.board.place(mark: .o, on: (2, 1))
        try! game.board.place(mark: .x, on: (2, 2))
        try! game.board.place(mark: .o, on: (0, 0))
        try! game.board.place(mark: .x, on: (1, 0))
        try! game.board.place(mark: .o, on: (1, 2))
        try! game.board.place(mark: .x, on: (0, 2))
        
    }

}
