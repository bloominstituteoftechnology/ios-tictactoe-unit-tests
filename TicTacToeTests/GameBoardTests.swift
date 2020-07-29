//
//  GameBoardTests.swift
//  TicTacToeTests
//
//  Created by Bronson Mullens on 7/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameBoardTests: XCTestCase {
    
    // GOAL: Make sure the board is empty right after it is initialized
    
    func testCreatingEmptyBoard() {
        let board = GameBoard()
        
        for x in 0..<3 {
            for y in 0..<3 {
                
                let square = board[(x, y)]
                
                // We assume nil because square does
                // not contain x or y marks
                XCTAssert(square == nil)
                
            }
        }
    }
    
    func testPlacingMarks() {
         
    }

}
