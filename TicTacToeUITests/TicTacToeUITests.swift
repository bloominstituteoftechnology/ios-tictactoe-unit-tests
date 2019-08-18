//
//  TicTacToeUITests.swift
//  TicTacToeUITests
//
//  Created by Michael Stoffer on 8/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

class TicTacToeUITests: XCTestCase {

    // Helper Properties
    private var app: XCUIApplication {
        return XCUIApplication()
    }
    
    private enum Mark: Equatable {
        case x
        case o
        case empty
        
        var stringValue: String {
            switch self {
            case .x:
                return "X"
            case .o:
                return "O"
            case .empty:
                return " "
            }
        }
    }
    
    private var restartButton: XCUIElement {
        return app.buttons["GameViewController.RestartButton"]
    }
    
    private var turnLabel: XCUIElement {
        return app.staticTexts["GameViewController.TurnLabel"]
    }
    
    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    // Helper Method
    private func buttonFor(_ index: Int) -> XCUIElement {
        return app.buttons["Button\(index)"]
    }
    
    func testWhenCheckingVertical1() {
        // 0 1 2
        // 3 4 5
        // 6 7 8
        
        // x o -
        // x o -
        // x - -
        
        let button0 = buttonFor(0)
        let button1 = buttonFor(1)
        let button3 = buttonFor(3)
        let button4 = buttonFor(4)
        let button6 = buttonFor(6)
        
        button0.tap()
        XCTAssertEqual(button0.label, Mark.x.stringValue)
        XCTAssertEqual(turnLabel.label, "Player \(Mark.o.stringValue)'s turn")
        
        button1.tap()
        XCTAssertEqual(button1.label, Mark.o.stringValue)
        XCTAssertEqual(turnLabel.label, "Player \(Mark.x.stringValue)'s turn")
        
        button3.tap()
        XCTAssertEqual(button3.label, Mark.x.stringValue)
        XCTAssertEqual(turnLabel.label, "Player \(Mark.o.stringValue)'s turn")
        
        button4.tap()
        XCTAssertEqual(button4.label, Mark.o.stringValue)
        XCTAssertEqual(turnLabel.label, "Player \(Mark.x.stringValue)'s turn")
        
        button6.tap()
        XCTAssertEqual(button6.label, Mark.x.stringValue)
        XCTAssertEqual(turnLabel.label, "Player \(Mark.x.stringValue) won!")
    }
    
    func testWhenCheckingHorizontal1() {
        // 0 1 2
        // 3 4 5
        // 6 7 8
        
        // x x x
        // o o -
        // - - -
        
        let button0 = buttonFor(0)
        let button1 = buttonFor(1)
        let button2 = buttonFor(2)
        let button3 = buttonFor(3)
        let button4 = buttonFor(4)
        
        button0.tap()
        XCTAssertEqual(button0.label, Mark.x.stringValue)
        XCTAssertEqual(turnLabel.label, "Player \(Mark.o.stringValue)'s turn")
        
        button3.tap()
        XCTAssertEqual(button3.label, Mark.o.stringValue)
        XCTAssertEqual(turnLabel.label, "Player \(Mark.x.stringValue)'s turn")
        
        button1.tap()
        XCTAssertEqual(button1.label, Mark.x.stringValue)
        XCTAssertEqual(turnLabel.label, "Player \(Mark.o.stringValue)'s turn")
        
        button4.tap()
        XCTAssertEqual(button4.label, Mark.o.stringValue)
        XCTAssertEqual(turnLabel.label, "Player \(Mark.x.stringValue)'s turn")
        
        button2.tap()
        XCTAssertEqual(button2.label, Mark.x.stringValue)
        XCTAssertEqual(turnLabel.label, "Player \(Mark.x.stringValue) won!")
    }
    
