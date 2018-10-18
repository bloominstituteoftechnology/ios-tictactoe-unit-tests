//
//  GameBoardUITests.swift
//  TicTacToeUITests
//
//  Created by Dillon McElhinney on 10/18/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class GameBoardUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    /// Tests a win for player x in the left vertical column
    func testVerticalWin0() {
        /*
         x o - | 0 1 2
         x o - | 3 4 5
         x - - | 6 7 8
         */
        
        GamePage(testCase: self)
        .tapOnSquare(0)
        .tapOnSquare(1)
        .tapOnSquare(3)
        .tapOnSquare(4)
        .tapOnSquare(6)
        .verifyPlayerWin(player: .x)
    }

}
