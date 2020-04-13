//
//  GameOverPage.swift
//  cardgame.speed
//
//  Created by Tobias Furtlehner on 11.04.20.
//  Copyright © 2020 Tobias Furtlehner. All rights reserved.
//

import SwiftUI

struct GameOverPage: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var speedGame: SpeedGame
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
            }
            Text(speedGame.evaluateWinner())
                .background(Color.white)
                .foregroundColor(.black)
                .font(.title)
            Spacer()
        }
        .background(
            Image("homescreen-background")
                .resizable()
                .aspectRatio(contentMode: .fill)
        )
        .edgesIgnoringSafeArea(.all)
    }
}

struct GameOverPage_Previews: PreviewProvider {
    static var previews: some View {
        GameOverPage()
            .environmentObject(ViewRouter())
            .environmentObject(SpeedGame())
    }
}