    func testWhenCheckingLTRDiagnol() {
        // 0 1 2
        // 3 4 5
        // 6 7 8
        
        // - o x
        // o x -
        // x - -
        
        let button1 = buttonFor(1)
        let button2 = buttonFor(2)
        let button3 = buttonFor(3)
        let button4 = buttonFor(4)
        let button6 = buttonFor(6)
        
        button6.tap()
        XCTAssertEqual(button6.label, Mark.x.stringValue)
        XCTAssertEqual(turnLabel.label, "Player \(Mark.o.stringValue)'s turn")
        
        button3.tap()
        XCTAssertEqual(button3.label, Mark.o.stringValue)
        XCTAssertEqual(turnLabel.label, "Player \(Mark.x.stringValue)'s turn")
        
        button4.tap()
        XCTAssertEqual(button4.label, Mark.x.stringValue)
        XCTAssertEqual(turnLabel.label, "Player \(Mark.o.stringValue)'s turn")
        
        button1.tap()
        XCTAssertEqual(button1.label, Mark.o.stringValue)
        XCTAssertEqual(turnLabel.label, "Player \(Mark.x.stringValue)'s turn")
        
        button2.tap()
        XCTAssertEqual(button2.label, Mark.x.stringValue)
        XCTAssertEqual(turnLabel.label, "Player \(Mark.x.stringValue) won!")
    }
    
    func testWhenCheckingCatsGame() {
        // 0 1 2
        // 3 4 5
        // 6 7 8
        
        // o x o
        // x o x
        // x o x
        
        let button0 = buttonFor(0)
        let button1 = buttonFor(1)
        let button2 = buttonFor(2)
        let button3 = buttonFor(3)
        let button4 = buttonFor(4)
        let button5 = buttonFor(5)
        let button6 = buttonFor(6)
        let button7 = buttonFor(7)
        let button8 = buttonFor(8)
        
        button8.tap()
        XCTAssertEqual(button8.label, Mark.x.stringValue)
        XCTAssertEqual(turnLabel.label, "Player \(Mark.o.stringValue)'s turn")
        
        button0.tap()
        XCTAssertEqual(button0.label, Mark.o.stringValue)
        XCTAssertEqual(turnLabel.label, "Player \(Mark.x.stringValue)'s turn")
        
        button1.tap()
        XCTAssertEqual(button1.label, Mark.x.stringValue)
        XCTAssertEqual(turnLabel.label, "Player \(Mark.o.stringValue)'s turn")
        
        button2.tap()
        XCTAssertEqual(button2.label, Mark.o.stringValue)
        XCTAssertEqual(turnLabel.label, "Player \(Mark.x.stringValue)'s turn")
        
        button3.tap()
        XCTAssertEqual(button3.label, Mark.x.stringValue)
        XCTAssertEqual(turnLabel.label, "Player \(Mark.o.stringValue)'s turn")
        
        button4.tap()
        XCTAssertEqual(button4.label, Mark.o.stringValue)
        XCTAssertEqual(turnLabel.label, "Player \(Mark.x.stringValue)'s turn")
        
        button5.tap()
        XCTAssertEqual(button5.label, Mark.x.stringValue)
        XCTAssertEqual(turnLabel.label, "Player \(Mark.o.stringValue)'s turn")
        
        button7.tap()
        XCTAssertEqual(button7.label, Mark.o.stringValue)
        XCTAssertEqual(turnLabel.label, "Player \(Mark.x.stringValue)'s turn")
        
        button6.tap()
        XCTAssertEqual(button6.label, Mark.x.stringValue)
        XCTAssertEqual(turnLabel.label, "Cat's game!")
    }
    
    func testRestartGame() {
        let button4 = buttonFor(4)
        
        button4.tap()
        XCTAssertEqual(button4.label, Mark.x.stringValue)
        XCTAssertEqual(turnLabel.label, "Player \(Mark.o.stringValue)'s turn")
        
        restartButton.tap()
        XCTAssertEqual(turnLabel.label, "Player \(Mark.x.stringValue)'s turn")
        
        for i in 0...8 {
            XCTAssertEqual(buttonFor(i).label, Mark.empty.stringValue)
        }
    }

}
