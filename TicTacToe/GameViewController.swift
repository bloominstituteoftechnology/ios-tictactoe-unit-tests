//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, BoardViewControllerDelegate {
    
// MARK: Private Properties
    
   private var game = Game() {
       didSet {
        updateViews()
           boardViewController.board = game.board
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }
       
    private func updateViews() {
         guard isViewLoaded else { return }
         
        if let player = game.activePlayer {
             statusLabel.text = "Player \(player.stringValue)'s turn"
        }
        if game.gameIsOver {
             statusLabel.text = "Cat's game!"
        }
        if let winningPlayer = game.winningPlayer {
             statusLabel.text = "Player \(winningPlayer.stringValue) won!"
         }
     }

     @IBOutlet weak var statusLabel: UILabel!
    
    @IBAction func restartGame(_ sender: Any) {
        game.restart()
    }
    
    
    // MARK: - BoardViewControllerDelegate
    
    func boardViewController(_ boardViewController: BoardViewController, markWasMadeAt coordinate: Coordinate) {
        guard !game.gameIsOver else {
            NSLog("Game is over")
            return
        }
        
        do {
            try game.makeMark(at: coordinate)
            
        } catch {
            NSLog("Illegal move")
        }
    }
    
 
    
    // MARK: - StoryBoard Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EmbedBoard" {
            boardViewController = segue.destination as! BoardViewController
        }
    }
    
   

    
   
    
    
}
