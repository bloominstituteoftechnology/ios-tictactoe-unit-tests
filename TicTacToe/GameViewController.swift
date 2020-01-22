//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class GameViewController: UIViewController  {
    
    @IBOutlet weak var statusLabel: UILabel!
    
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
    
    @IBAction func restartGame(_ sender: Any) {
        game.restart()
    }
    
    override func viewDidLoad() {
        statusLabel.text = "Start"
    }
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EmbedBoard" {
            boardViewController = (segue.destination as! BoardViewController)
        }
    }
    
}
    
    // MARK: - BoardViewControllerDelegate
    
extension GameViewController: BoardViewControllerDelegate {
    
    func boardViewController(_ boardViewController: BoardViewController, markWasMadeAt coordinate: Coordinate) {
        do {
            try game.makeMark(at: coordinate)
            updateViews()
        } catch {
            NSLog("Error adding the mark to the game board: \(error.localizedDescription)")
        }
    }
    

    
 
    

    

    
    
    
    

}
