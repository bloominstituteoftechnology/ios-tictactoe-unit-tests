//
//  TestPage.swift
//  TicTacToeUITests
//
//  Created by Benjamin Hakes on 1/31/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

protocol  TestPage {
    var testCase: XCTestCase { get }
}

extension TestPage {
    
    var app: XCUIApplication {
        return XCUIApplication()
    }
    
    
}
