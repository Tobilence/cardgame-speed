//
//  CardType.swift
//  cardgame.speed
//
//  Created by Tobias Furtlehner on 03.04.20.
//  Copyright © 2020 Tobias Furtlehner. All rights reserved.
//

import Foundation

enum CardType: CaseIterable {
    case spades, clubs, diamonds, hearts
    
    func cardColor() -> String {
        switch self {
        case .spades:
            return "Black"
        case .clubs:
            return "Black"
        default:
            return "Red"
        }
    }
    
    func imageSyntax() -> String{
        switch self {
        case .spades:
            return "S"
        case .clubs:
            return "C"
        case .hearts:
            return "H"
        default:
            return "D"
        }
    }
}
