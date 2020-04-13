//
//  GameViewWrapper.swift
//  cardgame.speed
//
//  Created by Tobias Furtlehner on 11.04.20.
//  Copyright © 2020 Tobias Furtlehner. All rights reserved.
//

import SwiftUI

struct GameViewWrapper: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var speedGame: SpeedGame
    
    var body: some View {
        ZStack {
            
        }
    }
}

struct GameViewWrapper_Previews: PreviewProvider {
    static var previews: some View {
        GameViewWrapper()
    }
}
