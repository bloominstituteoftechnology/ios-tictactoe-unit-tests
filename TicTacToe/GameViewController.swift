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
        }
    }
    
    @IBOutlet weak var statusLabel: UILabel!
    
    // MARK: - Methods
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateViews()
    }
    
    @IBAction func restartGame(_ sender: Any) {
        game.restart()
        updateViews()
    }
    
    private func updateViews() {
        guard isViewLoaded else { return }
        
        boardViewController.board = game.board
        
        if let player = game.activePlayer {
            statusLabel.text = "Player \(player.stringValue)'s turn"
        } else if let player = game.winningPlayer {
            statusLabel.text = "Player \(player.stringValue) won!"
        } else if game.gameIsOver {
            statusLabel.text = "Cat's game!"
        }
    }
    
    // MARK: - BoardViewControllerDelegate
    
    func boardViewController(_ boardViewController: BoardViewController, markWasMadeAt coordinate: Coordinate) {
        do {
            try game.makeMark(at: coordinate)
            updateViews()
        } catch GameBoardError.gameIsOver {
            NSLog("Game is over")
        } catch GameBoardError.invalidSquare {
            NSLog("Invalid move")
        } catch {
            NSLog("Unknown error")
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EmbedBoard" {
            boardViewController = segue.destination as? BoardViewController
        }
    }
}
