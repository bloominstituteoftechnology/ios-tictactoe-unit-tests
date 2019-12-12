//
//  TicTacToeUITests.swift
//  TicTacToeUITests
//
//  Created by Lambda_School_Loaner_204 on 12/12/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

class TicTacToeUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    func testWinCheckingVertical1() {
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
        
        let button0 = button(forIndex: 0)
        button0.tap()
        XCTAssertEqual(button0.label, Mark.x.stringValue)
        XCTAssertEqual(turnLabel.label, "Player O's turn")
        
        let button1 = button(forIndex: 1)
        button1.tap()
        XCTAssertEqual(button1.label, Mark.o.stringValue)
        XCTAssertEqual(turnLabel.label, "Player X's turn")
        
        let button3 = button(forIndex: 3)
        button3.tap()
        XCTAssertEqual(button3.label, Mark.x.stringValue)
        XCTAssertEqual(turnLabel.label, "Player O's turn")
        
        let button4 = button(forIndex: 4)
        button4.tap()
        XCTAssertEqual(button4.label, Mark.o.stringValue)
        XCTAssertEqual(turnLabel.label, "Player X's turn")
        
        let button6 = button(forIndex: 6)
        button6.tap()
        XCTAssertEqual(button6.label, Mark.x.stringValue)
        XCTAssertEqual(turnLabel.label, "Player X won!")
    }
    
    func testRestartingGame() {
        // Tap someplace in the board so it isnt empty
        let button4 = button(forIndex: 4)
        button4.tap()
        
        // Make sure the board has been marked
        XCTAssertEqual(button4.label, Mark.x.stringValue)
        
        // Check the next player's turn label
        XCTAssertEqual(turnLabel.label, "Player O's turn")
        
        // Make sure the board is empty again
        restartButton.tap()
        
        for i in 0...8 {
            XCTAssertEqual(button(forIndex: i).label, Mark.empty.stringValue)
        }
    }
    
    
    /////////
    // Test Example of async ui code
    ////////
    
//    func testDarkSideCharacters() {
//        let fetchedCharactersExpectation = expectation(for: NSPredicate(format: "count > 0"), evaluatedWith: app.tables.cells, handler: nil)
//
//        app.buttons["fetchDarkSideButton"].tap()
//
//        waitForExpectations(timeout: 5)
//    }
    
    
    private var app: XCUIApplication {
        return XCUIApplication()
    }
    
    private var restartButton: XCUIElement {
        return app.buttons["GameViewController.RestartButton"]
    }
    
    private var turnLabel: XCUIElement {
        return app.staticTexts["GameViewController.TurnLabel"]
    }
    
    private func button(forIndex index: Int) -> XCUIElement {
        return app.buttons["button\(index)"]
    }
    
    private enum Mark: Equatable {
        case x
        case o
        case empty
        
        var stringValue: String {
            switch self {
            case .x: return "X"
            case .o: return "O"
            case .empty: return " "
            }
        }
    }
}
