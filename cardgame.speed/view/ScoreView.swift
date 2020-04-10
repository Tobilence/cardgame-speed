//
//  ScoreView.swift
//  cardgame.speed
//
//  Created by Tobias Furtlehner on 08.04.20.
//  Copyright © 2020 Tobias Furtlehner. All rights reserved.
//

import SwiftUI

struct ScoreView: View {
    @EnvironmentObject var speedGame: SpeedGame
    @State var displayOpponent: Bool
    
    var body: some View {
        VStack {
            if displayOpponent {
                Text("Opponent Score")
                    .foregroundColor(.white)
                    .font(.custom("Akronim", size: 30))
                Text("\(speedGame.opponentScore)")
                    .foregroundColor(.white)
                    .font(.custom("Akronim", size: 30))
            } else {
                Text("Your Score")
                    .foregroundColor(.white)
                    .font(.custom("Akronim", size: 30))
                Text("\(speedGame.ownScore)")
                    .foregroundColor(.white)
                    .font(.custom("Akronim", size: 30))
            }
            
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(displayOpponent: true)
    }
}
