//
//  TicTacToeUITests.swift
//  TicTacToeUITests
//
//  Created by Christy Hicks on 4/15/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class TicTacToeUITests: XCTestCase {
    
    func testXWinsTopRow() throws {
        /*
         X X X
         O O -
         - - -
         */
        testWinCondition(moves: [.topLeft, .middleLeft, .topCenter, .middleCenter, .topRight], expectedWinner: "x")
    }
    
    func testXWinsDiagonal() throws {
        /*
         X O -
         - X O
         - - X
         */
        testWinCondition(moves: [.topLeft, .topCenter, .middleCenter, .middleRight, .bottomRight], expectedWinner: "x")
    }

    func testCatsGame() throws {
        app.launch()
        /*
         X O X
         X O O
         O X X
         */
        movements([.topLeft, .middleCenter, .middleLeft, .bottomLeft, .topRight, .topCenter, .bottomCenter, .middleRight, .bottomRight])
        
        let statusLabelText = app.staticTexts["status"].label
        XCTAssertEqual(statusLabelText, "Cat's game!")
    }
}

extension TicTacToeUITests {
    var app: XCUIApplication {
        return XCUIApplication()
    }
    
    func movements(_ identifiers: [positions]) {
        for identifier in identifiers {
            app.buttons[identifier.rawValue].tap()
        }
    }
    
    func assertWin(_ player: String) {
        let statusLabelText = app.staticTexts["status"].label
        XCTAssertEqual(statusLabelText, "Player \(player) won!")
    }
    
    func testWinCondition(moves: [positions], expectedWinner: String) {
        app.launch()
        movements(moves)
        assertWin(expectedWinner)
    }
    
    enum positions: String {
        case topLeft 
        case topCenter
        case topRight
        case middleLeft
        case middleCenter
        case middleRight
        case bottomLeft
        case bottomCenter
        case bottomRight
    }
}
