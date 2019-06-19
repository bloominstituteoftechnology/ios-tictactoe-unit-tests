//
//  Game.swift
//  TicTacToe
//
//  Created by Hector Steven on 6/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct Game {
	mutating  func restart() {
		board = GameBoard()
		activePlayer = .x
		gameIsOver = false
		winningPlayer = nil
	}
	
	mutating  func makeMark(at coordinate: Coordinate) throws {
		/*(try board.place(mark: player, on: coordinate)
		if game(board: board, isWonBy: player) {
			gameState = .won(player)
		} else if board.isFull {
			gameState = .cat
		} else {
			let newPlayer = player == .x ? GameBoard.Mark.o : GameBoard.Mark.x
			gameState = .active(newPlayer)
		}
		*/
	}
	
	private(set) var board: GameBoard
	internal var activePlayer: GameBoard.Mark?
	internal var gameIsOver: Bool
	internal var winningPlayer: GameBoard.Mark?
}
