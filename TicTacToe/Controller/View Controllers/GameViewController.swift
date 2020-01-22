//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Outlets
    @IBOutlet weak var statusLabel: UILabel!
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Properties
    var game = Game() {
        didSet {
            updateViews()
            boardViewController.game = game
        }
    }
    
    private var boardViewController: BoardViewController! {
        willSet {
            boardViewController?.delegate = nil
        }
        didSet {
            boardViewController?.game = game
            boardViewController?.delegate = self
        }
    }
    
    override func viewDidLoad() {
        statusLabel.text = "Start"
    }
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Actions
    @IBAction func restartGame(_ sender: Any) {
        game.restart()
    }
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Private
    private func updateViews() {
        guard isViewLoaded else { return }
        
        switch game.gameState {
            case let .active(player):
                statusLabel.text = "Player \(player.stringValue)'s turn"
            case .cat:
                statusLabel.text = "Cat's game!"
            case let .won(player):
                statusLabel.text = "Player \(player.stringValue) won!"
        }
    }
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EmbedBoard" {
            boardViewController = (segue.destination as! BoardViewController)
        }
    }
}

extension GameViewController: BoardViewControllerDelegate {
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - BoardViewControllerDelegate
    func boardViewController(_ boardViewController: BoardViewController, markWasMadeAt coordinate: Coordinate) {
        do {
            try game.makeMark(at: coordinate)
            updateViews()
        } catch {
            NSLog("Error adding mark to the board: \(error.localizedDescription)")
        }
    }
}
