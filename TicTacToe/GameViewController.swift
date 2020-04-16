//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, BoardViewControllerDelegate {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var statusLabel: UILabel!
    
    // MARK: - IBActions
    
    @IBAction func restartGame(_ sender: Any) {
        game.restart()
    }
    
    // MARK: - Private Properties
    private var game = Game() {
        didSet {
            boardViewController.board = game.board
            updateViews()
        }
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
    

    
    // MARK: - Private Methods
    
    private func updateViews() {
        guard isViewLoaded else { return }
        
        if let winningPlayer = game.winningPlayer {
            statusLabel.text = "Player \(winningPlayer.stringValue) won!"
        } else if game.gameIsOver {
            statusLabel.text = "Cat's game!"
        } else if let player = game.activePlayer {
            statusLabel.text = "Player \(player.stringValue)'s turn"
        }
    }
    
    // MARK: - BoardViewControllerDelegate
    
    func boardViewController(_ boardViewController: BoardViewController, markWasMadeAt coordinate: Coordinate) {
        guard !game.gameIsOver else {
            NSLog("Game is over")
            return
        }
        
        do {
            try game.makeMark(at: coordinate)
        } catch {
            NSLog("Illegal move")
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EmbedBoard", let destinationVC = segue.destination as? BoardViewController {
            boardViewController = destinationVC
        }
    }
}
