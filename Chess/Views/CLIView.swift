//
//  CLIView.swift
//  Chess
//
//  Created by Adnan Zahid on 8/22/16.
//  Copyright © 2016 Chess. All rights reserved.
//

class CLIView: InputHandler, OutputHandler {
    
    var isGUIViewAvailable: Bool = false
    
    weak var inputHandlerDelegate: InputHandlerDelegate?
    
    func input() {
        
        var input: String = readLine(stripNewline: true)!
        
        input = input.capitalizedString
        
        let fromFile: String = input[0]
        let fromRank: String = input[1]
        
        let toFile: String = input[2]
        let toRank: String = input[3]
        
        if fromFile >= "A"
            && fromFile <= "H"
            
            && fromRank >= "1"
            && fromRank <= "8"
            
            && toFile >= "A"
            && toFile <= "H"
            
            && toRank >= "1"
            && toRank <= "8" {
            
            let fromSquare: Square = Square(
                
                file: FileIndex(rawValue: Character(fromFile).asciiValue - kAsciiDifferenceForFile)!,
                
                rank: RankIndex(rawValue: Character(fromRank).asciiValue - kAsciiDifferenceForRank)!)
            
            let toSquare: Square = Square(
                
                file: FileIndex(rawValue: Character(toFile).asciiValue - kAsciiDifferenceForFile)!,
                
                rank: RankIndex(rawValue: Character(toRank).asciiValue - kAsciiDifferenceForRank)!)
            
            inputHandlerDelegate?.didTakeInput(Move(fromSquare: fromSquare, toSquare: toSquare))
        }
    }
    
    func setup() {
        
        for rank in (allPiecesRankEnumeration).reverse() {
            for file in allPiecesFileEnumeration {
                
                if let _ = Board.sharedInstance.pieceArray[rank][file] {
                    
                    var symbol: String = Board.sharedInstance.pieceArray[rank][file]!.symbol
                    
                    if Board.sharedInstance.pieceArray[rank][file]!.color == Color.black {
                        symbol = symbol.lowercaseString
                    }
                    
                    print(symbol, separator: "", terminator: " ")
                    
                } else {
                    
                    print(kNilSymbol, separator: "", terminator: " ")
                }
            }
            
            print(kNewLineSymbol, separator: "", terminator: "")
        }
        
        print()
        print("---------------")
        print()
    }
    
    /**
     * PRINT THE BOARD - Simple as possible view for command line
     */
    func output(move: Move) {
        
        setup()
    }
    
    /**
     * CANCEL MOVE on VIEW
     */
    func cancelMove() {
        
    }
}