//
//  SpeedViewWrapper.swift
//  cardgame.speed
//
//  Created by Tobias Furtlehner on 11.04.20.
//  Copyright © 2020 Tobias Furtlehner. All rights reserved.
//

import SwiftUI

struct SpeedViewWrapper: View {
    
    @EnvironmentObject var viewRouter:ViewRouter
    @EnvironmentObject var speedGame:SpeedGame
    
    var body: some View {
        ZStack {
            if self.speedGame.gameOver {
                GameOverPage()
                    .environmentObject(self.viewRouter)
                    .environmentObject(self.speedGame)
                    .transition(.opacity)
            } else {
                SpeedView()
                    .environmentObject(self.speedGame)
                    .environmentObject(self.viewRouter)
            }
        }
    }
}

struct SpeedViewWrapper_Previews: PreviewProvider {
    static var previews: some View {
        SpeedViewWrapper()
    }
}
