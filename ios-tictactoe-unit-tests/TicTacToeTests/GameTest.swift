//
//  GameTest.swift
//  TicTacToeTests
//
//  Created by Nick Nguyen on 3/18/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTest: XCTestCase {
 
    
    func testXWins() {
        
           var game = Game()
           
           try! game.makeMark(at: (0, 0))  
           try! game.makeMark(at: (2, 0))
           try! game.makeMark(at: (2, 2))
           try! game.makeMark(at: (1, 2))
           try! game.makeMark(at: (1, 1))
           
           XCTAssertTrue(game.gameIsOver)
           XCTAssertNil(game.activePlayer)
           XCTAssertEqual(game.winningPlayer, .x)
        
    }
    
    func testOWins() {
          var game = Game()
          
          try! game.makeMark(at: (1, 0))  // x
          try! game.makeMark(at: (1, 1))  // o
          try! game.makeMark(at: (0, 0))  // x
          try! game.makeMark(at: (2, 0))  // o
          try! game.makeMark(at: (1, 2))  // x
          try! game.makeMark(at: (0, 2))  // o
          
          XCTAssertTrue(game.gameIsOver)
          XCTAssertNil(game.activePlayer)
          XCTAssertEqual(game.winningPlayer, .o)
      }
    
    
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

        XCTAssertFalse(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }

    func testInProgressGame() {
          var game = Game()
          
          try! game.makeMark(at: (1, 0))
          try! game.makeMark(at: (1, 1))
          try! game.makeMark(at: (0, 0))  
          
          XCTAssertFalse(game.gameIsOver)
          XCTAssertEqual(game.activePlayer, .o)
          XCTAssertNil(game.winningPlayer)
      }
    
    
    func testPlacingMarks() {
              var board = GameBoard()

              XCTAssertNoThrow(try board.place(mark: .o, on: (0, 0)))

              XCTAssertEqual(board[(0, 0)], .o)
              XCTAssertNoThrow(try board.place(mark: .x, on: (2, 2)))
              XCTAssertEqual(board[(2, 2)], .x)

              XCTAssertThrowsError(try board.place(mark: .o, on: (2, 2)))
              XCTAssertEqual(board[(2, 2)], .x)
              for y in 0...2 {
                  for x in 0...2 {
                      if x == 0 && y == 0 { continue }
                      if x == 2 && y == 2 { continue }
                      XCTAssertNil(board[(x, y)], ":warning: The entry at (\(x), \(y)) was \(board[(x, y)]!) instead of nil :(.")
                  }
              }
              XCTAssertThrowsError(try board.place(mark: .o, on: (2, 2))) { (error) in
                  XCTAssertEqual(error as? GameBoardError, GameBoardError.invalidSquare)
              }
          }
    
}
