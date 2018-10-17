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
            boardViewController.board = game.board
            updateViews()
        }
    }
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var undoButton: UIButton!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }
    
    @IBAction func restartGame(_ sender: Any) {
        game.restart()
    }
    
    @IBAction func undo(_ sender: Any) {
        game.undoMove()
    }
    
    // MARK: - BoardViewControllerDelegate
    
    func boardViewController(_ boardViewController: BoardViewController, markWasMadeAt coordinate: Coordinate) {
        do {
            try game.makeMark(at: coordinate)
        } catch {
            NSLog("Illegal move")
        }
    }
    
    // MARK: - Private
    
    private func updateViews() {
        guard isViewLoaded else { return }
        
        undoButton.isHidden = true
        if !game.gameIsOver {
            if game.lastMove != nil { undoButton.isHidden = false }
            if let player = game.activePlayer {
                statusLabel.text = "Player \(player.stringValue)'s turn"
            }
        } else {
            //undoButton.isHidden = true
            if let winner = game.winningPlayer {
                statusLabel.text = "Player \(winner.stringValue) won!"
            } else {
                statusLabel.text = "Cat's game!"
            }
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EmbedBoard" {
            boardViewController = (segue.destination as! BoardViewController)
        }
    }
    
    
}
