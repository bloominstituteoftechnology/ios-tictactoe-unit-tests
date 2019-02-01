//
//  TicTacToeUITests.swift
//  TicTacToeUITests
//
//  Created by Benjamin Hakes on 1/31/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

class TicTacToeUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

//    func testExample() {
//        // Use recording to get started writing UI tests.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        
//        let app = XCUIApplication()
//        
//        
//        let button = app.buttons[" "]
//        
//        print(app)
//    }
//
//    func testPlacingMarks() {
//
//        GamePage(testCase: self)
//
//    }
    
    func testWinCheckingVertical1(){
        
        /*
         0 1 2
         3 4 5
         6 7 8
         */
        
        /*
         x o -
         x o -
         x - -
         */
        
        GamePage(testCase: self)
        .tapOnSquare(at: 0)
        .tapOnSquare(at: 1)
        .tapOnSquare(at: 3)
        .tapOnSquare(at: 4)
        .tapOnSquare(at: 6)
        .verifyWinner(player: .x)
        
    }
    
    func testGameBoardRestart(){
        
        /*
         0 1 2
         3 4 5
         6 7 8
         */
        
        /*
         x o -
         x o -
         x - -
         */
        
        GamePage(testCase: self)
            .tapOnSquare(at: 0)
            .tapOnSquare(at: 1)
            .tapOnSquare(at: 3)
            .tapOnSquare(at: 4)
            .tapOnSquare(at: 6)
            .tapOnRestartButton()
            .verifyBoardRestart()
        
    }

}
