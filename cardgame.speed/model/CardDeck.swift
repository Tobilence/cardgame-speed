//
//  CardDeck.swift
//  cardgame.speed
//
//  Created by Tobias Furtlehner on 03.04.20.
//  Copyright © 2020 Tobias Furtlehner. All rights reserved.
//

import Foundation

class CardDeck {
    
    var cards: [Card]
    
    
    //default constructor, cards will automatically get shuffled
    init() {
        var cards:[Card] = []
        for type in CardType.allCases {
            for value in CardValue.allCases {
                cards.append(Card(type: type, value: value))
            }
        }
        self.cards = cards
        self.cards.shuffle()
    }
    
    //Constructor with optional cardshuffle
    init(_ shuffled: Bool) {
        var cards:[Card] = []
        for type in CardType.allCases {
            for value in CardValue.allCases {
                cards.append(Card(type: type, value: value))
            }
        }
        self.cards = cards
        if shuffled {
            self.cards.shuffle()
        }
    }
    
    //shuffles the cards
    func shuffle() {
        self.cards.shuffle()
    }
    
    //returns a card, and removes it from the deck
    func pickCard() throws -> Card {
        if (cards.count == 0) {
            throw CardError.notEnoughCards
        }
        let randomNumber = Int.random(in: 0...cards.count-1)
        let pickedCard = cards[randomNumber]
        cards.remove(at: randomNumber)
        return pickedCard
    }
}
