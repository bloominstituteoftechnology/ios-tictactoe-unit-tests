//
//  TicTacToeTests.swift
//  TicTacToeTests
//
//  Created by Jessie Ann Griffin on 4/13/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe // because it's a completely separate bundle

class TicTacToeTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // XCTAssert(false) <- forces fail
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testPlacingXOnEmptySquare() {
        
        // Place an X on an empty square (0,0)
        var board = GameBoard() // always begin with a constant and move to variable as needed
        
        // try! board.place(mark: .x, on: (0,0)) // -> always crashes if it fails
        XCTAssertNoThrow(try! board.place(mark: .x, on: (0,0)))
        // XCTAssertThrowsError(try! board.place(mark: .x, on: (0,0))) // Assert crashes in debug/testing expects an error
        
        // If the X was placed, I want to fetch the mark on (0,0)
        let markOnEmptySquare = board[(0,0)]!
        
        // If I could fetch the mark, I want to make sure that the mark is an X
        XCTAssert(markOnEmptySquare == .x, "The mark placed is different than mark requested")
        
        // XCTAssertNotNil(markOnEmptySpace)
    }
}
