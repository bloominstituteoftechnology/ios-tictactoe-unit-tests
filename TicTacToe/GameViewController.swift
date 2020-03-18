//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, BoardViewControllerDelegate {
    
    @IBOutlet weak var statusLabel: UILabel!
    
    var game = Game() {
        didSet {
            updateViews()
            boardViewController.game = game
        }
    }
    
    private var board = GameBoard() {
        didSet {
            updateViews()
            boardViewController.board = board
        }
    }
    
    private var boardViewController: BoardViewController! {
        willSet {
            boardViewController?.delegate = nil
        }
        didSet {
            boardViewController?.board = board
            boardViewController?.delegate = self
        }
    }
    
    @IBAction func restartGame(_ sender: Any) {
        game.restart()
    }
    
    // MARK: - BoardViewControllerDelegate
    
    func boardViewController(_ boardViewController: BoardViewController, markWasMadeAt coordinate: Coordinate) {
        do {
            try game.makeMark(at: coordinate)
            updateViews()
        } catch {
            NSLog("Illegal move")
        }
    }
    
    // MARK: - Private
    
    private func updateViews() {
        guard isViewLoaded else { return }
        let gameState = game.gameState
        
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

