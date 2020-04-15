//
//  GameAITests.swift
//  TicTacToeTests
//
//  Created by Jessie Ann Griffin on 4/13/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameAITests: XCTestCase {

    func testWinningConditionForXTopRow() {
        winningConditionForTopRow(mark: .x)
//        var board = GameBoard()
//
//        XCTAssertNoThrow(try! board.place(mark: .x, on: (0,0)))
//        XCTAssertNoThrow(try! board.place(mark: .x, on: (1,0)))
//        XCTAssertNoThrow(try! board.place(mark: .x, on: (2,0)))
//
//        let xPlayerDidWin = game(board: board, isWonBy: .x)
//        XCTAssert(xPlayerDidWin)
    }
    
    func testWinningConditionForOTopRow() {
        winningConditionForTopRow(mark: .o)
//        var board = GameBoard()
//
//        XCTAssertNoThrow(try! board.place(mark: .o, on: (0,0)))
//        XCTAssertNoThrow(try! board.place(mark: .o, on: (1,0)))
//        XCTAssertNoThrow(try! board.place(mark: .o, on: (2,0)))
//
//        let oPlayerDidWin = game(board: board, isWonBy: .o)
//        XCTAssert(oPlayerDidWin)
    }
    
    func testTopRowFilledNoWin() {
        
    }
    
    func winningConditionForTopRow(mark: GameBoard.Mark) {
        var board = GameBoard()
        
        XCTAssertNoThrow(try! board.place(mark: mark, on: (0,0)))
        XCTAssertNoThrow(try! board.place(mark: mark, on: (1,0)))
        XCTAssertNoThrow(try! board.place(mark: mark, on: (2,0)))
        
        let markPlayerDidWin = game(board: board, isWonBy: mark)
        XCTAssert(markPlayerDidWin)
        
    }
}
