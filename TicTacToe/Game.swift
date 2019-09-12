//
//  Game.swift
//  TicTacToe
//
//  Created by Jeffrey Santana on 9/11/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct Game {
	
	//MARK: - Properties
	
	var gameIsOver = false
	var activePlayer: GameBoard.Mark?
	var winningPlayer: GameBoard.Mark?
	
	private(set) var board: GameBoard
	private(set) var lastPlayerMove: (player:GameBoard.Mark, square: Coordinate)?
	
	init(board: GameBoard) {
		self.board = board
		self.activePlayer = .x
	}
	
	//MARK: - Helpers
	
	mutating func placeMark(at square: Coordinate) throws {
		guard let activePlayer = activePlayer else { return }
		try board.place(mark: activePlayer, on: square)
//		self.activePlayer = activePlayer == .x ? GameBoard.Mark.o : GameBoard.Mark.x
		lastPlayerMove = (activePlayer, square)
	}
	
	mutating func removeMark() throws {
		guard let lastPlayerMove = lastPlayerMove else { return }
		try board.removeMark(on: lastPlayerMove.square)
		activePlayer = lastPlayerMove.player
		self.lastPlayerMove = nil
	}
	
	mutating func restart() {
		board = GameBoard()
		gameIsOver = false
		activePlayer = .x
		winningPlayer = nil
	}
}
