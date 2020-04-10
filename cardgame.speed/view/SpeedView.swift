//
//  SpeedView.swift
//  cardgame.speed
//
//  Created by Tobias Furtlehner on 01.04.20.
//  Copyright © 2020 Tobias Furtlehner. All rights reserved.
//

import SwiftUI

struct SpeedView: View {
    
    @EnvironmentObject var viewRouter:ViewRouter
    @EnvironmentObject var speedGame:SpeedGame
    
    var body: some View {
        VStack {
            HStack (spacing: 50) {
                ScoreView(displayOpponent: true)
                    .environmentObject(speedGame)
                    .padding(.leading, 50)
                ForEach(speedGame.opponentCards) { card in
                    Image("red_back")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                Spacer()
            }.padding()
            Spacer()
            HStack (spacing: 50) {
                Spacer()
                ForEach(speedGame.showingCards) { card in
                    Image(card.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.leading)
                }
                Spacer()
            }
            Spacer()
            HStack (spacing: 50) {
                ForEach(speedGame.ownCards) { card in
                    Button(action: {
                        do {
                            if self.speedGame.gameStarted {
                                try self.speedGame.placeOwnCard(card)
                            }
                            else {
                                self.speedGame.startGame()
                                try self.speedGame.placeOwnCard(card)
                            }
                        } catch {
                            print(error)
                        }
                    }) {
                        Image(card.imageName)
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                }
                ScoreView(displayOpponent: false)
                    .environmentObject(speedGame)
                    .padding(.trailing, 50)
            }
        }
        .background(
            Image("game-background")
                .resizable()
                .aspectRatio(contentMode: .fill)
        )
        .edgesIgnoringSafeArea(.all)
    }
}

struct GamePage_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SpeedView()
                .environmentObject(ViewRouter())
                .environmentObject(SpeedGame())
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (11-inch) (2nd generation)"))
                .previewLayout(.fixed(width: 1112, height: 834))
                .previewDisplayName("iPad")
            
            SpeedView()
                .environmentObject(ViewRouter())
                .environmentObject(SpeedGame())
                .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
                .previewLayout(.fixed(width: 812, height: 375))
                .previewDisplayName("iPhone XS Max")
        }
    }
}
