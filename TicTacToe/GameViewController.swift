//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, BoardViewControllerDelegate {

	private enum GameState {
		case active(GameBoard.Mark) // Active player
		case cat
		case won(GameBoard.Mark) // Winning player
	}

	private var boardViewController: BoardViewController! {
		willSet {
			boardViewController?.delegate = nil
		}
		didSet {
			boardViewController?.board = game.board
			boardViewController?.delegate = self
		}
	}

	@IBOutlet weak var statusLabel: UILabel!

	private var gameState = GameState.active(.x) {
		didSet {
			updateViews()
		}
	}

	private var game = Game() {
		didSet {
			// do something
			updateGameState()
		}
	}

	@IBAction func restartGame(_ sender: Any) {
		game.restart()
	}

	// MARK: - BoardViewControllerDelegate

	func boardViewController(_ boardViewController: BoardViewController, markWasMadeAt coordinate: Coordinate) {
		guard case GameState.active(_) = gameState else {
			NSLog("Game is over")
			return
		}

		do {
			try game.makeMark(at: coordinate)

		} catch {
			NSLog("Illegal move")
		}
	}

	// MARK: - Private

	private func updateGameState() {
		if let activePlayer = game.activePlayer {
			gameState = .active(activePlayer)
		}

		if let winningPlayer = game.winningPlayer {
			gameState = .won(winningPlayer)
		}

		if game.gameIsOver && game.winningPlayer == nil {
			gameState = .cat
		}
		boardViewController.board = game.board
	}

	private func updateViews() {
		guard isViewLoaded else { return }

		switch gameState {
		case let .active(player):
			statusLabel.text = "Player \(player.stringValue)'s turn"
		case .cat:
			statusLabel.text = "Cat's game!"
		case let .won(player):
			statusLabel.text = "Player \(player.stringValue) won!"
		}
	}

	// MARK: - Navigation

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "EmbedBoard" {
			boardViewController = (segue.destination as! BoardViewController)
		}
	}
}
