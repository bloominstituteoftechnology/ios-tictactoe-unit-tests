//
//  BoardViewController.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

protocol BoardViewControllerDelegate: class {
    func boardViewController(_ boardViewController: BoardViewController, markWasMadeAt coordinate: Coordinate)
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
    
    @IBAction func mark(_ sender: UIButton) {
        delegate?.boardViewController(self, markWasMadeAt: coordinate(for: sender))
    }
    
    // MARK: - Private

    public func updateButtons() {
        guard let board = board, isViewLoaded else { return }
        
        for x in 0..<3 {
            for y in 0..<3 {
                let coord = (x, y)
                let button = self.button(for: coord)
                print(board[coord] as Any)
                
                if let mark = board[coord] {
                    print("Success placing mark: \(mark)")
                    button.setTitle(mark.stringValue, for: [])
                } else {
                    button.setTitle(" ", for: [])
                    
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
    
//    var game: Game? {
//        didSet {
//            print("Changes: ")
//            updateButtons()
//        }
//    }
    
    weak var delegate: BoardViewControllerDelegate?
    
    @IBOutlet var buttons: [UIButton]!
}
