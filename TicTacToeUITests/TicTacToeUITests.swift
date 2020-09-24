//
//  TicTacToeUITests.swift
//  TicTacToeUITests
//
//  Created by Kenneth Jones on 9/23/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

class TicTacToeUITests: XCTestCase {
    
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
    
    private var app: XCUIApplication {
        return XCUIApplication()
    }
    
    private var restartButton: XCUIElement {
        return app.buttons["GameViewController.RestartButton"]
    }
    
    private var turnLabel: XCUIElement {
        return app.staticTexts["GameViewController.TurnLabel"]
    }
    
    private func buttonFor(_ index: Int) -> XCUIElement {
        return app.buttons["button\(index)"]
    }
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        XCUIApplication().launch()
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
        
        let button0 = buttonFor(0)
        let button1 = buttonFor(1)
        let button3 = buttonFor(3)
        let button4 = buttonFor(4)
        let button6 = buttonFor(6)
        
        button0.tap()
        XCTAssertEqual(turnLabel.label, "Player O's turn")
        XCTAssertEqual(button0.label, Mark.x.stringValue)
        
        button1.tap()
        XCTAssertEqual(turnLabel.label, "Player X's turn")
        XCTAssertEqual(button1.label, Mark.o.stringValue)
        
        button3.tap()
        XCTAssertEqual(turnLabel.label, "Player O's turn")
        XCTAssertEqual(button3.label, Mark.x.stringValue)
        
        button4.tap()
        XCTAssertEqual(turnLabel.label, "Player X's turn")
        XCTAssertEqual(button4.label, Mark.o.stringValue)
        
        button6.tap()
        XCTAssertEqual(turnLabel.label, "Player X won!")
        XCTAssertEqual(button6.label, Mark.x.stringValue)
    }

}
