//
//  UnlimitedMoveStrategy.swift
//  Chess
//
//  Created by Adnan Zahid on 8/16/16.
//  Copyright © 2016 Chess. All rights reserved.
//

import Foundation

class UnlimitedMoveStrategy: MoveStrategy {
    
    override func generateMove(position: Square, fileRankPair: (Int, Int)) -> [Square] {
        
        var possibleMovesToSquaresList: [Square] = []
        var newPosition: Square = position + fileRankPair
        
        while Board.sharedInstance.checkIfSquareIsNotNil(newPosition) {
            
            possibleMovesToSquaresList.append(newPosition)
            
            newPosition = newPosition + fileRankPair
        }
        
        return possibleMovesToSquaresList
    }
}