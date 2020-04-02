//
//  SpeedView.swift
//  cardgame.speed
//
//  Created by Tobias Furtlehner on 01.04.20.
//  Copyright © 2020 Tobias Furtlehner. All rights reserved.
//

import SwiftUI

struct GamePage: View {
    
    @EnvironmentObject var viewRouter:ViewRouter
    
    var body: some View {
        Button(action: {
            self.viewRouter.currentView = "StartPage"
        }) {
            Text("Back")
        }
    }
}

struct GamePage_Previews: PreviewProvider {
    static var previews: some View {
        GamePage()
    }
}
