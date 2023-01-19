//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 BloomTech. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, BoardViewControllerDelegate {
    
    
//    private enum GameState {
//        case active(GameBoard.Mark) // Active player
//        case cat
//        case won(GameBoard.Mark) // Winning player
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    
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
    
    @IBOutlet weak var statusLabel: UILabel!
    
//    private var gameState = GameState.active(.x) {
//        didSet {
    var game = Game(board: GameBoard(), gameState: .active(.x), activePlayer: .x, gameIsOver: false, winningPlayer: nil){
    didSet{
        boardViewController.board = game.board
            updateViews()
        }
    }
    
//    private var board = GameBoard() {
//        didSet {
//            boardViewController.board = game
//        }
//    }
            
            @IBAction func restartGame(_ sender: Any) {
//                board = GameBoard()
//                gameState = .active(.x)
                game.restart()
            }
            
            // MARK: - BoardViewControllerDelegate
            
            func boardViewController(_ boardViewController: BoardViewController, markWasMadeAt coordinate: Coordinate) {
//                guard case let GameState.active(player) = gameState else {
//                    NSLog("Game is over")
//                    return
//                }
//
//                do {
//                    try board.place(mark: player, on: coordinate)
//                    if game(board: board, isWonBy: player) {
//                        gameState = .won(player)
//                    } else if board.isFull {
//                        gameState = .cat
//                    } else {
//                        let newPlayer = player == .x ? GameBoard.Mark.o : GameBoard.Mark.x
//                        gameState = .active(newPlayer)
//                    }
                do{
                    try game.makeMark(at: coordinate)
                } catch {
                   // NSLog("Illegal move")
                    print("Illegal Move")
                }
            }
            
            // MARK: - Private
            
            private func updateViews() {
                guard isViewLoaded else { return }
                
//                switch gameState {
//                case let .active(player):
//                    statusLabel.text = "Player \(player.stringValue)'s turn"
//                case .cat:
//                    statusLabel.text = "Cat's game!"
//                case let .won(player):
//                    statusLabel.text = "Player \(player.stringValue) won!"
//                }
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
                    if let boardVC = segue.destination as? BoardViewController {
                        boardViewController = boardVC
                    }
                }
            }
        }
