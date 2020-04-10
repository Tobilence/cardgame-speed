//
//  TimerHolder.swift
//  cardgame.speed
//
//  Created by Tobias Furtlehner on 10.04.20.
//  Copyright © 2020 Tobias Furtlehner. All rights reserved.
//

import Foundation

class SpeedOpponent : ObservableObject {
    var timer : Timer!
    @Published var count = 0
    var speedGame: SpeedGame
    
    init(speedGame: SpeedGame) {
        self.speedGame = speedGame
    }
    
    func start() {
        self.timer?.invalidate()
        self.count = 0
        self.timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) {
            _ in
            self.count += 1
            self.speedGame.opponentPlaceCard()
            print(self.count)
        }
    }
}
