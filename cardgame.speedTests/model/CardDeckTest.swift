//
//  CardDeckTest.swift
//  cardgame.speedTests
//
//  Created by Tobias Furtlehner on 03.04.20.
//  Copyright © 2020 Tobias Furtlehner. All rights reserved.
//

import XCTest
import Foundation
@testable import cardgame_speed

final class CardDeckTests: XCTestCase {
    
    var cardDeck: CardDeck = CardDeck()
    
    override func setUp() {
        self.cardDeck = CardDeck()
    }
    
    func testInit(){
        XCTAssertEqual(52, cardDeck.cards.count)
    }
    
    func testShuffle() {
        var shuffles = [cardDeck.cards]
        for _ in 0...10 {
            cardDeck.shuffle()
            shuffles.append(cardDeck.cards)
        }
        for shuffle in shuffles {
            var count = 0
            for sh in shuffles {
                if shuffle == sh {
                    count+=1
                }
            }
            if(count > 1) {
                XCTAssertTrue(false)
            }
        }
    }
    
    func testPickACard(){
        for _ in 1...52 {
            do {
                let pickedCard = try cardDeck.pickCard()
                XCTAssertFalse(cardDeck.cards.contains(pickedCard))
                XCTAssertNotNil(pickedCard)
            } catch {
                print("unexpected error in pickACardTest")
                XCTAssertTrue(false)
            }
        }
        XCTAssertThrowsError(try cardDeck.pickCard()) { error in
            XCTAssertEqual(error as! CardError, CardError.notEnoughCards)
        }
    }
}
