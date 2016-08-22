//
//  King.swift
//  Chess
//
//  Created by Adnan Zahid on 8/8/16.
//  Copyright © 2016 Chess. All rights reserved.
//

import Foundation

class King: Piece {
    
    override init(color: Color, position: Square, hasMoved: Bool, delegate: PieceDelegate?) {
        super.init(color: color, position: position, hasMoved: hasMoved, delegate: delegate)
        
        symbol = kKingSymbol
        
        value = abs(kKingValue)
        
        /**
         * King directions
         */
        directionsList.append(( 1,  1))
        directionsList.append(( 1, -1))
        directionsList.append((-1,  1))
        directionsList.append((-1, -1))
        
        directionsList.append(( 1,  0))
        directionsList.append(( 0,  1))
        directionsList.append((-1,  0))
        directionsList.append(( 0, -1))
        
        moveStrategy = LimitedMoveStrategy(directionsList: directionsList)
    }
    
    override func move(toSquare: Square) -> Bool {
        
        let result: Bool = King.move(position, toSquare: toSquare, directionsList: directionsList)
        
        updatePosition(result, toSquare: toSquare)
        
        return result
    }
    
    static func move(position: Square, toSquare: Square, directionsList: [(Int, Int)]) -> Bool {
        
        var result: Bool = false
        
        for direction in directionsList {
            
            result = direction == getFileAndRankAdvance(Move(fromSquare: position, toSquare: toSquare))
            
            if result == true {
                
                break
            }
        }
        
        return result
    }
}