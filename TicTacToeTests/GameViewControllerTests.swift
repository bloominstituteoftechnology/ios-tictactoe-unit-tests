//
//  GameViewControllerTests.swift
//  TicTacToeTests
//
//  Created by Sameera Roussi on 6/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe // Import references to the TicTacToe game

class GameViewControllerTests: XCTestCase {

    // MARK: - Insure new, empty game board instance has been created
    func testCreationOfNewGameBoard() {
        
        var board = GameBoard()
        
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .x, on: (0, 2))

        // Test for a new instance of a clear game board
        for x in 0 ..< 3 {
            for y in 0 ..< 3 {
                let coordinate = (x, y)
                print("The coordinate is: \(coordinate)")
                // Get the mark that is at coordinate
                let mark = board[coordinate]
                // Test Assertion that the coordinate is empty
                XCTAssertNil(mark, "The game board square at coordinate \(coordinate) is not empty")
            }
        }
        
    }
    
    // TODO: - Insure all squares filled in cat's game
    func testCanPlaceMarks() {
        var board = GameBoard()
        
        // Place a mark at (1, 1)
        XCTAssertNoThrow(try board.place(mark: .x, on: (1, 1)))
        
        // Check that the mark is now an X at that coordinate
        let mark = board[(1, 1)]
        
        XCTAssertEqual(mark, .x)
        
        // "" at (2, 2)
        XCTAssertNoThrow(try board.place(mark: .o, on: (2, 2)))
        
        // "" is now an O
        XCTAssertEqual(board[(2, 2)], .o)
    }
    
}
