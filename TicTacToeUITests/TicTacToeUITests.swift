//
//  TicTacToeUITests.swift
//  TicTacToeUITests
//
//  Created by Shawn Gee on 4/16/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

extension XCUIElement {
    var title: String {
        return staticTexts.firstMatch.label
    }
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

private enum StatusStrings {
    
}

class TicTacToeUITests: XCTestCase {
    
    // MARK: - Properties
    
    private var app: XCUIApplication = { XCUIApplication() }()
    
    private func button(_ index: Int) -> XCUIElement {
        return app.buttons["button\(index)"]
    }
    
    private var statusLabel: XCUIElement {
        return app.staticTexts["GameViewController.statusLabel"]
    }
    
    private var restartButton: XCUIElement {
        return app.buttons["GameViewController.restartButton"]
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

    // MARK: - Tests
    
    func testWinByX() throws {
        // UI tests must launch the application that they test.
    
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        button(0).tap()
        button(1).tap()
        button(3).tap()
        button(4).tap()
        button(6).tap()
        
        XCTAssertEqual(app.staticTexts["GameViewController.statusLabel"].label, "Player X won!")
    }
    
    func testCleanLaunch() {
        app.launch()
        
        XCTAssertEqual(statusLabel.label, "Player X's turn")
    }

    
    func testWinCheckingVertical1() {
        app.launch()
        
        XCTAssertEqual(button(0).title, Mark.empty.rawValue)
        button(0).tap()
        XCTAssertEqual(button(0).title, Mark.x.rawValue)
        
    }
    
    func testRestartingGame() {
        app.launch()
        button(4).tap()
        XCTAssertEqual(button(4).title, Mark.x.rawValue)
        XCTAssertEqual(statusLabel.label, Mark.o.turnString)
        
        restartButton.tap()
        
        XCTAssertEqual(statusLabel.label, Mark.x.turnString)
        
        for i in 0...8 {
            XCTAssertEqual(button(i).title, Mark.empty.rawValue)
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
