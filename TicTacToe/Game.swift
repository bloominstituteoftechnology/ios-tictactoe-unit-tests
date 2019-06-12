//
//  Game.swift
//  TicTacToe
//
//  Created by Michael Redig on 6/12/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct Game {

	internal var activePlayer: GameBoard.Mark? = nil
	internal var gameIsOver: Bool = false
	internal var winningPlayer: GameBoard.Mark? = nil

	private(set) var board = GameBoard()

	init() {
		restart()
	}

	mutating internal func restart() {
		board = GameBoard()
		activePlayer = .x
		gameIsOver = false
		winningPlayer = nil
	}

	mutating internal func makeMark(at coordinate: Coordinate) throws {
		guard let activePlayer = activePlayer else { return }
		guard gameIsOver == false else { throw GameAIError.gameOver }
		try board.place(mark: activePlayer, on: coordinate)

		if game(board: board, isWonBy: activePlayer) {
			winningPlayer = activePlayer
			gameIsOver = true
		} else if board.isFull && !game(board: board, isWonBy: otherPlayer(than: activePlayer)) {
			gameIsOver = true
			winningPlayer = nil
		} else {
			self.activePlayer = otherPlayer(than: activePlayer)
		}
	}

	private func otherPlayer(than player: GameBoard.Mark) -> GameBoard.Mark {
		switch player {
		case .o:
			return .x
		case .x:
			return .o
		}
	}
}
