//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, BoardViewControllerDelegate {
    
    var game = Game() {
        didSet {
            updateViews()
            boardViewController.game = game
        }
    }
    
    private var boardViewController: BoardViewController! {
        didSet {
            boardViewController.delegate = self
            game.restart()
        }
    }
    
    
    @IBOutlet weak var statusLabel: UILabel!

    
    @IBAction func restartGame(_ sender: Any) {
        game.restart()
    }
    
    // MARK: - BoardViewControllerDelegate
    
    func boardViewController(_ boardViewController: BoardViewController, markWasMadeAt coordinate: Coordinate) {
        do {
            try game.makeMark(at: coordinate)
            updateViews()
        } catch {
            NSLog("Illegal Move")
        }
    }
    
    // MARK: - Private
    
    func updateViews() {
        guard isViewLoaded else { return }
        switch game.gameStatus {
        case let .newGame(player):
            statusLabel.text = "Player \(player.stringValue)'s turn"
        case .catsGame:
            statusLabel.text = "Cat's game!"
        case let .gameOver(player):
            statusLabel.text = "Player \(player.stringValue) won!"
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EmbedBoard" {
            boardViewController = segue.destination as? BoardViewController
        }
    }
}

