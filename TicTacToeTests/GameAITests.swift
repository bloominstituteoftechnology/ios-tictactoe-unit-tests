//
//  GameAITests.swift
//  TicTacToeTests
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameAITests: XCTestCase {
    
    // MARK: - Setup
    
    typealias MarkPlacement = (coord: Coordinate, mark: GameBoard.Mark)
    
    var board: GameBoard!
    
    override func setUp() {
        board = GameBoard()
    }
    
    // MARK: - Tests
    
    func testWinCheckingVerticals() {
        /*
        x o -
        x o -
        x - -   ...etc
        */
        for x in 0..<3 {
            func makePlacementsAndCheckWin(for player: GameBoard.Mark) {
                let placements: [MarkPlacement] = [
                    (mark: player, coord: (x, 0)),
                    (mark: player.other, coord: ((x + 1) % 3, 0)),
                    (mark: player, coord: (x, 1)),
                    (mark: player.other, coord: ((x + 1) % 3, 1)),
                    (mark: player, coord: (x, 2))
                ]
                XCTAssertFalse(game(board: board, isWonBy: .x))
                XCTAssertFalse(game(board: board, isWonBy: .o))
                XCTAssertFalse(board.isFull)
                placeMarks(placements)
                
                let failureMessage = "Failed for x = \(x), player = \(player.stringValue)"
                XCTAssertTrue(game(board: board, isWonBy: player), failureMessage)
                XCTAssertFalse(game(board: board, isWonBy: player.other), failureMessage)
                
                board = GameBoard()
            }
            makePlacementsAndCheckWin(for: .x)
            makePlacementsAndCheckWin(for: .o)
        }
    }
    
    func testWinCheckingHorizontals() {
        /*
         - o -
         x x x
         o - -
         */
        for y in 0..<3 {
            func makePlacementsAndCheckWin(for player: GameBoard.Mark) {
                let placements: [MarkPlacement] = [
                    (mark: player, coord: (0, y)),
                    (mark: player.other, coord: (0, (y + 1) % 3)),
                    (mark: player, coord: (1, y)),
                    (mark: player.other, coord: (1, (y + 1) % 3)),
                    (mark: player, coord: (2, y))
                ]
                XCTAssertFalse(game(board: board, isWonBy: .x))
                XCTAssertFalse(game(board: board, isWonBy: .o))
                XCTAssertFalse(board.isFull)
                placeMarks(placements)
                
                let failureMessage = "Failed for y = \(y), player = \(player.stringValue)"
                XCTAssertTrue(game(board: board, isWonBy: player), failureMessage)
                XCTAssertFalse(game(board: board, isWonBy: player.other), failureMessage)
                
                board = GameBoard()
            }
            makePlacementsAndCheckWin(for: .x)
            makePlacementsAndCheckWin(for: .o)
        }
    }
    
    func testWinCheckingDiagonals() {
        func makePlacementsAndCheckWin(for player: GameBoard.Mark, ltr: Bool) {
            let placements: [MarkPlacement] = [
                (mark: player, coord: ltr ? (0,0) : (2,0)),
                (mark: player, coord: (1,1)),
                (mark: player, coord: ltr ? (2,2) : (0,2)),
                (mark: player.other, coord: (1,0)),
                (mark: player.other, coord: (1,2))
            ]
            XCTAssertFalse(game(board: board, isWonBy: .x))
            XCTAssertFalse(game(board: board, isWonBy: .o))
            XCTAssertFalse(board.isFull)
            placeMarks(placements)
            
            let failureMessage = "Failed for \(ltr ? "ltr" : "rtl"), player = \(player.stringValue)"
            XCTAssertTrue(game(board: board, isWonBy: player), failureMessage)
            XCTAssertFalse(game(board: board, isWonBy: player.other), failureMessage)
            
            board = GameBoard()
        }
        makePlacementsAndCheckWin(for: .x, ltr: true)
        makePlacementsAndCheckWin(for: .x, ltr: false)
        makePlacementsAndCheckWin(for: .o, ltr: true)
        makePlacementsAndCheckWin(for: .o, ltr: false)
    }
    
    func testIncompleteGame() {
        XCTAssertFalse(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
        XCTAssertFalse(board.isFull)
        
        func checkIncomplete(for startingMark : GameBoard.Mark) {
            var currentMark = startingMark
            loopThroughBoard { (x, y) in
                if (x,y) == (1,1) { return }
                else { try! board.place(mark: currentMark, on: (x, y)) }
                currentMark.toggle()
                
                XCTAssertFalse(game(board: board, isWonBy: .x))
                XCTAssertFalse(game(board: board, isWonBy: .o))
                XCTAssertFalse(board.isFull)
            }
            board = GameBoard()
        }
        
        checkIncomplete(for: .x)
        checkIncomplete(for: .o)
    }

    func testCatsGame() {
    }
    
    // MARK: - Helper Methods
    
    func placeMarks(_ placements: [MarkPlacement]) {
        for placement in placements {
            try! board.place(mark: placement.mark, on: placement.coord)
        }
    }
    
    func loopThroughBoard(completion: (Coordinate) -> Void) {
        for x in 0..<3 {
            for y in 0..<3 {
                completion((x,y))
            }
        }
    }
}
