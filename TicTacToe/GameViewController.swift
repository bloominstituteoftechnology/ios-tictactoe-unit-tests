//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    
    //MARK: - Properties
    var gameController = Game()
    
    
    //MARK: - Actions
    @IBAction func restartButtonPressed(_ sender: UIButton) {
        gameController.restart()
        updateViews()
        print("Game Restarted")
    }
    
    
    // MARK: - Private
    func updateViews() {
        guard isViewLoaded else { return }
        
        switch gameController.gameState {
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
            boardViewController = segue.destination as! BoardViewController
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
    
    @IBOutlet weak var statusLabel: UILabel!
    
    private var board = GameBoard() {
        didSet {
            boardViewController.board = board
        }
    }
}
