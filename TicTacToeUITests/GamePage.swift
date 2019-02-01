//
//  GamePage.swift
//  TicTacToeUITests
//
//  Created by Benjamin Hakes on 1/31/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

struct GamePage: TestPage {
    
    let testCase: XCTestCase
    
    // MARK: - Elements
    
    /// - Requires: The value of the index should be from 0 to 8.
    private func buttonFor(_ index: Int) -> XCUIElement {
        return app.buttons["BoardViewController.Button\(index)"]
    }
    
    var statusLabel: XCUIElement {
        return app.staticTexts["GameViewController.StatusLabel"]
    }
    
    var restartButton: XCUIElement {
        return app.buttons["GameViewController.RestartButton"]
    }
    // MARK: - Actions (interactions)
    
    @discardableResult func tapOnRestartButton(file: String = #file, line: UInt = #line) -> GamePage {
        
        testCase.expect(exists: restartButton, file: file, line: line)
        restartButton.tap()
        return self
        
    }
    
    @discardableResult func tapOnSquare(at index: Int, file: String = #file, line: UInt = #line) -> GamePage {
        
        let button = buttonFor(index)
        testCase.expect(exists: button, file: file, line: line)
        button.tap()
        return self
        
    }
    
    
    
    // MARK: - Verifications
    
    @discardableResult func verifySquare(mark: Mark, at index: Int, file: String = #file, line: UInt = #line) -> GamePage {
        
        let button = buttonFor(index)
        testCase.expect(exists: button, file: file, line: line)
        testCase.expect(button.label, equals: mark.stringValue, file: file, line: line)
        return self
        
    }
    
    @discardableResult func verifyWinner(player: Mark, file: String = #file, line: UInt = #line) -> GamePage {
        
        testCase.expect(exists: statusLabel, file: file, line: line)
        testCase.expect(statusLabel.label, equals: "Player \(player.stringValue) won!")
        return self
        
    }
    
    @discardableResult func verifyTurnIsPlayer(player: Mark, file: String = #file, line: UInt = #line) -> GamePage {
        
        testCase.expect(exists: statusLabel, file: file, line: line)
        testCase.expect(statusLabel.label, equals: "Player \(player.stringValue)'s turn")
        return self
        
    }
    
    @discardableResult func verifyBoardRestart(file: String = #file, line: UInt = #line) -> GamePage {
        
        for index in 0...8{
            let button = buttonFor(index)
            testCase.expect(exists: button, file: file, line: line)
            testCase.expect(button.label, equals: Mark.empty.stringValue, file: file, line: line)
        }
        
        testCase.expect(statusLabel.label, equals: "Player \(Mark.x.stringValue)'s turn")
        return self
        
    }
    
    
    
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
