//
//  StartPage.swift
//  cardgame.speed
//
//  Created by Tobias Furtlehner on 01.04.20.
//  Copyright © 2020 Tobias Furtlehner. All rights reserved.
//

import SwiftUI

struct MotherView: View {
    
    @EnvironmentObject var viewRouter:ViewRouter
    @EnvironmentObject var globalSettings:GlobalSettings
    
    var body: some View {
        ZStack {
            if self.viewRouter.currentView == "StartPage" {
                StartPage()
                    .environmentObject(self.viewRouter)
                    .transition(.identity)
            } else if self.viewRouter.currentView == "GamePage" || self.viewRouter.currentView == "GameOverPage" {
                SpeedViewWrapper()
                    .environmentObject(self.viewRouter)
                    .environmentObject(SpeedGame())
                    .transition(.identity)
                
            } else if self.viewRouter.currentView == "SettingsPage" {
                SettingsPage()
                    .environmentObject(self.viewRouter)
                    .transition(.identity)
            } else {
                Text("Error in Motherview")
            }
        }
    }
}

struct MotherView_Preview: PreviewProvider {
    static var previews: some View {
        MotherView()
        .environmentObject(ViewRouter())
        .environmentObject(GlobalSettings())
    }
}
