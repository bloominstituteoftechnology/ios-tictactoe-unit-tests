//
//  GameATests.swift
//  TicTacToeTests
//
//  Created by Lambda_School_Loaner_34 on 3/6/19.
//  Copyright © 2019 Lambda School. All rights reserved.
// https://www.youtube.com/playlist?list=PLLYKjb-Uo9cyT50tNpfktKqEtKx8YOdkn

import XCTest
@testable import TicTacToe

//TDD or Test Driven Development

class GameATests: XCTestCase {

    func testMethod() {
        //arrange, set up values we need
        
        //act, method being tested
        
        //assert, verifying that we were adding works XCTasserts
        
    }
    
    //RED, GREEN, REFACTOR loop
    //red = failing test (compile fail or assert fail)
    //green = writing logic to pass the test
    //refactor = cleaning up
    
    //(0, 0) = top left
    //(0, 1)
    //(0, 2)
    
    func testWinCheckingVertical1() throws {
        
/*      x o -
        x o -
        x - -
 */
        //arrange
        var board = GameBoard()
        //act
        try board.place(mark: .x, on: (0, 0))
        try board.place(mark: .o, on: (1, 0))
        try board.place(mark: .x, on: (0, 1))
        try board.place(mark: .o, on: (1, 1))
        try board.place(mark: .x, on: (0, 2))
        //assert
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    
    func testWinCheckingVertical2() throws {
        /*
        x o -
        x o -
        - o -
        */
        //arrange
        var board = GameBoard()
        //act
        try board.place(mark: .o, on: (1, 0))
        try board.place(mark: .x, on: (0, 0))
        try board.place(mark: .o, on: (1, 1))
        try board.place(mark: .x, on: (0, 1))
        try board.place(mark: .o, on: (1, 2))
        //assert
        XCTAssertTrue(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
    }
    func testWinCheckingHorizontal1() throws {
        
        /*
         x x x
         - o -
         o - -
        */
        
        //arrange
        var board = GameBoard()
        //act
        try board.place(mark: .x, on: (0, 0))
        try board.place(mark: .o, on: (0, 2))
        try board.place(mark: .x, on: (1, 0))
        try board.place(mark: .o, on: (1, 1))
        try board.place(mark: .x, on: (2, 0))
        //assert
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
}
