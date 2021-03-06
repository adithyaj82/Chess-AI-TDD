//
//  UnlimitedMoveStrategy.swift
//  Chess
//
//  Created by Adnan Zahid on 8/16/16.
//  Copyright © 2016 Chess. All rights reserved.
//

class UnlimitedMoveStrategy: MoveStrategy {
    
    override func generateMove(_ position: Square, fileRankPair: (Int, Int)) -> [Square] {
        
        var possibleMovesToSquaresList: [Square] = []
        var newPosition: Square = position + fileRankPair
        
        while Board.sharedInstance.checkIfSquareIsNotNil(newPosition)
            
            && Board.sharedInstance.checkIfEmptyOrEnemyPieceExists(color, square: newPosition)
            
            && Board.sharedInstance.checkForClearPath(Move(fromSquare: position, toSquare: newPosition)) {
                
                possibleMovesToSquaresList.append(newPosition)
                
                newPosition = newPosition + fileRankPair
        }
        
        return possibleMovesToSquaresList
    }
}
