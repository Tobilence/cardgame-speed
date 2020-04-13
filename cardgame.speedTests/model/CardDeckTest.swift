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
    
    var cardDeck: CardDeck!
    
    override func setUp() {
        self.cardDeck = CardDeck()
    }
    
    func testInit(){
        XCTAssertEqual(52, cardDeck.cards.count)
    }
    
    func testPickACard(){
        for _ in 1...52 {
            XCTAssert(cardDeck.pickCard() != nil)
        }
        
        XCTAssert(cardDeck.pickCard() == nil)
    }
}

