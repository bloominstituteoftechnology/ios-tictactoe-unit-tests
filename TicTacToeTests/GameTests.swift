//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Austin Cole on 1/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {
    
    var board: GameBoard?
    override func setUp() {
        userGame = Game(board: GameBoard(), gameState: .active(.x), activePlayer: .x, gameIsOver: false, winningPlayer: nil)
        board = userGame?.board
    }

    func testRestart() {
        do {
        try board!.place(mark: .o, on: (0, 0))
        try board!.place(mark: .o, on: (0, 1))
        try board!.place(mark: .o, on: (0, 2))
        try board!.place(mark: .o, on: (1, 0))
        try board!.place(mark: .o, on: (1, 1))
        try board!.place(mark: .o, on: (1, 2))
        try board!.place(mark: .o, on: (2, 0))
        try board!.place(mark: .o, on: (2, 1))
        try board!.place(mark: .o, on: (2, 2))
        } catch {
            NSLog("Failed to place marks in GameTests.testRestart: \(error)")
        }
        
        board = GameBoard()
        activePlayer = .x
        
        XCTAssertFalse(!board!.isEmpty)
        XCTAssertFalse(activePlayer != .x)
    }
    
    func testMakeMark() {
        do {
        try userGame?.makeMark(at: (1, 1))
        } catch {
            NSLog("Could not make mark in GameTests.testMakeMark: \(error)")
        }
        XCTAssertFalse((board![(0, 0)] != nil))
    }
    
    func testGameIsOver() {
        XCTAssertFalse((userGame?.gameIsOver)!)
        do {
            try userGame?.makeMark(at: (0, 0))
            try userGame?.makeMark(at: (1, 1))
            try userGame?.makeMark(at: (0, 1))
            XCTAssertFalse((userGame?.gameIsOver)!)
            try userGame?.makeMark(at: (2, 1))
            try userGame?.makeMark(at: (0, 2))
        } catch {
            NSLog("Unable to place marks GameTests.testGameisOver: \(error)")
        }
        XCTAssertTrue(userGame?.gameIsOver == true)
    }
    
    func testActivePlayer() {
        do {
            XCTAssertTrue(userGame?.activePlayer == .x, "currently active player is \(userGame?.activePlayer)")
            try userGame?.makeMark(at: (0, 0))
            XCTAssertTrue(userGame?.activePlayer == .o, "currently active player is \(userGame?.activePlayer)")
            try userGame?.makeMark(at: (1, 1))
            XCTAssertTrue(userGame?.activePlayer == .x, "currently active player is \(userGame?.activePlayer)")
            try userGame?.makeMark(at: (0, 1))
            XCTAssertTrue(userGame?.activePlayer == .o, "currently active player is \(userGame?.activePlayer)")
            try userGame?.makeMark(at: (2, 1))
            XCTAssertTrue(userGame?.activePlayer == .x, "currently active player is \(userGame?.activePlayer)")
            try userGame?.makeMark(at: (0, 2))
        } catch {
            NSLog("Unable to place marks GameTests.testGameisOver: \(error)")
        }
        XCTAssertNil(userGame?.activePlayer, "currently active player is \(userGame?.activePlayer)")
        
        userGame?.restart()
        
        do {
            try userGame?.makeMark(at: (0, 0))
            try userGame?.makeMark(at: (0, 1))
            try userGame?.makeMark(at: (0, 2))
            try userGame?.makeMark(at: (1, 0))
            try userGame?.makeMark(at: (1, 1))
            try userGame?.makeMark(at: (1, 2))
            try userGame?.makeMark(at: (2, 0))
            try userGame?.makeMark(at: (2, 1))
            try userGame?.makeMark(at: (2, 2))
        } catch {
            NSLog("Unable to place marks GameTests.testGameisOver: \(error)")
        }
        XCTAssertNil(userGame?.activePlayer, "currently active player is \(userGame?.activePlayer)")
        
    }
    
    private var userGame: Game?
    private var  activePlayer: GameBoard.Mark?
}
