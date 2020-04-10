//
//  SpeedGame.swift
//  cardgame.speed
//
//  Created by Tobias Furtlehner on 05.04.20.
//  Copyright © 2020 Tobias Furtlehner. All rights reserved.
//

import Foundation

class SpeedGame: ObservableObject {
    
    var cardDeck:CardDeck = CardDeck()
    var gameStarted = false
    var timer: SpeedOpponent!
    @Published var ownScore:Int = 0
    @Published var opponentScore:Int = 0
    @Published var ownCards:[Card] = []
    @Published var opponentCards:[Card] = []
    @Published var showingCards:[Card] = []
    @Published var gameOver = false
    
    init() {
        do {
            for _ in 1...5 {
                self.ownCards.append(try cardDeck.pickCard())
                self.opponentCards.append(try cardDeck.pickCard())
            }
            for _ in 1...2 {
                self.showingCards.append(try cardDeck.pickCard())
            }
        } catch {
            print(error)
        }
    }
    
    func startGame() {
        timer = SpeedOpponent(speedGame: self)
        gameStarted = true
        timer.start()
    }
    
    ///checks if opponent can place a card - if he can then the card gets placed
    ///if opponent can't place a card, check if the player can - if he can't then renew the showing cards
    func opponentPlaceCard(){
        var opponentCardPlaced = false
        for (index, card) in opponentCards.enumerated() {
            do {
                let showingCardIndex = try cardIsPlaceable(card)
                showingCards[showingCardIndex] = card
                opponentCardPlaced = true
                opponentCards[index] = try cardDeck.pickCard()
            } catch GameError.cardNotPlaceable {
                print("Opponent Card not placeable: \(card.imageName)")
            } catch {
                print(error)
            }
        }
        if opponentCardPlaced {
            opponentScore += 1
        }
        else {
            var playerCanPlace = false
            for card in ownCards {
                do {
                    try cardIsPlaceable(card)
                    playerCanPlace = true
                } catch {
                    print("player can't place card either")
                }
            }
            if !playerCanPlace {
                renewShowingCards()
            }
        }
    }
    
    /// replaces the showCard with the given card
    /// replaces the ownCard with a random new Card from the deck (if possible)
    /// throws if the card cant replace a showCard or if no Cards are left in the deck
    func placeOwnCard(_ card: Card) throws{
        do {
            let placeableIndex = try cardIsPlaceable(card)
            showingCards[placeableIndex] = card
            let indexOfOwnCard = ownCards.firstIndex(where: {ownCard in
                ownCard === card
            })
            ownCards[indexOfOwnCard!] = try cardDeck.pickCard()
            ownScore += 1
        }
        catch (CardError.notEnoughCards) {
            if !(opponentCards.count > 0 && ownCards.count > 0) {
                self.gameOver = true
            }
        }
        catch {
            throw error
        }
    }
    
    /// checks if the card can replace a showCard
    /// returns the index of the showCard which can be replaced by the card
    /// throws if the card can't be placed
    private func cardIsPlaceable(_ card: Card) throws -> Int {
        for i in showingCards.indices {
            
            if     card.value.rawValue == showingCards[i].value.rawValue - 1
                || card.value.rawValue == showingCards[i].value.rawValue + 1
                || card.value == showingCards[i].value
                || card.value.rawValue == 1 && showingCards[i].value.rawValue == 13
                || card.value.rawValue == 13 && showingCards[i].value.rawValue == 1
            {
                return i
            }
        }
        throw GameError.cardNotPlaceable
    }
    
    ///places 2 new showingCards and gets rid of the old ones
    private func renewShowingCards() {
        print("RENEW")
        for (index, _) in showingCards.enumerated() {
            do {
                showingCards[index] = try cardDeck.pickCard()
            } catch CardError.notEnoughCards {
                if showingCards.count != 2 {
                    gameOver = true
                }
            } catch {
                print(error)
            }
        }
    }
}
