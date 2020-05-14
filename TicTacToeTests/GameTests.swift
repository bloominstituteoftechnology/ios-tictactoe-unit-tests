//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Bhawnish Kumar on 5/13/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {

    
    func testActivePlayers() throws  {
     var game = Game()
        XCTAssertEqual(game.activePlayer, .x)
        
        try game.makeMark(at: (0, 0))
        XCTAssertEqual(game.activePlayer, .o)
        
       try game.makeMark(at: (1, 0))
        XCTAssertEqual(game.activePlayer, .x)
        
    }

}
