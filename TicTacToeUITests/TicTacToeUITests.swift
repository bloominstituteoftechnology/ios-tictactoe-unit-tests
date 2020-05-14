//
//  TicTacToeUITests.swift
//  TicTacToeUITests
//
//  Created by Dimitri Bouniol Lambda on 5/14/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

extension XCUIElement {
    var visibleLabel: String {
        staticTexts.firstMatch.label
    }
}

class TicTacToeUITests: XCTestCase {
    
    // MARK: - Helper Properties
    
    private var app: XCUIApplication {
        XCUIApplication()
    }
    
    private func buttonFor(_ index: Int) -> XCUIElement {
        app.buttons["button\(index)"]
    }
    
    private var turnLabel: XCUIElement {
        app.staticTexts["GameViewController.TurnLabel"]
    }
    
    private var restartButton: XCUIElement {
        app.buttons["GameViewController.RestartButton"]
    }
    
    private enum Mark: String, Equatable {
        case x = "X"
        case o = "O"
        case empty = " "
        
        var turnString: String {
            switch self {
            case .x: return "Player X's turn"
            case .o: return "Player O's turn"
            case .empty: return ""
            }
        }
        
        var winString: String {
            switch self {
            case .x: return "Player X won!"
            case .o: return "Player O won!"
            case .empty: return ""
            }
        }
    }
    
    // MARK: - Test Setup

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWinByX() throws {
        // UI tests must launch the application that they test.
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        app.buttons["button0"].tap()
        app.buttons["button1"].staticTexts[" "].tap()
        app.buttons["button3"].tap()
        app.buttons["button4"].staticTexts[" "].tap()
        app.buttons["button6"].staticTexts[" "].tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["GameViewController.TurnLabel"]/*[[".staticTexts[\"Player X won!\"]",".staticTexts[\"GameViewController.TurnLabel\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        XCTAssertEqual(app/*@START_MENU_TOKEN@*/.staticTexts["GameViewController.TurnLabel"]/*[[".staticTexts[\"Player X won!\"]",".staticTexts[\"GameViewController.TurnLabel\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.label, "Player X won!")
    }
    
    func testCleanLaunch() {
        app.launch()
        
        XCTAssertEqual(turnLabel.label, "Player X's turn")
    }
    
    func testWinCheckingVertical1() {
        app.launch()
        
        XCTAssertEqual(buttonFor(1).visibleLabel, Mark.empty.rawValue)
        buttonFor(1).tap()
        XCTAssertEqual(buttonFor(1).visibleLabel, Mark.x.rawValue)
        XCTAssertEqual(turnLabel.label, Mark.o.turnString)
        
        XCTAssertEqual(buttonFor(2).visibleLabel, Mark.empty.rawValue)
        buttonFor(2).tap()
        XCTAssertEqual(buttonFor(2).visibleLabel, Mark.o.rawValue)
        XCTAssertEqual(turnLabel.label, Mark.x.turnString)
        
        XCTAssertEqual(buttonFor(4).visibleLabel, Mark.empty.rawValue)
        buttonFor(4).tap()
        XCTAssertEqual(buttonFor(4).visibleLabel, Mark.x.rawValue)
        XCTAssertEqual(turnLabel.label, Mark.o.turnString)
        
        XCTAssertEqual(buttonFor(5).visibleLabel, Mark.empty.rawValue)
        buttonFor(5).tap()
        XCTAssertEqual(buttonFor(5).visibleLabel, Mark.o.rawValue)
        XCTAssertEqual(turnLabel.label, Mark.x.turnString)
        
        XCTAssertEqual(buttonFor(7).visibleLabel, Mark.empty.rawValue)
        buttonFor(7).tap()
        XCTAssertEqual(buttonFor(7).visibleLabel, Mark.x.rawValue)
        XCTAssertEqual(turnLabel.label, Mark.x.winString)
    }
    
    func testRestartingGame() {
        app.launch()
        
        buttonFor(4).tap()
        XCTAssertEqual(buttonFor(4).visibleLabel, Mark.x.rawValue)
        XCTAssertEqual(turnLabel.label, Mark.o.turnString)
        
        restartButton.tap()
        
        XCTAssertEqual(turnLabel.label, Mark.x.turnString)
        
        for index in 0...8 {
            XCTAssertEqual(buttonFor(index).visibleLabel, Mark.empty.rawValue)
        }
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
