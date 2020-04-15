//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, BoardViewControllerDelegate {
    
    var game = Game() {
        didSet {
            updateViews()
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        updateViews()
    }
    
    @IBAction func restartGame(_ sender: UIButton) {
        game.restart()
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
        
        boardViewController.board = game.board
        
        if game.gameIsOver {
            //restartButton.pulsate()
            pulsateButton()
            if let player = game.winningPlayer {
                statusLabel.text = "Player \(player.stringValue) won!"
            } else {
                statusLabel.text = "Cat's game!"
            }
        } else if let player = game.activePlayer {
            statusLabel.text = "Player \(player.stringValue)'s turn"
        }
    }
    
    private func setupViews() {
        statusLabel.textColor = .black
        
        let buttonHeight = restartButton.bounds.size.height
        restartButton.layer.cornerRadius = buttonHeight / 2
        restartButton.layer.shadowOffset = CGSize(width: 2,height: 4)
        restartButton.layer.shadowOpacity = 0.9
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EmbedBoard" {
            boardViewController = segue.destination as? BoardViewController
        }
    }
}

extension UIButton {
    func pulsate() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        
        pulse.duration = 1.2
        pulse.fromValue = 0.95
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = 2
        pulse.initialVelocity = 0.25
        pulse.damping = 1.0
        
        layer.add(pulse, forKey: nil)
    }
}

extension GameViewController {
    func pulsateButton() {
        UIView.animate(withDuration: 0.45,
                       delay: 0,
                       options: [.curveEaseOut, .allowUserInteraction],
                       animations: {
                        
                        self.restartButton.transform = CGAffineTransform(scaleX: 1.07, y: 1.07)
                        
        }) { _ in
            UIView.animate(withDuration: 0.45,
                           delay: 0,
                           options: [.curveEaseIn, .allowUserInteraction],
                           animations: {
                            
                            self.restartButton.transform = .identity
                            
            }) { _ in
                if self.game.gameIsOver {
                self.pulsateButton()
                }
            }
        }
    }
}
