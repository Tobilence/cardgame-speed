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
    
    var body: some View {
        ZStack {
            if self.viewRouter.currentView == "StartPage" {
                StartPage()
                    .environmentObject(self.viewRouter)
            } else if self.viewRouter.currentView == "GamePage" {
                GamePage()
                    .environmentObject(self.viewRouter)
            } else if self.viewRouter.currentView == "SettingsPage"{
                SettingsPage()
                    .environmentObject(self.viewRouter)
            }
        }
    }
}

struct MotherView_Preview: PreviewProvider {
    static var previews: some View {
        MotherView()
    }
}
