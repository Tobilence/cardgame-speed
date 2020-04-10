//
//  GameError.swift
//  cardgame.speed
//
//  Created by Tobias Furtlehner on 03.04.20.
//  Copyright © 2020 Tobias Furtlehner. All rights reserved.
//

import Foundation

enum GameError: Error {
    case cardNotPlaceable
    case noMorePlaceableCards
}
