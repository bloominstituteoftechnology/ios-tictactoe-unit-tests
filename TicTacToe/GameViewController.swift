//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, BoardViewControllerDelegate {
    
    var gameInstance = Game() {
        didSet {
            self.updateViews()
            boardViewController?.board = self.gameInstance.board
        }
    }
    
//    enum GameState {
//        case active(GameBoard.Mark) // Active player
//        case cat
//        case won(GameBoard.Mark) // Winning player
//    }
    
    @IBAction func restartGame(_ sender: Any) {
        self.gameInstance.restart()
    }
    
    // MARK: - BoardViewControllerDelegate
    
    func boardViewController(_ boardViewController: BoardViewController, markWasMadeAt coordinate: Coordinate) {
//        guard case let GameState.active(player) = gameState else {
//            NSLog("Game is over")
//            return
//        }
//
//        do {
//            try board.place(mark: player, on: coordinate)
//            if game(board: board, isWonBy: player) {
//                gameState = .won(player)
//            } else if board.isFull {
//                gameState = .cat
//            } else {
//                let newPlayer = player == .x ? GameBoard.Mark.o : GameBoard.Mark.x
//                gameState = .active(newPlayer)
//            }
//        } catch {
//            NSLog("Illegal move")
//        }
        do {
           try self.gameInstance.makeMark(coordinate: coordinate)
        } catch {
            NSLog("error")
        }

    }
    
    // MARK: - Private
    
    private func updateViews() {
        guard isViewLoaded else { return }
     
        //try a different way -> if statement
        if self.gameInstance.gameIsOver == true && gameInstance.winningPlayer == nil {
            statusLabel.text = "Cat's game!"
        } else if self.gameInstance.gameIsOver == true {
            statusLabel.text = "Player \(gameInstance.winningPlayer!.stringValue) won!"
        } else if self.gameInstance.gameIsOver == false {
            statusLabel.text = "Player \(gameInstance.activePlayer!.stringValue)' Turn"
        } 
        
//        switch gameState {
//        case let .active(player):
//            statusLabel.text = "Player \(player.stringValue)'s turn"
//        case .cat:
//            statusLabel.text = "Cat's game!"
//        case let .won(player):
//            statusLabel.text = "Player \(player.stringValue) won!"
//        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EmbedBoard" {
            guard let destVC = segue.destination as? BoardViewController else {return}
            boardViewController = destVC
        }
    }
    
    private var boardViewController: BoardViewController! {
        didSet {
            boardViewController?.board = self.gameInstance.board
            boardViewController?.delegate = self
        }
    }
    
    @IBOutlet weak var statusLabel: UILabel!
    
 
    //this is not being used
    
//    private var board = GameBoard() {
//        didSet {
//            boardViewController?.board = self.gameInstance.board
//        }
//    }
    
    //    private var gameState = GameState.active(.x) {
    //        didSet {
    //            updateViews()
    //        }
    //    }
}
