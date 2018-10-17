//
//  Game.swift
//  TicTacToe
//
//  Created by Ilgar Ilyasov on 10/17/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    
    private(set) var board: GameBoard
    
    internal var activePlayer: GameBoard.Mark?
    internal var winnigPlayer: GameBoard.Mark?
    internal var gameIsOver: Bool
    
    mutating internal func restart() {
        board = GameBoard()
        activePlayer = .x
    }
    
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        try! board.place(mark: activePlayer!, on: coordinate)
    }
    
}
