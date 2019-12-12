//
//  TestHelpers.swift
//  TicTacToeTests
//
//  Created by Jon Bash on 2019-12-11.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
@testable import TicTacToe

typealias MarkPlacement = (coord: Coordinate, mark: GameBoard.Mark)

func loopThroughBoard(completion: (Coordinate) throws -> Void) {
    for x in 0..<3 {
        for y in 0..<3 {
            try! completion((x,y))
        }
    }
}
