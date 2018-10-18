//
//  GamePage.swift
//  TicTacToeUITests
//
//  Created by Dillon McElhinney on 10/18/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct GamePage: TestPage {
    var testCase: XCTestCase
    
    // MARK: - UI Elements
    var statusLabel: XCUIElement {
        return app.staticTexts["GameViewController.StatusLabel"]
    }
    
    var restartButton: XCUIElement {
        return app.buttons["GameViewController.RestartButton"]
    }
    
    /// Returns the game button for the given index
    /// - Parameter index: unsigned integer between 0 and 8
    /// - Returns: The game button for the given index as a XCUIElement
    @discardableResult func button(for index: UInt) -> XCUIElement {
        return app.buttons["BoardViewController.GameButton\(index)"]
    }
    
    // MARK: - Actions
    /// Taps on the square at the given index
    @discardableResult func tapOnSquare(_ index: UInt) -> GamePage {
        let button = self.button(for: index)
        XCTAssert(button.exists)
        button.tap()
        return self
    }
    
    /// Restarts the game
    @discardableResult func restartGame() -> GamePage {
        XCTAssert(restartButton.exists)
        restartButton.tap()
        return self
    }
    
    // MARK: - Verifications
    /// Verifies that the given player won the game
    @discardableResult func verifyPlayerWin(player: Mark, file: String = #file, line: UInt = #line) -> GamePage {
        testCase.expect(exists: statusLabel, file: file, line: line)
        testCase.expect(statusLabel.label, equals: "Player \(player.stringValue) won!", file: file, line: line)
        return self
    }
    
    
    // Convenience enum for holding the different options for marks on the board.
    enum Mark: Equatable {
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
