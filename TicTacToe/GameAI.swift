//
//  GameAI.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

func game(board: GameBoard, isWonBy player: GameBoard.Mark) -> Bool {
	//vertical wins
	if (board[(0,0)] == player && board[(0,1)] == player  && board[(0,2)] == player ) ||
		(board[(1,0)] == player  && board[(1,1)] == player  && board[(1,2)] == player ) ||
		(board[(2,0)] == player  && board[(2,1)] == player  && board[(2,2)] == player ) {
		return true
	}
	
	//horizontal wins
	if (board[(0,0)] == player && board[(1,0)] == player  && board[(2,0)] == player ) ||
		(board[(0,1)] == player  && board[(1,1)] == player  && board[(2,1)] == player ) ||
		(board[(0,2)] == player  && board[(1,2)] == player  && board[(2,2)] == player ) {
		return true
	}
	
	//diagonal wins
	if (board[(0,0)] == player && board[(1,1)] == player  && board[(2,2)] == player ) ||
		(board[(0,2)] == player  && board[(1,1)] == player  && board[(2,0)] == player ) {
		return true
	}
	
	return false
}
