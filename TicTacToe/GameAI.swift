//
//  GameAI.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
let winCases:[[Int]] = [
	[0, 1, 2],
	[3, 4, 5],
	[6, 7, 8],

	[0, 3, 6],
	[1, 4, 7],
	[2, 5, 8],

	[0, 4, 8],
	[2, 4, 6]
]

func gameWon(board: GameBoard, by player: GameBoard.Mark) -> Bool {
	for win in winCases {
		var correct = true
		for index in win {
			correct = correct && (board[index] == player)
		}

		if correct {
			return true
		}
	}

    return false
}

func nextMove(_ board: GameBoard, for player: GameBoard.Mark) -> Int {
	if board.isEmpty {
		// if we're going first,
		// pick the top-left
		// this is optimal play for X
		return 0
	}

	var potentialMoves:[(priority:Int, loc:Int)] = []
	for win in winCases {
		var slots = [0, 0, 0]
		var playerCount = 0
		var enemyCount = 0
		for i in 0...2 {
			let square = board[win[i]]

			if let square = square {
				if square == player {
					slots[i] = 1
					playerCount += 1
				} else {
					slots[i] = -1
					enemyCount += 1
				}
			}
		}

		// can we win the game this turn?
		if playerCount == 2 && enemyCount == 0 {
			for i in 0...2 {
				if slots[i] == 0 {
					// we should _always_ go here to win the game
					return win[i]
				}
			}
		}

		// if we don't have a square in the triple
		// we want to disrupt the enemy's win
		if playerCount == 0 && enemyCount == 2 {
			for i in 0...2 {
				if slots[i] == 0 {
					return win[i]
				}
			}
		}

		// save move and priority
		// all empty = 0
		// one player mark = 1
		// disrupt? = 2

		if playerCount == 0 && enemyCount == 1  {
			// prioritize disprutping enemy
			for i in 0...2 {
				if slots[i] == 0 {
					potentialMoves.append((priority:3, loc:win[i]))
				}
			}
		} else if playerCount == 1 && enemyCount == 1 {
			// don't pick unless we really have to
			// neither of us can win this row
			for i in 0...2 {
				if slots[i] == 0 {
					potentialMoves.append((priority:0, loc:win[i]))
				}
			}
		} else if playerCount == 0 && enemyCount == 0 {
			// nothing's here, so ... it's fine?
			for i in 0...2 {
				if slots[i] == 0 {
					potentialMoves.append((priority:1, loc:win[i]))
				}
			}
		} else if playerCount == 1 && enemyCount == 0 {
			// neat, keep going!
			for i in 0...2 {
				if slots[i] == 0 {
					potentialMoves.append((priority:2, loc:win[i]))
				}
			}

		}
	}

	assert(potentialMoves.count > 0)

	// if it's available, always pick the center
	// this forces many more games to tie
	for move in potentialMoves {
		if move.loc == 4 {
			return 4
		}
	}

	// otherwise
	// get a random move out of all the high priority moves
	potentialMoves.sort(by: { $0.priority > $1.priority })
	let moves = potentialMoves.filter({$0.priority >= potentialMoves.first?.priority ?? 0})

	let random = Int(arc4random_uniform(UINT32_MAX) % UInt32(moves.count))
	return moves[random].loc
}
