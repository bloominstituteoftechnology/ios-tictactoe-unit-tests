//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Norlan Tibanear on 9/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

@testable import TicTacToe

class GameTests: XCTestCase {

    func testRestartGame() {
       
        var game = Game()
        var board = game.board
        
        try! board.place(mark: .x, on: (0, 0))
        
        XCTAssertEqual(board[(0, 0)], .x)
        
    }//
    
    
    func testMark() throws {
       
        var game = Game()
        
        try game.makeMark(at: (0, 0))
        try game.makeMark(at: (0, 2))
        XCTAssertEqual(game.board[(0, 0)], .x)
        XCTAssertEqual(game.board[(0, 2)], .o)
        
    }//
    
    func testCatsGame() {
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
        XCTAssertFalse(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
    }//
    
    
    func testCreatingEmptyBoard() {
          let board = GameBoard()
          
          for x in 0..<3 {
              for y in 0..<3 {
                  XCTAssertNil(board[(x, y)])
              }
          }
      }
    

} //
