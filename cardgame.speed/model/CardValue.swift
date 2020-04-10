//
//  CardValue.swift
//  cardgame.speed
//
//  Created by Tobias Furtlehner on 03.04.20.
//  Copyright © 2020 Tobias Furtlehner. All rights reserved.
//

import Foundation

enum CardValue: Int, CaseIterable {
    case ace = 1
    case two,three,four,five,six,seve,eight,nine,ten
    case jack,queen,king
    
    func description() -> String {
        switch self{
        case .ace:
            return "Ace"
        case .jack:
            return "Jack"
        case .queen:
            return "Queen"
        case .king:
            return "King"
        default:
            return String(rawValue)
        }
    }
    
    func imageSyntax() -> String {
        switch self {
        case .ace:
            return "A"
        case .jack:
            return "J"
        case .queen:
            return "Q"
        case .king:
            return "K"
        default:
            return String(rawValue)
        }
    }
}
