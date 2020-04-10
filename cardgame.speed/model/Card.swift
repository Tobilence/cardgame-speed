//
//  Card.swift
//  cardgame.speed
//
//  Created by Tobias Furtlehner on 03.04.20.
//  Copyright © 2020 Tobias Furtlehner. All rights reserved.
//

import Foundation

class Card: Identifiable {
    
    let id = UUID()
    var type: CardType
    var value: CardValue
    var viewable: Bool
    var imageName: String {
        get {
            return value.imageSyntax() + type.imageSyntax()
        }
    }
    
    init(type: CardType, value: CardValue){
        self.type = type
        self.value = value
        self.viewable = false
    }
    
    init(type: CardType, value: CardValue, viewable: Bool){
        self.type = type
        self.value = value
        self.viewable = viewable
    }
    
    func isHigher(than card: CardValue) -> Bool {
        return value.rawValue > card.rawValue
    }
    
    func isEqual(to card: CardValue) -> Bool {
        return value.rawValue == card.rawValue
    }
}
