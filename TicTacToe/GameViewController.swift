//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, BoardViewControllerDelegate {
    
    // MARK: - Properties
        private var boardViewController: BoardViewController! {
            willSet {
                boardViewController?.delegate = nil
            }
            didSet {
                boardViewController?.board = game.board
                boardViewController?.delegate = self
            }
        }
        
        private var game = Game() {
            didSet {
                updateViews()
                boardViewController.board = game.board
            }
        }

        // MARK: - Outlets
        @IBOutlet weak var statusLabel: UILabel!
        
        // MARK: - View Controller Lifecycle
        override func viewDidLoad() {
            super.viewDidLoad()
            
            updateViews()
        }
        
        // MARK: - Actions
        @IBAction func restartGame(_ sender: Any) {
            game.restart()
        }
        
        // MARK: - Methods
        private func updateViews() {
            guard isViewLoaded else { return }
            
            if game.gameIsOver {
                if let winner = game.winningPlayer {
                    statusLabel.text = "Player \(winner) won!"
                } else {
                    statusLabel.text = "Cat's game!"
                }
            } else {
                guard let activePlayer = game.activePlayer else { return }
                statusLabel.text = "Player \(activePlayer.stringValue)'s turn."
            }
        }
        
        // MARK: - Navigation
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "EmbedBoard" {
                boardViewController = (segue.destination as! BoardViewController)
            }
        }

        // MARK: - BoardViewControllerDelegate
        func boardViewController(_ boardViewController: BoardViewController, markWasMadeAt coordinate: Coordinate) {
            guard game.gameIsOver == false else {
                NSLog("Game is over")
                return
            }
            do {
                try game.makeMark(at: coordinate)

            } catch {
                NSLog("Illegal move")
            }
        }
    }
