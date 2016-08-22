//
//  LimitedMoveStrategy.swift
//  Chess
//
//  Created by Adnan Zahid on 8/16/16.
//  Copyright © 2016 Chess. All rights reserved.
//

import Foundation

class LimitedMoveStrategy: MoveStrategy {
    
    override func generateMove(position: Square, fileRankPair: (Int, Int)) -> [Square] {
        
        var possibleMovesToSquaresList: [Square] = []
        let newPosition: Square = position + fileRankPair
        
        if Board.sharedInstance.checkIfSquareIsNotNil(newPosition) {
            
            possibleMovesToSquaresList.append(newPosition)
        }
        
        return possibleMovesToSquaresList
    }
}