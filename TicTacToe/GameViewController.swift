//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, BoardViewControllerDelegate {
    //MARK: - Properties -
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var restartButton: UIButton!
    
    private var currentGame: Game = Game() {
        didSet {
            updateViews()
            boardViewController.board = currentGame.board
        }
    }
    private var boardViewController: BoardViewController! {
        willSet {
            boardViewController?.delegate = nil
        }
        didSet {
            boardViewController?.board = currentGame.board
            boardViewController?.delegate = self
        }
    }
    
    
    // MARK: - BoardViewControllerDelegate -
    func boardViewController(_ boardViewController: BoardViewController, markWasMadeAt coordinate: Coordinate) {
        guard !currentGame.gameIsOver else {
            NSLog("GAME OVER")
            return
        }
        
        do {
            try currentGame.makeMark(at: coordinate)
        } catch {
            NSLog("Invalid Move.")
        }
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EmbedBoard" {
            boardViewController = (segue.destination as! BoardViewController)
        }
    }
    
    
    //MARK: - Actions -
    @IBAction func restartGame(_ sender: Any) {
        currentGame.restart()
        restartButton.setTitle("Restart", for: .normal)
    }
    
    
    //MARK: - Methods -
    private func updateViews() {
        guard isViewLoaded else { return }
        
        switch currentGame.gameIsOver {
        case true:
            if let winner = currentGame.winningPlayer {
                statusLabel.text = "\(winner.stringValue) Wins!"
                restartButton.setTitle("Play Again?", for: .normal)
            } else {
                statusLabel.text = "Game goes to the cat."
                restartButton.setTitle("Play Again?", for: .normal)
            }
        default:
            statusLabel.text = "It's \(currentGame.activePlayer!.stringValue)'s turn. Please mark a spot."
        }
    }
}
