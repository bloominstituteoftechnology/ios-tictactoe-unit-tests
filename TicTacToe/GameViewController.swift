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
        do{
            try game.makeMark(at: coordinate)
        } catch {
            print("Illegal Move")
        }
    }
    
    // MARK: - Private
    
    private func updateViews() {
        guard isViewLoaded else { return }
        
           if let winner = game.winningPlayer?.stringValue {
               statusLabel.text = "Player \(winner) won!"
           } else if let player = game.activePlayer?.stringValue {
               statusLabel.text = "Player \(player)'s turn"
           } else if game.gameIsOver {
               statusLabel.text = "Cat's game!"
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
    
    var game = Game(board: GameBoard(), gameState: .active(.x), activePlayer: .x, gameIsOver: false, winningPlayer: nil){
        didSet{
            boardViewController.board = game.board
            updateViews()
        }
    }
}
