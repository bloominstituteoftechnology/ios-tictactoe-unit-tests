//
//  BoardViewController.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

protocol BoardViewControllerDelegate: class {
    //Do Nothing
}

class BoardViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for button in buttons {
            button.layer.borderWidth = 2.0
            button.layer.borderColor = UIColor.black.cgColor
        }
        
        updateButtons()
    }
    
    //MARK: - Properties
    var delegate: GameViewController?
    
    @IBAction func mark(_ sender: UIButton) {
        do {
            try delegate?.gameController.makeMark(at: coordinate(for: sender))
            delegate?.updateViews()
        } catch {
            print("Error making mark: \(error)")
        }
    }
    
    // MARK: - Private
    func updateButtons() {
        
        if !isViewLoaded {
            return
        }
        
        guard let gameController = delegate?.gameController else {
            print("Bad gameController")
            return
        }
        
        print("Button Updated")
        
        let board = gameController.board
        
        
        for x in 0..<3 {
            for y in 0..<3 {
                let coord = (x, y)
                let button = self.button(for: coord)
                if let mark = board[coord] {
                    button.setTitle(mark.stringValue, for: .normal)
                } else {
                    button.setTitle(" ", for: .normal)
                }
            }
        }
    }
    
    private func button(for coordinate: Coordinate) -> UIButton {
        let tag = coordinate.y * 3 + coordinate.x
        return view.viewWithTag(tag) as! UIButton
    }
    
    private func coordinate(for button: UIButton) -> Coordinate {
        let tag = button.tag
        let x = tag % 3
        let y = tag / 3
        return (x, y)
    }
    
    // MARK: - Properties
    var board: GameBoard? {
        didSet {
            updateButtons()
        }
    }
    
    @IBOutlet var buttons: [UIButton]!
}
