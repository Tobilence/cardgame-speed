//
//  SpeedGame.swift
//  cardgame.speed
//
//  Created by Tobias Furtlehner on 05.04.20.
//  Copyright © 2020 Tobias Furtlehner. All rights reserved.
//

import Foundation

class SpeedGame: ObservableObject {
    
    private var timer: SpeedOpponent!
    private var cardDeck:CardDeck = CardDeck()
    var gameStarted = false
    @Published var ownScore:Int = 0
    @Published var opponentScore:Int = 0
    @Published var ownCards:[Card] = []
    var opponentCards:[Card] = []
    @Published var showingCards:[Card] = []
    @Published var gameOver = false
    @Published var placeholders = [Bool](repeating: false, count: 5)
    
    init() {
        do {
            for _ in 1...5 {
                self.ownCards.append(cardDeck.pickCard()!)
                self.opponentCards.append(cardDeck.pickCard()!)
            }
            for _ in 1...2 {
                self.showingCards.append(cardDeck.pickCard()!)
            }
        }
    }
    
    func startGame() {
        timer = SpeedOpponent(speedGame: self)
        gameStarted = true
        timer.start()
    }
    
    func opponentPlaceCard() {
        var didPlace = false
        
        opponentCards.forEach( { opponentCard in
            //if card is placeable
            if !opponentCard.placeholder && !didPlace, let placeableIndex = whereToPlace(card: opponentCard) {
                //place card
                showingCards[placeableIndex] = opponentCard
                opponentScore += 1
                didPlace = true
                
                let opponentCardIndex = opponentCards.firstIndex{$0 === opponentCard}
                //check if any cards are left in the deck
                if let newCard = cardDeck.pickCard() {
                    //replace opponentCard with new Card
                    opponentCards[opponentCardIndex!] = newCard
                } else {
                    //no more cards in deck
                    opponentCard.placeholder = true
                    checkGameOver()
                }
            }
        })
        if unplaceableState() {
            renewShowCards()
        }
    }
    
    func playerPlaceCard(card: Card) {
        //checks if card can be placed
        if let placeableIndex = whereToPlace(card: card) {
            //place Card
            showingCards[placeableIndex] = card
            ownScore += 1
            
            let cardIndex = ownCards.firstIndex{$0 === card}
            //check if any cards are left
            if let newCard = cardDeck.pickCard() {
                ownCards[cardIndex!] = newCard
            } else {
                //No more cards in Deck
                placeholders[cardIndex!] = true
                card.placeholder = true
                checkGameOver()
            }
        }
    }
    
    func isPlaceholder(card: Card) -> Bool {
        return placeholders[ownCards.firstIndex{$0 === card}!]
    }
    
    private func checkGameOver() {
        var gameOver = true
        showingCards.forEach( { showCard in
            
            ownCards.forEach { card in
                if placeable(card, showCard) && !card.placeholder {
                    gameOver = false
                }
            }
            
            opponentCards.forEach { card in
                if placeable(card, showCard) && !card.placeholder {
                    gameOver = false
                }
            }
            
        })
        self.gameOver = gameOver
        if(self.gameOver) {
            print("GAMEOVER - \(evaluateWinner())")
        }
    }
    
    private func renewShowCards() {
        if(cardDeck.cards.count >= 2) {
            for showCardIndex in showingCards.indices {
                showingCards[showCardIndex] = cardDeck.pickCard()!
            }
        }
        else {
            print("GAMEOVER - \(evaluateWinner())")
        }
    }
    
    func evaluateWinner() -> String {
        if opponentScore > ownScore {
            return "Opponent Won!"
        } else if opponentScore == ownScore{
            return "It's a tie!"
        } else {
            return "You Won!"
        }
    }
    
    private func unplaceableState() -> Bool {
        var placeable = false
        ownCards.forEach( { ownCard in
            if whereToPlace(card: ownCard) != nil {
                placeable = true
            }
        })
        
        opponentCards.forEach( {opponentCard in
            if whereToPlace(card: opponentCard) != nil {
                placeable = true
            }
        })
        return !placeable
    }
    
    ///checks at which index a card can be Placed
    private func whereToPlace(card: Card) -> Int? {
        for (index, showCard) in showingCards.enumerated() {
            if placeable(card, showCard) {
                return index
            }
        }
        return nil
    }
    
    ///checks if the given card can replace a current ShowCard
    private func placeable(_ card: Card, _ showCard: Card) -> Bool {
            return (card.value.rawValue == showCard.value.rawValue + 1) ||
                    (card.value.rawValue == showCard.value.rawValue - 1) ||
                    (card.value.rawValue == 1 && showCard.value.rawValue == 13) ||
                    (card.value.rawValue == 13 && showCard.value.rawValue == 1)
    }
}
