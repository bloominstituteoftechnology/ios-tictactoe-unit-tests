//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

// Access controls
// open - (only applicable for classes) any target can access and subclass
// public - any target can access var/func/constant/class/struct
// 

class GameViewController: UIViewController, BoardViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }

    @IBAction func restartGame(_ sender: Any) {
        games.restart()
    }
    
    // MARK: - BoardViewControllerDelegate
    func boardViewController(_ boardViewController: BoardViewController, markWasMadeAt coordinate: Coordinate) {
        do {
            try games.makeMark(at: coordinate)
        } catch {
            NSLog("Invaild Move")
        }
    }
    
    // MARK: - Private
    func updateViews() {
        guard isViewLoaded else { return }
        
        switch games.gameState {
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
            boardViewController?.board = games.board
            boardViewController?.delegate = self
        }
    }
    
    @IBOutlet weak var statusLabel: UILabel!
//
//     var board = GameBoard() {
//        didSet {
//            boardViewController.board = board
//        }
//    }

    var games = Game(board: GameBoard(), gameIsOver: false, winningPlayer: nil, gameState: .active(.x)) {
        didSet {
            boardViewController.board = games.board
            updateViews()
        }
    }
}
