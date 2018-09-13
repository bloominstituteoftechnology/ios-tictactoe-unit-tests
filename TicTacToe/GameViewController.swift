//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, BoardViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    @IBAction func restartGame(_ sender: Any) {
        game.restart()
    }
    
    // MARK: - BoardViewControllerDelegate
    
    func boardViewController(_ boardViewController: BoardViewController, markWasMadeAt coordinate: Coordinate) {
        
        do {
            try game.makeMark(at: coordinate)
        }
        catch {
            NSLog("Illegal move")
        }
    }
    
    // MARK: - Private
    
    private func updateViews() {
        guard isViewLoaded else { return }
        
        if game.gameIsOver == true {
            if game.winningPlayer == nil {
                statusLabel.text = "Cat's game!"
            } else if game.winningPlayer == .x {
                statusLabel.text = "Player x won!"
            } else {
                statusLabel.text = "Player o won!"
            }
        } else {
            if game.activePlayer == .x {
                statusLabel.text = "Player x's turn."
            } else if game.activePlayer == .o {
                statusLabel.text = "Player o's turn."
            }
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EmbedBoard" {
            boardViewController = segue.destination as! BoardViewController
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
    
    @IBOutlet weak var statusLabel: UILabel!
    
    var game: Game = Game() {
        didSet {
            updateViews()
            boardViewController.board = game.board
        }
    }
}
