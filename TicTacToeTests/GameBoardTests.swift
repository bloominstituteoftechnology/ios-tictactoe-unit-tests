//
//  GameBoardTests.swift
//  TicTacToeTests
//
//  Created by Nikita Thomas on 12/5/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameBoardTests: XCTestCase {
    
    // board is full
    func testBoardIsFull() {
        var board = GameBoard()
        
        do {
            try board.place(mark: .x, on: (0,0))
            try board.place(mark: .o, on: (1,0))
            try board.place(mark: .x, on: (2,0))
            try board.place(mark: .o, on: (1,1))
            try board.place(mark: .x, on: (0,1))
            try board.place(mark: .o, on: (2,1))
            try board.place(mark: .x, on: (1,2))
            try board.place(mark: .o, on: (0,2))
            try board.place(mark: .x, on: (2,2))
            
            XCTAssert(board.isFull)
        } catch {
            XCTAssert(false)
        }
    }
    
    // duplicate placement of marks on board
    func testDuplicateMarks() {
        var board = GameBoard()
        
        var activeCoor: [Coordinate] = []
        
        
        for _ in 1...1000 {
            let randomCoor: (Int, Int) = ((Int.random(in: 1..<3)), (Int.random(in: 1..<3)))
            
            do {
                try board.place(mark: .x, on: randomCoor)
                activeCoor.append(randomCoor)
            } catch {
                NSLog("error lol")
            }
            
            for x in 1..<3 {
                for y in 1..<3 {
                    
                    if activeCoor.contains(where: {$0 == (x, y)} ) { continue }
                    XCTAssertNil(board[(x, y)])
                }
            }
            
            
            let r1 = Int.random(in: 1..<8)
            let r2 = Int.random(in: 1..<8)
            if r1 == r2 {
                board = GameBoard()
            }
        }
    }
    
    // adding marks on board
    
    func testAddingMarks() {
        
        var board = GameBoard()
        
        // If this throws, test fails
        XCTAssertNoThrow(try board.place(mark: .x, on: (0, 0)))
        // Make sure board has the mark on 0, 0
        XCTAssertEqual(board[(0,0)], .x)
        
        
        // Same thing for (2, 2)
        XCTAssertNoThrow(try board.place(mark: .o, on: (2, 2)))
        XCTAssertEqual(board[(2, 2)], .o)
        
        // Make sure no other marks were placed on board
        for x in 0..<3 {
            for y in 0..<3 {
                
                if (x, y) == (0, 0) { continue }
                if (x, y) == (2, 2) { continue }
                
                // Assume all other sqaures are nil
                // If they aren't, fail the test
                XCTAssertNil(board[(x, y)])
            }
        }
    }
    
    // restart clears board
    
    func testCreatingEmptyBoard() {
        let board = GameBoard()

        // Check every square is empty
        for x in 0..<3 {
            
            for y in 0..<3 {
                
                XCTAssert(board[(x, y)] != nil)
            }
        }
    }
    
    
    
}
