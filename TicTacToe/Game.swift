//
//  Game.swift
//  TicTacToe
//
//  Created by Michael Redig on 6/12/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct Game {

	typealias GameState = (board: GameBoard, gameIsOver: Bool, activePlayer: GameBoard.Mark, winningPlayer: GameBoard.Mark?)

	internal var activePlayer: GameBoard.Mark? = nil
	internal var gameIsOver: Bool = false
	internal var winningPlayer: GameBoard.Mark? = nil

	private(set) var previousState: GameState?
	private(set) var board = GameBoard()
	init() {
		restart()
	}

	mutating internal func undo() {
		guard let previous = previousState else { return }
		board = previous.board
		gameIsOver = previous.gameIsOver
		activePlayer = previous.activePlayer
		winningPlayer = previous.winningPlayer
		previousState = nil
	}

	mutating internal func restart() {
		board = GameBoard()
		activePlayer = .x
		gameIsOver = false
		winningPlayer = nil
		previousState = nil
	}

	mutating internal func makeMark(at coordinate: Coordinate) throws {
		guard let activePlayer = activePlayer else { return }
		guard gameIsOver == false else { throw GameAIError.gameOver }

		// capture state in case the place throws
		let tState = getCurrentState()
		try board.place(mark: activePlayer, on: coordinate)
		previousState = tState

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

	private func getCurrentState() -> GameState? {
		guard let activePlayer = activePlayer else { return nil }
		return (board, gameIsOver, activePlayer, winningPlayer)
	}
}
