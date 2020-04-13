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
    var placeholder: Bool
    var buttonImageName: String {
        get {
            if placeholder {
                return "blue_back"
            }
            else {
                return value.imageSyntax() + type.imageSyntax()
            }
        }
    }
    var imageName: String {
        get {
            return value.imageSyntax() + type.imageSyntax()
        }
    }
    
    init(type: CardType, value: CardValue){
        self.type = type
        self.value = value
        self.placeholder = false
    }
    
    init(type: CardType, value: CardValue, viewable: Bool){
        self.type = type
        self.value = value
        self.placeholder = viewable
    }
    
    func isHigher(than card: CardValue) -> Bool {
        return value.rawValue > card.rawValue
    }
    
    func isEqual(to card: CardValue) -> Bool {
        return value.rawValue == card.rawValue
    }
}
