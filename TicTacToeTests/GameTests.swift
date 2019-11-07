//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by macbook on 11/6/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {
    
    
    
    func testMakingMark() {
        var game = Game()
        try! game.makeMark(at: (0, 0))
        XCTAssertNoThrow(try! game.makeMark(at: (0, 0)))
        XCTAssertNoThrow(try! game.makeMark(at: (0, 1)))
        XCTAssertNoThrow(try! game.makeMark(at: (0, 2)))
        
    }
    
    func testGameWithWin() {
        
        var board = GameBoard()
        
        try! board.place(mark: .x, on: (0, 2))
        try! board.place(mark: .o, on: (0, 0))
        try! board.place(mark: .x, on: (1, 2))
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .x, on: (2, 2))
        
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
        
    }
    
    func testCatGame() {
        
        var board = GameBoard()
        
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (0, 1))
        try! board.place(mark: .x, on: (1, 0))
        try! board.place(mark: .o, on: (2, 0))
        try! board.place(mark: .x, on: (0, 2))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (2, 1))
        try! board.place(mark: .o, on: (1, 2))
        try! board.place(mark: .x, on: (2, 2))
        XCTAssertTrue(board.isFull)
        
        XCTAssertFalse(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    
    func testNewGame() {
        let game = Game()
        XCTAssertFalse(game.gameIsOver)
        XCTAssertNotNil(game.activePlayer)
        XCTAssertNil(game.winningPlayer)
    }
    
    func testRestartWithNoWin() {
        var board = GameBoard()
        var game = Game()
        
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (0, 1))
        
        XCTAssertFalse(game.gameIsOver)
        XCTAssertNil(game.winningPlayer)
        
        
    }
    
    
    
    
    
    
    
    
    
    //    override func setUp() {
    //        // Put setup code here. This method is called before the invocation of each test method in the class.
    //    }
    //
    //    override func tearDown() {
    //        // Put teardown code here. This method is called after the invocation of each test method in the class.
    //    }
    //
    //    func testExample() {
    //        // This is an example of a functional test case.
    //        // Use XCTAssert and related functions to verify your tests produce the correct results.
    //    }
    //
    //    func testPerformanceExample() {
    //        // This is an example of a performance test case.
    //        self.measure {
    //            // Put the code you want to measure the time of here.
    //        }
    //    }
    
}
