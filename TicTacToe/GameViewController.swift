//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, BoardViewControllerDelegate {
    
    private var game = Game() {
        didSet {
            boardViewController.board = game.board
        }
    }
    
    @IBAction func restartGame(_ sender: Any) {
        game.restart()
        updateViews()
    }
    
    @IBAction func undoTapped(_ sender: Any) {
        game.undo()
        updateViews()
    }
    
    // MARK: - BoardViewControllerDelegate
    
    func boardViewController(_ boardViewController: BoardViewController, markWasMadeAt coordinate: Coordinate) {
        
        do {
            try game.makeMark(at: coordinate)
            updateViews()
        } catch {
            statusLabel.text = "Illegal move"
            NSLog("Illegal move")
        }
    }
    
    // MARK: - Private
    
    private func updateViews() {
        guard isViewLoaded else { return }
        
        switch game.activePlayer {
        case .x:
            statusLabel.text = "Player X's turn"
        case .o:
            statusLabel.text = "Player O's turn"
        case nil:
            if let winner = game.winningPlayer {
                statusLabel.text = "Player \(winner.stringValue.capitalized) won!"
            } else {
                statusLabel.text = "Cat's game!"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        restartButton.layer.cornerRadius = 8
        undoButton.layer.cornerRadius = 8
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
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var undoButton: UIButton!
    
}
